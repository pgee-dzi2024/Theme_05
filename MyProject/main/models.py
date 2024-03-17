from django.db import models

# Потребители
class AppUserManager(models.Manager):
    def create_user(self, name, mail, username, password):
        item = self.create(name=name, mail=mail, username=username, password=password)
        return item


class AppUser(models.Model):
    name = models.CharField('Име, Фамилия', max_length=50, default='', blank=True, help_text='Име и фамилия на потребителя')
    mail = models.CharField('e-mail', max_length=30, default='', blank=True, help_text='Адрес на електронна поща на потребителя')
    username = models.CharField('Потребителско име', max_length=30, default='', blank=True, help_text='Потребителско име на потребителя за влизане в системата')
    password = models.CharField('Парола', max_length=30, default='', blank=True, help_text='Парола за влизане в системата')

    objects = AppUserManager()

    def __str__(self):
        return f'{self.username}({self.name})'

    class Meta:
        verbose_name = 'Потребител'
        verbose_name_plural = 'Потребители'


# Категории
class Category(models.Model):
    order = models.PositiveSmallIntegerField(default=0, help_text='Пореден номер при показване')
    name = models.CharField('Наименование', max_length=50, default='', blank=True, help_text='Категория - наименование')

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = 'Категория'
        verbose_name_plural = 'Категории'


# Размери
class Size(models.Model):
    order = models.PositiveSmallIntegerField(default=0, help_text='Пореден номер при показване')
    value = models.CharField('Размер', max_length=10, default='', blank=True, help_text='Размер (текст)')

    def __str__(self):
        return self.value

    class Meta:
        verbose_name = 'Размер'
        verbose_name_plural = 'Размери'


# Обява
class UserPostManager(models.Manager):
    def create_post(self, post_id):
        item = self.create(user_post=post_id)
        return item


class UserPost(models.Model):
    title = models.CharField('Наименование', max_length=50, default='', blank=True, help_text='Наименование на артикула за продажба')
    price = models.DecimalField('Цена', max_digits=6, decimal_places=2, help_text='Цена на артикула')
    category = models.ForeignKey(Category, verbose_name='Категория', on_delete=models.CASCADE, null=True, related_name='cat')
    size = models.ForeignKey(Size,  verbose_name='Размер', on_delete=models.CASCADE, null=True, related_name='size')
    description = models.TextField('Описание', default='', blank=True, help_text='Описание на предлагания продукт')
    remark = models.TextField('Забележки', default='', blank=True, help_text='Текст на съобщение')
    picture = models.ImageField('Снимка', upload_to='post_pics', blank=True)
    user = models.ForeignKey(AppUser,  verbose_name='Потребител', on_delete=models.CASCADE, null=True, related_name='usr')

    objects = UserPostManager()

    def __str__(self):
        return self.title

    class Meta:
        verbose_name = 'Обява'
        verbose_name_plural = 'Обяви'


# Коментари към обява
class CommentManager(models.Manager):
    def create_comment(self, values):
        item = self.create(post_id=values['post_id'],
                           name=values['name'],
                           mail=values['mail'],
                           phone=values['phone'],
                           message=values['message'],)
        return item


class Comment(models.Model):
    post_id = models.ForeignKey(UserPost, verbose_name='Обява', on_delete=models.CASCADE, null=True, related_name='post')
    name = models.CharField('Име, Фамилия', max_length=50, default='', blank=True, help_text='Име и фамилия на подателя')
    mail = models.CharField('e-mail', max_length=30, default='', blank=True, help_text='Адрес на електронна поща за контакт')
    phone = models.CharField('телефонeн номер', max_length=30, default='', blank=True, help_text='Телефонен номер за контакт')
    message = models.TextField('Съобщение', default='', blank=True, help_text='Съобщение/заитване')

    objects = CommentManager()

    def __str__(self):
        return f'{self.id}: {self.name}'

    class Meta:
        verbose_name = 'Зпитване'
        verbose_name_plural = 'Зпитвания'



