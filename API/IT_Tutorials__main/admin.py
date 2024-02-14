from django.contrib import admin
from . import models


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
