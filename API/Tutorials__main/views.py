from rest_framework import viewsets, permissions, status, pagination
from rest_framework.generics import get_object_or_404
from rest_framework.response import Response
import datetime
from . import models, serializers
from . import constants
from django.db.models import Q


class TutorialPagination(pagination.PageNumberPagination):
    page_size = constants.PAGINATION_LIMIT
    max_page_size = constants.PAGINATION_MAX_LIMIT
    page_size_query_param = constants.PAGE_SIZE_NAME
    page_query_param = constants.PAGE_NAME

    def get_paginated_response(self, data):
        return Response(
            {
                "count": self.page.paginator.count,
                "tutorials": data,
            },
            status=status.HTTP_200_OK,
        )


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
        user_serialized = self.serializer_class(user, many=False).data

        return Response(user_serialized, status=status.HTTP_200_OK)


class TutorialViewSet(viewsets.ModelViewSet):
    serializer_class = serializers.TutorialSerializer
    pagination_class = TutorialPagination
    permission_classes_by_action = {
        "list": [permissions.AllowAny],
        "retrieve": [permissions.AllowAny],
        "create": [permissions.IsAuthenticated],
        "update": [permissions.IsAuthenticated],
        "deleteOne": [permissions.IsAuthenticated],
        "deleteAll": [permissions.IsAdminUser],
    }

    def get_permissions(self):
        try:
            return [
                permission()
                for permission in self.permission_classes_by_action[self.action]
            ]
        except KeyError:
            return [permission() for permission in self.permission_classes]

    def list(self, request):
        query = request.query_params.get("q")
        filter = request.query_params.get("filter")

        if filter == "published":
            tutorials = models.Tutorial.objects.filter(
                published_at__isnull=False
            ).order_by("-updated_at")
        elif filter == "notPublished":
            tutorials = models.Tutorial.objects.filter(
                published_at__isnull=True
            ).order_by("-updated_at")
        else:
            tutorials = models.Tutorial.objects.all().order_by("-updated_at")

        if query:
            tutorials = tutorials.filter(
                Q(title__icontains=query) | Q(description__icontains=query)
            )

        if not len(tutorials):
            return Response(
                status=status.HTTP_404_NOT_FOUND,
            )

        tutorials_serialized = self.serializer_class(tutorials, many=True).data
        paginated_tutorials = self.paginate_queryset(tutorials_serialized)
        paginated_response = self.get_paginated_response(paginated_tutorials)

        return paginated_response

    def retrieve(self, request, id):
        tutorial = get_object_or_404(models.Tutorial.objects.filter(id=id))

        tutorial_serialized = self.serializer_class(tutorial, many=False).data

        return Response(tutorial_serialized, status=status.HTTP_200_OK)

    def create(self, request):
        userId = request.user.id
        isPublished = request.data.get("isPublished")

        if isPublished is True:
            request.data["published_at"] = datetime.datetime.now()

        request.data["created_by"] = userId

        tutorial_serialized = self.serializer_class(data=request.data)

        if tutorial_serialized.is_valid(raise_exception=True):
            tutorial_serialized.save()

            return Response(status=status.HTTP_201_CREATED)

    def update(self, request, id):
        tutorial = get_object_or_404(models.Tutorial.objects.filter(id=id))
        isPublished = request.data.get("isPublished")

        if tutorial.created_by.id != request.user.id and not (
            request.user.is_staff or request.user.is_superuser
        ):
            return Response(
                status=status.HTTP_403_FORBIDDEN,
            )

        if request.data.get("created_by"):
            return Response(
                "You cannot change the user who created the tutorial",
                status=status.HTTP_400_BAD_REQUEST,
            )

        if isPublished is True:
            request.data["published_at"] = datetime.datetime.now()

        tutorial_serialized = self.serializer_class(
            tutorial, data=request.data, partial=True
        )

        if tutorial_serialized.is_valid(raise_exception=True):
            tutorial_serialized.save()

            return Response(status=status.HTTP_200_OK)

    def deleteAll(self, request):
        result = models.Tutorial.objects.all()
        result.delete()

        return Response(status=status.HTTP_204_NO_CONTENT)

    def deleteOne(self, request, id):
        tutorial = get_object_or_404(models.Tutorial.objects.filter(id=id))

        if tutorial.created_by.id != request.user.id and not (
            request.user.is_staff or request.user.is_superuser
        ):
            return Response(
                status=status.HTTP_403_FORBIDDEN,
            )

        tutorial.delete()

        return Response(status=status.HTTP_204_NO_CONTENT)
