from django.urls import path
from . import views

from django.conf import settings
from django.conf.urls.static import static

urlpatterns = [
    path('', views.index),
    path('api/categories/', views.CategorySerializerView.as_view()),
    path('api/sizes/', views.SizeSerializerView.as_view()),
    path('api/posts/<int:category>/', views.PostsListSerializerView.as_view()),
    path('api/check/<int:user_id>/', views.PostsByUserSerializerView.as_view()),
    path('api/delete/', views.PostDeleteAPIView.as_view()),
    path('api/login/', views.LoginSerializerView.as_view()),
    path('api/register/', views.AddUserSerializerView.as_view()),
    path('api/comment/', views.AddCommentSerializerView.as_view()),
]

if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
