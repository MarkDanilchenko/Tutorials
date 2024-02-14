# Generated by Django 5.0.2 on 2024-02-14 10:36

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('IT_Tutorials__main', '0003_alter_tutorial_publish_date'),
    ]

    operations = [
        migrations.AlterField(
            model_name='tutorial',
            name='publish_date',
            field=models.DateField(default=datetime.date.today, help_text='Tutorial publish date in format YYYY-MM-DD', verbose_name='Tutorial publish date'),
        ),
    ]
