# Generated by Django 5.1.4 on 2024-12-26 21:03

import django.db.models.deletion
from django.conf import settings
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ("Tutorials__main", "0001_initial"),
    ]

    operations = [
        migrations.AddField(
            model_name="tutorial",
            name="created_by",
            field=models.ForeignKey(
                help_text="User who created the tutorial",
                null=True,
                on_delete=django.db.models.deletion.CASCADE,
                to=settings.AUTH_USER_MODEL,
                verbose_name="User who created the tutorial",
            ),
        ),
    ]
