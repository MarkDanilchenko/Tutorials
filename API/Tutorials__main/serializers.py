from rest_framework import serializers
from . import models


# If there is an OTM relation, the main model serializer should be inherited from the dynamic serializer,
# then in the child model you can select fields from the main table to display.
class DynamicFieldsModelSerializer(serializers.ModelSerializer):
    def __init__(self, *args, **kwargs):
        fields = kwargs.pop("fields", None)

        super().__init__(*args, **kwargs)

        if fields is not None:
            allowed = set(fields)
            existing = set(self.fields)
            for field_name in existing - allowed:
                self.fields.pop(field_name)


class UserSerializer(DynamicFieldsModelSerializer):
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
        exclude = [
            "password",
            "groups",
            "user_permissions",
            "is_active",
            "is_staff",
            "is_superuser",
        ]


class TutorialSerializer(serializers.ModelSerializer):
    created_by = serializers.PrimaryKeyRelatedField(
        queryset=models.User.objects.all(), many=False
    )

    # GET method: Custom representation with part of data from the main table in a linked table
    def to_representation(self, instance):
        result = super().to_representation(instance)
        result["created_by"] = UserSerializer(
            instance.created_by, fields=["username", "first_name", "last_name", "email"]
        ).data

        return result

    class Meta:
        model = models.Tutorial
        fields = "__all__"
        depth = 1
