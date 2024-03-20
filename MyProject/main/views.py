from django.shortcuts import render
from django.views.generic.base import View
from rest_framework.views import APIView
from rest_framework.response import Response

from .models import Category
from .serializers import *


def index(request):
    return render(request,  'main/index.html')


# R E S T   У С Л У Г И
# Връща списък на категориите дрехи
class CategorySerializerView(APIView):
    def get(self, request):
        queryset = Category.objects.order_by('order')
        serializer = CategorySerializer(queryset, many=True, context={"request": request})
        return Response(serializer.data)


# Връща списък на размерите дрехи
class SizeSerializerView(APIView):
    def get(self, request):
        queryset = Size.objects.order_by('order')
        serializer = SizesSerializer(queryset, many=True, context={"request": request})
        return Response(serializer.data)


# Връща списък обяви според категория
class PostsListSerializerView(APIView):
    def get(self, request, category):
        if category == 0:
            queryset = UserPost.objects.all()
        else:
            queryset = UserPost.objects.filter(category_id=category)
        serializer = PostsSerializer(queryset, many=True, context={"request": request})
        return Response(serializer.data)


# Връща списък обяви според категория
class PostsByUserSerializerView(APIView):
    def get(self, request, user_id):
        if user_id == 0:
            queryset = UserPost.objects.all()
        else:
            queryset = UserPost.objects.filter(user=user_id)
        serializer = CommentsByUserSerializer(queryset, many=True, context={"request": request})
        return Response(serializer.data)


# Проверка дали съществува определен потребител
class LoginSerializerView(APIView):
    def post(self, request):
        print("--->", request.data)
        usr = request.data['user']
        pwd = request.data['password']
        users = AppUser.objects.filter(username=usr, password=pwd)
        serializer = UsersSerializer(users, many=True, context={"request": request})
        return Response(serializer.data)


# Записва данни за нов потребител
class AddUserSerializerView(APIView):
    def post(self, request):
        new_useer = AppUser.objects.create_user(name=request.data['name'],
                                                mail=request.data['email'],
                                                username=request.data['user'],
                                                password=request.data['password'])
        print("--->", new_useer)
        return Response(status=201)


# Записва отзив
class AddCommentSerializerView(APIView):
    def post(self, request):
        data = {'post_id': UserPost.objects.filter(id=request.data['post_id']).get(),
                'name': request.data['name'],
                'mail': request.data['mail'],
                'phone': request.data['phone'],
                'message': request.data['message'], }
        new_comment = Comment.objects.create_comment(data)
        print("comment -> ", new_comment)
        return Response(status=201)


# Обява - премахване
class PostDeleteAPIView(APIView):
    def post(self, request):
        idx = request.data['id']
        print('idx=', idx)
        UserPost.objects.filter(id=idx).delete()
        return Response(status=201)


# Обява - запис
# Обява - създаване на нова
class PostNewAPIView(APIView):
    def post(self, request):
        cat_id = Category.objects.filter(id=request.data['category']).get()
        size_id = Size.objects.filter(id=request.data['size']).get()
        user_id = AppUser.objects.filter(id=request.data['user']).get()
        task = UserPost.objects.create_post(cat_id, size_id, user_id)
        task.save()
        return Response(task.id)


# Обява - запис на тялото
class PostSaveAPIView(APIView):
    def post(self, request):
        print(request.data)
        data = PostSaveSerializer(data=request.data)
        if data.is_valid():
            data.save()
        else:
            print('error validation: ', data.errors)
        return Response(status=201)


# Обява - запис на картинката
class PostPictureSaveAPIView(APIView):
    def post(self, request):
        print(request.data)
        data = PostFileSerializer(data=request.data)
        if data.is_valid():
            data.save(id=request.data['id'])
        return Response(status=201)

