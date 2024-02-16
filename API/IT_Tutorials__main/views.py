from rest_framework import viewsets, permissions, status, filters
from rest_framework.decorators import action
from rest_framework.generics import get_object_or_404
from rest_framework.response import Response
import datetime
from . import models
from . import serializers


# --------------------REST API----------------------
# --------------------REST API----------------------
# --------------------REST API----------------------


class TutorialViewSet(viewsets.ModelViewSet):
    serializer_class = serializers.TutorialSerializer
    pagination_class = None
    permission_classes = [permissions.AllowAny]

    def list(self, request, *args, **kwargs):
        if request.query_params.get("q"):
            result = (
                models.Tutorial.objects.filter(
                    title__icontains=request.query_params.get("q")
                )
                .order_by("title")
                .first()
            )
            if result:
                result_serialized = self.serializer_class(result, many=False).data
                return Response(
                    {"tutorial": result_serialized}, status=status.HTTP_200_OK
                )
            else:
                return Response(
                    {"Error": "No results found"}, status=status.HTTP_404_NOT_FOUND
                )
        else:
            result = models.Tutorial.objects.all().order_by("title")
            result_serialized = self.serializer_class(result, many=True).data
            return Response({"tutorials": result_serialized}, status=status.HTTP_200_OK)

    def create(self, request):
        if request.data.get("published") == False and request.data.get("publish_date"):
            del request.data["publish_date"]
        elif request.data.get("published") and not request.data.get("publish_date"):
            request.data["publish_date"] = datetime.date.today().strftime("%Y-%m-%d")
        result_serialized = self.serializer_class(data=request.data)
        if result_serialized.is_valid():
            result_serialized.save()
            return Response(
                {"Tutorial was successfully created!": result_serialized.data},
                status=status.HTTP_201_CREATED,
            )
        return Response(
            {"Error!": result_serialized.errors}, status=status.HTTP_400_BAD_REQUEST
        )

    def destroy(self, request):
        result = models.Tutorial.objects.all()
        result.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)


class TutorialPublishedViewSet(viewsets.ModelViewSet):
    serializer_class = serializers.TutorialSerializer
    pagination_class = None
    permission_classes = [permissions.AllowAny]

    def list(self, request):
        result = models.Tutorial.objects.filter(published=True).order_by("title")
        result_serialized = self.serializer_class(result, many=True).data
        return Response(
            {"tutorials_published": result_serialized}, status=status.HTTP_200_OK
        )


class TutorialDetailedViewSet(viewsets.ModelViewSet):
    serializer_class = serializers.TutorialSerializer
    pagination_class = None
    permission_classes = [permissions.AllowAny]

    def retrieve(self, request, pk):
        result = get_object_or_404(models.Tutorial, pk=pk)
        result_serialized = self.serializer_class(result).data
        return Response(
            {"Selected tutorial": result_serialized}, status=status.HTTP_200_OK
        )

    def update(self, request, pk):
        result = get_object_or_404(models.Tutorial, pk=pk)
        if request.data.get("published") == False and request.data.get("publish_date"):
            del request.data["publish_date"]
        elif request.data.get("published") and not request.data.get("publish_date"):
            request.data["publish_date"] = datetime.date.today().strftime("%Y-%m-%d")
        result_serialized = self.serializer_class(result, data=request.data)
        if result_serialized.is_valid():
            result_serialized.save()
            return Response(
                {"Tutorial was successfully updated!": result_serialized.data},
                status=status.HTTP_202_ACCEPTED,
            )
        return Response(
            {"Error!": result_serialized.errors}, status=status.HTTP_400_BAD_REQUEST
        )

    def destroy(self, request, pk):
        result = get_object_or_404(models.Tutorial, pk=pk)
        result.delete()
        return Response(
            {"Tutorial was successfully deleted": f"(ID: {pk})"},
            status=status.HTTP_200_OK,
        )
