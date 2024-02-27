from django.contrib import admin
from django.contrib.auth.admin import UserAdmin
from . import models


class User_Admin(UserAdmin):
    list_display = (
        "username",
        "first_name",
        "last_name",
        "email",
        "is_staff",
        "is_active",
        "is_superuser",
        "date_joined",
        "last_login",
    )
    search_fields = ("username", "first_name", "last_name", "email")
    list_filter = ("is_staff", "is_active", "is_superuser", "date_joined", "last_login")
    ordering = ("-username",)


admin.site.register(models.User, User_Admin)


class TutorialAdmin(admin.ModelAdmin):
    fieldsets = (
        ("Tutorial headers and description", {"fields": ("title", "description")}),
        ("Tutorial publish date", {"fields": ("publish_date",)}),
        ("Tutorial publish status", {"fields": ("published",)}),
    )
    list_display = (
        "title",
        "description",
        "published",
        "publish_date",
    )
    list_filter = (
        "published",
        "publish_date",
    )
    list_per_page = 10
    search_fields = (
        "title",
        "description",
    )


admin.site.register(models.Tutorial, TutorialAdmin)
