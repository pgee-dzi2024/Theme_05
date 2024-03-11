from django.contrib import admin
from .models import AppUser, Category, UserPost, Size, Comment


@admin.register(AppUser)
class ImportantV(admin.ModelAdmin):
    list_display = ('id', 'name', 'username',)
    list_display_links = ('name', )
    list_filter = ('name', 'username', )


admin.site.register(Category)
admin.site.register(Size)
admin.site.register(Comment)
admin.site.register(UserPost)
