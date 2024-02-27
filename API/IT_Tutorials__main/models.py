import datetime
import re
from django.db import models
from django.contrib.auth.models import AbstractUser


def name_validator(value):
    if re.search(r"^[a-zA-Z]{2,}$", value):
        return value
    else:
        raise ValueError("First name or last name contains invalid characters.")


class User(AbstractUser):
    username = models.CharField(
        max_length=100,
        unique=True,
        help_text="Username",
        verbose_name="Username",
    )

    first_name = models.CharField(
        validators=[name_validator],
        max_length=100,
        help_text="First name",
        verbose_name="First name",
    )

    last_name = models.CharField(
        validators=[name_validator],
        max_length=100,
        help_text="Last name",
        verbose_name="Last name",
    )

    email = models.EmailField(
        unique=True,
        help_text="Email",
        verbose_name="Email",
    )

    class Meta:
        verbose_name = "User"
        verbose_name_plural = "Users"
        ordering = ["username"]

    def __str__(self):
        return self.username


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
