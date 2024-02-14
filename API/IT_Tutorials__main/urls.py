from django.urls import path, re_path
from django.views.generic import TemplateView
from . import views

urlpatterns = [
    path("", TemplateView.as_view(template_name="testPage.html")),
    path(
        "api/tutorials/",
        views.TutorialViewSet.as_view(
            {"get": "list", "post": "create", "delete": "destroy"}
        ),
    ),
    path(
        "api/tutorials/published/",
        views.TutorialPublishedViewSet.as_view({"get": "list"}),
    ),
    path(
        "api/tutorials/<int:pk>/",
        views.TutorialDetailedViewSet.as_view(
            {"get": "retrieve", "put": "update", "delete": "destroy"}
        ),
    ),
]
