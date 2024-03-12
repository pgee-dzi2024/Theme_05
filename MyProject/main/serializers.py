from rest_framework import serializers
from .models import UserPost, AppUser, Comment, Size, Category



# Сериализатор  КАТЕГОРИИ
class CategorySerializer(serializers.ModelSerializer):
    class Meta:
        model = Category
        fields = "__all__"


# Сериализатор  РАЗМЕРИ
class SizesSerializer(serializers.ModelSerializer):
    class Meta:
        model = Size
        fields = "__all__"


# Сериализатор  РАЗМЕРИ
class SizesSerializer(serializers.ModelSerializer):
    class Meta:
        model = Size
        fields = "__all__"
