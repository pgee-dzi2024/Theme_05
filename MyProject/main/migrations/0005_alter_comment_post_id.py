# Generated by Django 4.2.11 on 2024-03-16 15:49

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('main', '0004_alter_userpost_category_alter_userpost_size_and_more'),
    ]

    operations = [
        migrations.AlterField(
            model_name='comment',
            name='post_id',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='post', to='main.userpost', verbose_name='Обява'),
        ),
    ]