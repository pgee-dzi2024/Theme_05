# Generated by Django 4.2.11 on 2024-03-16 12:44

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('main', '0002_userpost_picture'),
    ]

    operations = [
        migrations.AddField(
            model_name='userpost',
            name='useer',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='usr', to='main.appuser'),
        ),
        migrations.AlterField(
            model_name='userpost',
            name='picture',
            field=models.ImageField(blank=True, upload_to='post_pics', verbose_name='Снимка'),
        ),
    ]
