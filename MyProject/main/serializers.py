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


# Сериализаторi  КОМЕНТАРИ
class CommentsSerializer(serializers.ModelSerializer):
    class Meta:
        model = Comment
        fields = "__all__"


class CommentsByUserSerializer(serializers.ModelSerializer):
    post = CommentsSerializer(many=True)

    class Meta:
        model = UserPost
        fields = '__all__'
        depth = 1

# Сериализатор  ОБЯВИ
class PostsSerializer(serializers.ModelSerializer):
    class Meta:
        model = UserPost
        fields = "__all__"
        depth = 1


# Сериализатор  ПОТРЕБИТЕЛИ
class UsersSerializer(serializers.ModelSerializer):
    class Meta:
        model = AppUser
        fields = "__all__"
