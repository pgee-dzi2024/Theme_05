# Generated by Django 4.2.11 on 2024-03-20 13:47

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('main', '0007_alter_userpost_price'),
    ]

    operations = [
        migrations.AlterField(
            model_name='comment',
            name='phone',
            field=models.CharField(blank=True, default='', help_text='Телефонен номер за контакт', max_length=25, verbose_name='телефонeн номер'),
        ),
    ]
