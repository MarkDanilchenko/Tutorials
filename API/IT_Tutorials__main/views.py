from rest_framework import viewsets, permissions, status
from rest_framework.decorators import action, permission_classes
from rest_framework.generics import get_object_or_404
from rest_framework.response import Response
import datetime
from . import models
from . import serializers


# --------------------REST API----------------------
# --------------------REST API----------------------
# --------------------REST API----------------------


class SignUpViewSet(viewsets.ModelViewSet):
    serializer_class = serializers.UserSerializer
    permission_classes = [permissions.AllowAny]
    pagination_class = None

    def create(self, request, *args, **kwargs):
        result = self.serializer_class(data=request.data)
        result.is_valid(raise_exception=True)
        result.save()
        return Response(
            {
                "created": f'User "{result.data.get("username")}" was successfully created.'
            },
            status=status.HTTP_201_CREATED,
        )


class UserProfileView(viewsets.ModelViewSet):
    serializer_class = serializers.UserSerializer
    permission_classes = [permissions.IsAuthenticated]
    pagination_class = None

    def list(self, request, *args, **kwargs):
        currentUser = dict(self.serializer_class(request.user, many=False).data)
        del currentUser["password"]
        return Response({"profile": currentUser}, status=status.HTTP_200_OK)


class TutorialViewSet(viewsets.ModelViewSet):
    serializer_class = serializers.TutorialSerializer
    pagination_class = None
    permission_classes_by_action = {
        "list": [permissions.AllowAny],
        "create": [permissions.IsAuthenticated],
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

    def list(self, request, *args, **kwargs):
        if request.query_params.get("q"):
            result = (
                models.Tutorial.objects.filter(
                    title__icontains=request.query_params.get("q")
                )
                .order_by("-title")
                .first()
            )
            if result:
                result_serialized = self.serializer_class(result, many=False).data
                return Response(
                    {"tutorial": result_serialized}, status=status.HTTP_200_OK
                )
            else:
                return Response(
                    {
                        "tutorial": "No one tutorial found. Please, try again or check your request!"
                    },
                    status=status.HTTP_404_NOT_FOUND,
                )
        else:
            result = models.Tutorial.objects.all().order_by("-title")
            result_serialized = self.serializer_class(result, many=True).data
            return Response({"tutorials": result_serialized}, status=status.HTTP_200_OK)

    def create(self, request):
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
            request.data.get("published") == True
            # from JSON: "published": "true" (string), from Insomnia: "published": true (boolean)
            or request.data.get("published") == "true"
        ):
            request.data["publish_date"] = datetime.date.today().strftime("%Y-%m-%d")
        result_serialized = self.serializer_class(data=request.data)
        if result_serialized.is_valid():
            result_serialized.save()
            return Response(status=status.HTTP_201_CREATED)
        return Response(
            {"error": result_serialized.errors}, status=status.HTTP_400_BAD_REQUEST
        )

    def destroy(self, request):
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
