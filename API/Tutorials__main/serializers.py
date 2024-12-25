from rest_framework import serializers
from . import models


class UserSerializer(serializers.ModelSerializer):
    def create(self, data):
        username = data.get("username")
        first_name = data.get("first_name")
        last_name = data.get("last_name")
        email = data.get("email")
        password = data.get("password")
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

    class Meta:
        model = models.Tutorial
        fields = "__all__"
