from . import models
from rest_framework import serializers


class UserSerializer(serializers.ModelSerializer):
    def create(self, validated_data):
        username = validated_data.get("username")
        first_name = validated_data.get("first_name")
        last_name = validated_data.get("last_name")
        email = validated_data.get("email")
        password = validated_data.get("password")
        user = models.User(
            username=username,
            first_name=first_name,
            last_name=last_name,
            email=email,
        )
        user.set_password(password)
        user.save()
        return user

    class Meta:
        model = models.User
        fields = "__all__"


class TutorialSerializer(serializers.ModelSerializer):
    publish_date = serializers.DateField(format="%Y-%m-%d", default=None)

    class Meta:
        model = models.Tutorial
        fields = "__all__"
