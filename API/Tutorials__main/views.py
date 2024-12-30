from rest_framework import viewsets, permissions, status
from rest_framework.decorators import action, permission_classes
from rest_framework.generics import get_object_or_404
from rest_framework.response import Response
import datetime
from . import models, serializers


class AccountViewSet(viewsets.ModelViewSet):
    serializer_class = serializers.UserSerializer
    pagination_class = None
    permission_classes_by_action = {
        "create": [permissions.AllowAny],
        "retrieve": [permissions.IsAuthenticated],
    }

    def get_permissions(self):
        try:
            return [
                permission()
                for permission in self.permission_classes_by_action[self.action]
            ]
        except KeyError:
            return [permission() for permission in self.permission_classes]

    def create(self, request, *args, **kwargs):
        user = self.serializer_class(data=request.data)
        user.is_valid(raise_exception=True)
        user.save()

        return Response(
            status=status.HTTP_201_CREATED,
        )

    def retrieve(self, request, *args, **kwargs):
        user = request.user
        user_serialized = dict(self.serializer_class(user, many=False).data)

        return Response({"profile": user_serialized}, status=status.HTTP_200_OK)


class TutorialViewSet(viewsets.ModelViewSet):
    serializer_class = serializers.TutorialSerializer
    pagination_class = None
    permission_classes_by_action = {
        "list": [permissions.AllowAny],
        "retrieve": [permissions.AllowAny],
        "create": [permissions.IsAuthenticated],
        "update": [permissions.IsAuthenticated],
        "destroy": [permissions.IsAdminUser],
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

    def retrieve(self, request, uuid):
        tutorial = get_object_or_404(models.Tutorial.objects.filter(id=uuid))

        tutorial_serialized = self.serializer_class(tutorial, many=False).data

        return Response({"tutorial": tutorial_serialized}, status=status.HTTP_200_OK)

    def create(self, request):
        isPublished = request.data.get("isPublished").lower()

        if isPublished and isPublished == "true":
            request.data["published_at"] = datetime.datetime.now()

        tutorial_serialized = self.serializer_class(data=request.data)

        if tutorial_serialized.is_valid(raise_exception=True):
            tutorial_serialized.save()

            return Response(status=status.HTTP_201_CREATED)

    def update(self, request, uuid):
        tutorial = get_object_or_404(models.Tutorial, id=uuid)
        isPublished = request.data.get("isPublished")

        if tutorial.created_by.id != request.user.id:
            return Response(
                status=status.HTTP_403_FORBIDDEN,
            )

        if isPublished:
            request.data["published_at"] = datetime.datetime.now()

        tutorial_serialized = self.serializer_class(tutorial, data=request.data)

        if tutorial_serialized.is_valid(raise_exception=True):
            tutorial_serialized.save()

            return Response(status=status.HTTP_200_OK)

    def deleteAll(self, request):
        result = models.Tutorial.objects.all()
        result.delete()

        return Response(status=status.HTTP_204_NO_CONTENT)

    def deleteOne(self, request, uuid):
        tutorial = get_object_or_404(models.Tutorial, id=uuid)
        tutorial.delete()

        return Response(status=status.HTTP_204_NO_CONTENT)
