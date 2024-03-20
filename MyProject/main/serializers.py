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


class CommentsByUserSerializer(serializers.ModelSerializer):
    post = CommentsSerializer(many=True)

    class Meta:
        model = UserPost
        fields = '__all__'


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


# Сериализатори ЗАПИС НА ОБЯВА

# Сериализатор СЪЗДАВАНЕ НА ОБЯВА
# Сериализатор ЗАПИС НА ОБЯВА
class PostSaveSerializer(serializers.ModelSerializer):
    ids = serializers.IntegerField()

    class Meta:
        model = UserPost
        fields = ('id', 'ids', 'title', 'price', 'category', 'size', 'description', 'remark', 'user')

    def create(self, validated_data):
        i = validated_data.get('ids')
        title = validated_data.get('title')
        price = validated_data.get('price')
        category = validated_data.get('category')
        size = validated_data.get('size')
        description = validated_data.get('description')
        remark = validated_data.get('remark')
        user = validated_data.get('user')

        test = UserPost.objects.update_or_create(
            id=i,
            defaults={'title': title, 'price': price, 'category': category, 'size': size, 'description': description,
                      'remark': remark, 'user': user})
        return test


# Сериализатор ЗАПИС НА СНИМКА
class PostFileSerializer(serializers.ModelSerializer):
    class Meta:
        model = UserPost
        fields = ('id', 'picture')

    def create(self, validated_data):
        image = validated_data.get('picture')
        item = UserPost.objects.update_or_create(id=validated_data.get("id"), defaults={'picture': image})
        return item

