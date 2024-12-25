from django.conf import settings
from django.conf.urls.static import static
from django.contrib import admin
from django.urls import path, include
from Tutorials__main import views
from rest_framework_simplejwt.views import (
    TokenObtainPairView,
    TokenRefreshView,
    TokenBlacklistView,
)

urlpatterns = [
    path("admin/", admin.site.urls),
    path(
        "api/v1/token/retrieve/", TokenObtainPairView.as_view(), name="token_retrieve"
    ),
    path("api/v1/token/refresh/", TokenRefreshView.as_view(), name="token_refresh"),
    path(
        "api/v1/token/blacklist/", TokenBlacklistView.as_view(), name="token_blacklist"
    ),
    path(
        "api/v1/account/signup/",
        views.AccountViewSet.as_view({"post": "create"}),
        name="signup",
    ),
    path(
        "api/v1/account/profile/",
        views.AccountViewSet.as_view({"get": "retrieve"}),
        name="profile",
    ),
    path("api/v1/", include("Tutorials__main.urls")),
]

if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
