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


# Връща списък обяви
class PostsListSerializerView(APIView):
    def get(self, request, category):
        if category==0:
            queryset = UserPost.objects.all()
        else:
            queryset = UserPost.objects.filter(category_id=category)
        serializer = PostsSerializer(queryset, many=True, context={"request": request})
        return Response(serializer.data)
