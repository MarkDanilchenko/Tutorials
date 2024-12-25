import re
from django.db import models
from django.contrib.auth.models import AbstractUser


def name_validator(value: str) -> str:
    """
    Validate the first name or last name by checking if it only contains letters.
    Args:
        value (str): The value to be validated.
    Returns:
        str: The validated value if it contains only letters.
    Raises:
        ValueError: If the value contains invalid characters.
    """
    if re.search(r"^[a-zA-Z]{2,100}$", value):
        return value

    raise ValueError(
        "First name or last name contains invalid characters. Only letters are allowed."
    )


def email_validator(value: str) -> str:
    """
    Validate the email by checking if it is a valid email address.
    Args:
        value (str): The value to be validated.
    Returns:
        str: The validated value if it is a valid email address.
    Raises:
        ValueError: If the value is not a valid email address.
    """
    if re.search(r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$", value):
        return value

    raise ValueError("Invalid email address.")


class User(AbstractUser):
    id = models.UUIDField(
        primary_key=True, null=False, auto_created=True, help_text="User ID"
    )

    username = models.CharField(
        max_length=100,
        unique=True,
        null=False,
        help_text="Username",
        verbose_name="Username",
    )

    first_name = models.CharField(
        validators=[name_validator],
        blank=True,
        null=True,
        default="",
        max_length=100,
        help_text="First name",
        verbose_name="First name",
    )

    last_name = models.CharField(
        validators=[name_validator],
        blank=True,
        null=True,
        default="",
        max_length=100,
        help_text="Last name",
        verbose_name="Last name",
    )

    email = models.EmailField(
        validators=[email_validator],
        unique=True,
        null=False,
        help_text="Email",
        verbose_name="Email",
    )

    class Meta:
        verbose_name = "User"
        verbose_name_plural = "Users"
        ordering = ["-username"]

    def __str__(self):
        return self.username


class Tutorial(models.Model):
    id = models.UUIDField(
        primary_key=True, null=False, auto_created=True, help_text="Tutorial ID"
    )

    title = models.CharField(
        max_length=100,
        unique=True,
        null=False,
        help_text="Tutorial title",
        verbose_name="Tutorial title",
    )

    description = models.TextField(
        blank=True,
        null=True,
        default="",
        max_length=1000,
        help_text="Tutorial description",
        verbose_name="Tutorial description",
    )

    isPublished = models.BooleanField(
        default=False,
        null=False,
        help_text="Is published",
        verbose_name="Is published",
    )

    published_at = models.DateTimeField(
        blank=False,
        null=True,
        default=None,
        help_text="Date and time when the tutorial was published",
        verbose_name="Date and time when the tutorial was published",
    )

    created_at = models.DateTimeField(
        auto_now_add=True,
        help_text="Date and time when the tutorial was created",
        verbose_name="Date and time when the tutorial was created",
    )

    updated_at = models.DateTimeField(
        auto_now=True,
        help_text="Date and time when the tutorial was last updated",
        verbose_name="Date and time when the tutorial was last updated",
    )

    class Meta:
        verbose_name = "Tutorial"
        verbose_name_plural = "Tutorials"
        ordering = ["-updated_at"]

    def __str__(self):
        return self.title
