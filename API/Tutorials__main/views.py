from rest_framework import viewsets, permissions, status
from rest_framework.decorators import action, permission_classes
from rest_framework.generics import get_object_or_404
from rest_framework.response import Response
import datetime
from . import models, serializers


class AccountViewSet(viewsets.ModelViewSet):
    serializer_class = serializers.UserSerializer
    permission_classes = [permissions.AllowAny]
    pagination_class = None

    def create(self, request, *args, **kwargs):
        user = self.serializer_class(data=request.data)
        user.is_valid(raise_exception=True)
        user.save()

        return Response(
            status=status.HTTP_201_CREATED,
        )

    @action(
        methods=["get"], detail=True, permission_classes=[permissions.IsAuthenticated]
    )
    def retrieve(self, request, *args, **kwargs):
        user = request.user
        user_serialized = dict(self.serializer_class(user, many=False).data)
        del user_serialized["password"]

        return Response({"profile": user_serialized}, status=status.HTTP_200_OK)


class TutorialViewSet(viewsets.ModelViewSet):
    serializer_class = serializers.TutorialSerializer
    pagination_class = None
    permission_classes_by_action = {
        "list": [permissions.AllowAny],
        "create": [permissions.IsAuthenticated],
        "destroyAll": [permissions.IsAdminUser],
    }

    def get_permissions(self):
        try:
            return [
                permission()
                for permission in self.permission_classes_by_action[self.action]
            ]
        except KeyError:
            return [permission() for permission in self.permission_classes]

    def list(self, request, *args, **kwargs):
        query = request.query_params.get("q")

        if query:
            tutorials = models.Tutorial.objects.filter(title__icontains=query).order_by(
                "-updated_at"
            )
        else:
            tutorials = models.Tutorial.objects.all().order_by("-updated_at")

        if not len(tutorials):
            return Response(
                status=status.HTTP_404_NOT_FOUND,
            )

        tutorials_serialized = self.serializer_class(tutorials, many=True).data

        return Response({"tutorials": tutorials_serialized}, status=status.HTTP_200_OK)

    def create(self, request):
        isPublished = request.data.get("isPublished")

        if isPublished:
            request.data["published_at"] = datetime.date.today().strftime("%Y-%m-%d")

        tutorial_serialized = self.serializer_class(data=request.data)

        if tutorial_serialized.is_valid(raise_exception=True):
            tutorial_serialized.save()

            return Response(status=status.HTTP_201_CREATED)

    def destroyAll(self, request):
        result = models.Tutorial.objects.all()
        result.delete()

        return Response(status=status.HTTP_204_NO_CONTENT)


class TutorialDetailedViewSet(viewsets.ModelViewSet):
    serializer_class = serializers.TutorialSerializer
    pagination_class = None
    permission_classes_by_action = {
        "retrieve": [permissions.AllowAny],
        "update": [permissions.IsAuthenticated],
        "destroy": [permissions.IsAdminUser],
    }

    # override get_permissions method to use permission_classes_by_action
    def get_permissions(self):
        try:
            return [
                permission()
                for permission in self.permission_classes_by_action[self.action]
            ]
        except KeyError:
            return [permission() for permission in self.permission_classes]

    def retrieve(self, request, pk):
        result = get_object_or_404(models.Tutorial, pk=pk)
        result_serialized = self.serializer_class(result).data
        return Response({"tutorial": result_serialized}, status=status.HTTP_200_OK)

    def update(self, request, pk):
        result = get_object_or_404(models.Tutorial, pk=pk)
        if (
            request.data.get("published") == False
            # from JSON: "published": "false" (string), from Insomnia: "published": false (boolean)
            or request.data.get("published") == "false"
        ):
            if request.data.get("publish_date"):
                del request.data["publish_date"]
            else:
                pass
        elif (
            request.data.get("published") == "true"
            # from JSON: "published": "true" (string), from Insomnia: "published": true (boolean)
            or request.data.get("published") == True
        ):
            request.data["publish_date"] = datetime.date.today().strftime("%Y-%m-%d")
        result_serialized = self.serializer_class(result, data=request.data)
        if result_serialized.is_valid():
            result_serialized.save()
            return Response(
                status=status.HTTP_200_OK,
            )
        return Response(
            {"error": result_serialized.errors}, status=status.HTTP_400_BAD_REQUEST
        )

    def destroy(self, request, pk):
        result = get_object_or_404(models.Tutorial, pk=pk)
        result.delete()
        return Response(
            {"deleted": f"Tutorial was successfully deleted (ID: {pk})"},
            status=status.HTTP_200_OK,
        )
