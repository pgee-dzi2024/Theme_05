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


# Сериализатор  КОМЕНТАРИ
class CommentsSerializer(serializers.ModelSerializer):
    class Meta:
        model = Comment
        fields = "__all__"


# Сериализатор  ОБЯВИ
class PostsSerializer(serializers.ModelSerializer):
    class Meta:
        model = UserPost
        fields = "__all__"
        depth = 1
