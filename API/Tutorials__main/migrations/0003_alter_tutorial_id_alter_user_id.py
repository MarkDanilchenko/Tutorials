# Generated by Django 5.1.4 on 2024-12-27 20:55

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('Tutorials__main', '0002_tutorial_created_by'),
    ]

    operations = [
        migrations.AlterField(
            model_name='tutorial',
            name='id',
            field=models.UUIDField(auto_created=True, editable=False, help_text='Tutorial ID', primary_key=True, serialize=False),
        ),
        migrations.AlterField(
            model_name='user',
            name='id',
            field=models.UUIDField(auto_created=True, editable=False, help_text='User ID', primary_key=True, serialize=False),
        ),
    ]
