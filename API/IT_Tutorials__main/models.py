import datetime
from django.db import models


class Tutorial(models.Model):
    title = models.CharField(
        max_length=100,
        blank=False,
        unique=True,
        default="",
        help_text="Tutorial title",
        verbose_name="Tutorial title",
    )
    description = models.TextField(
        max_length=1000,
        blank=False,
        default="",
        help_text="Tutorial description",
        verbose_name="Tutorial description",
    )
    published = models.BooleanField(
        blank=False,
        default=False,
        help_text="Tutorial published",
        verbose_name="Tutorial published",
    )
    publish_date = models.DateField(
        blank=True,
        null=True,
        default="",
        help_text="Tutorial publish date in format YYYY-MM-DD",
        verbose_name="Tutorial publish date",
    )

    class Meta:
        verbose_name = "Tutorial"
        verbose_name_plural = "Tutorials"
        ordering = ["publish_date"]

    def __str__(self):
        return self.title
