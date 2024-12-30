from django.contrib import admin
from django.contrib.auth.admin import UserAdmin
from . import models


class TutorialInline(admin.TabularInline):
    extra = 1
    model = models.Tutorial


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
    list_filter = ("is_staff", "is_active", "is_superuser", "date_joined", "last_login")
    search_fields = ("username", "first_name", "last_name", "email")
    ordering = ("-username",)
    inlines = (TutorialInline,)


admin.site.register(models.User, User_Admin)


class TutorialAdmin(admin.ModelAdmin):
    fieldsets = (
        ("Tutorial title and description", {"fields": ("title", "description")}),
        ("Is published", {"fields": ("isPublished", "published_at")}),
        ("Creation & update date", {"fields": ("created_at", "updated_at")}),
        ("User", {"fields": ("user",)}),
    )
    list_display = (
        "title",
        "description",
        "isPublished",
        "published_at",
        "created_at",
        "updated_at",
    )
    list_filter = (
        "title",
        "isPublished",
        "published_at",
        "created_at",
        "updated_at",
    )
    search_fields = (
        "title",
        "description",
        "isPublished",
    )
    ordering = ("-created_at",)
    list_per_page = 10


admin.site.register(models.Tutorial, TutorialAdmin)
