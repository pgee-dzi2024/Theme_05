# Generated by Django 4.2.11 on 2024-03-19 23:49

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('main', '0006_rename_useer_userpost_user'),
    ]

    operations = [
        migrations.AlterField(
            model_name='userpost',
            name='price',
            field=models.DecimalField(decimal_places=2, default=0, help_text='Цена на артикула', max_digits=6, verbose_name='Цена'),
        ),
    ]
