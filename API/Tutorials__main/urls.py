from django.urls import path
from django.views.generic import TemplateView
from . import views

urlpatterns = [
    path("", TemplateView.as_view(template_name="testPage.html")),
    path(
        "tutorials/",
        views.TutorialViewSet.as_view(
            {"get": "list", "post": "create", "delete": "deleteAll"}
        ),
    ),
    path(
        "tutorials/<str:uuid>/",
        views.TutorialViewSet.as_view(
            {"get": "retrieve", "put": "update", "delete": "deleteOne"}
        ),
    ),
]
