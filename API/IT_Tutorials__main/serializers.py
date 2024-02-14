from . import models
from rest_framework import serializers


class TutorialSerializer(serializers.ModelSerializer):
    publish_date = serializers.DateField(format="%Y-%m-%d", default=None)

    class Meta:
        model = models.Tutorial
        fields = "__all__"
