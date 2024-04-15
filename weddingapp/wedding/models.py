from datetime import datetime
import uuid

from django.contrib.auth.models import AbstractUser
from django.db import models
from .errors import *
from  .configs import *
from cloudinary.models import CloudinaryField
from ckeditor import fields

# Create your models here.

# Base Model
class BaseItem(models.Model):
    id = models.UUIDField(primary_key = True, default=uuid.uuid4, editable=False)
    name = models.CharField(max_length=255, null=False, unique=True, error_messages={
        'max_length': MAX_LENGTH,
        'unique': UNIQUE,
        'null': NULL_LABLE
    })
    unit_price = models.DecimalField(decimal_places=2, null=False, error_messages={
        'null': NULL_LABLE
    }, max_digits=10)
    created_date = models.DateTimeField(auto_now_add=True)
    updated_date = models.DateTimeField(auto_now=True)
    is_active = models.BooleanField(default=True)

    def __str__(self):
        return self.name

    class Meta:
        abstract = True

class BaseWeddingOrder(models.Model):
    quantity = models.IntegerField(null=False, default=1)
    unit_price = models.DecimalField(max_digits=10, decimal_places=2, null=False, error_messages={
        'null': NULL_LABLE
    })

    class Meta:
        abstract = True

# Models
class User(AbstractUser):
    avatar = CloudinaryField('avatar', null=True)
    is_active = models.BooleanField(default=True)



    def __str__(self):
        return self.first_name + ' ' + self.last_name
    class Meta:
        ordering = ['-id']

class Category(models.Model):
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    name = models.CharField(max_length=255, null=False, unique=True, error_messages={
        'max_length': MAX_LENGTH,
        'unique': UNIQUE,
        'null': NULL_LABLE
    })
    is_active = models.BooleanField(default=True)

    def __str__(self):
        return self.name

    class Meta:
        ordering = ['name']

class WeddingHall(models.Model):
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    name = models.CharField(max_length=255, null=False, unique=True, error_messages={
        'max_length': MAX_LENGTH,
        'unique': UNIQUE,
        'null': NULL_LABLE
    })
    price_morning = models.DecimalField(max_digits=10, decimal_places=2, null=False, error_messages={
        'null': NULL_LABLE
    })
    price_afternoon = models.DecimalField(max_digits=10, decimal_places=2, null=False, error_messages={
        'null': NULL_LABLE
    })
    price_evening = models.DecimalField(max_digits=10, decimal_places=2, null=False, error_messages={
        'null': NULL_LABLE
    })
    created_date = models.DateTimeField(auto_now_add=True)
    updated_date = models.DateTimeField(auto_now=True)
    capacity = models.IntegerField(default=10)
    description = fields.RichTextField(null=False, error_messages={
        'null': NULL_LABLE
    })
    is_active = models.BooleanField(default=True)
    image = CloudinaryField('hall', null=True)

    # Many To One

    # Many To Many
    users = models.ManyToManyField(User, related_name='wedding_halls', through='WeddingParty')

    def __str__(self):
        return self.name

class Service(BaseItem):

    def __str__(self):
        return self.name

class Menu(BaseItem):
    image = CloudinaryField('menu', null=True)

    #Fogreinkey
    category = models.ForeignKey(Category, related_name='menus', on_delete=models.CASCADE)
    def __str__(self):
        return  self.name

class WeddingParty(models.Model):
    unit_price = models.DecimalField(max_digits=10, decimal_places=2, null=False, error_messages={
        'null': NULL_LABLE
    })
    created_date = models.DateTimeField(auto_now_add=True)
    order_date = models.DateTimeField(null=False, error_messages={
        'null': NULL_LABLE
    })
    status = models.CharField(choices=ESTATUS_WEDDINGPARTY, default='PENDING', max_length=255)

    # Many To One
    user = models.ForeignKey(User, related_name='party_users', on_delete=models.CASCADE)
    wedding_hall = models.ForeignKey(WeddingHall, related_name='party_halls', on_delete=models.CASCADE)

    # Many To Many
    services = models.ManyToManyField(Service, related_name='party_services', through='WeddingService')
    menus = models.ManyToManyField(Menu, related_name='party_menus', through='WeddingMenu')
    users = models.ManyToManyField(User, related_name='party_feedback', through='Feedback')

    def __str__(self):
        return self.user.name + ' ' + self.wedding_hall.name + ' ' + self.order_date

class Cancel(models.Model):
    cancel_date = models.DateTimeField(auto_now_add=True)
    employee_id = models.IntegerField(null=False)

    #ForeignKey
    wedding_party = models.OneToOneField(WeddingParty, on_delete=models.CASCADE, primary_key=True)


class WeddingMenu(BaseWeddingOrder):

    # Many To One
    menu = models.ForeignKey(Menu, related_name='weddingmenu_menus', on_delete=models.CASCADE)
    party = models.ForeignKey(WeddingParty, related_name='weddingmenu_parties', on_delete=models.CASCADE)

class WeddingService(BaseWeddingOrder):

    # Many To One
    service = models.ForeignKey(Service, related_name='weddingservice_services', on_delete=models.CASCADE)
    party = models.ForeignKey(WeddingParty, related_name='weddingservice_parties', on_delete=models.CASCADE)

class FeedBack(models.Model):
    content = models.TextField(null=False, error_messages={
        'null': NULL_LABLE
    })
    created_date = models.DateTimeField(auto_now_add=True)

    # Many To One
    user = models.ForeignKey(User, related_name='feedback_users', on_delete=models.CASCADE)
    party = models.ForeignKey(WeddingParty, related_name='feedback_parties', on_delete=models.CASCADE)
    hall = models.ForeignKey(WeddingHall, related_name='feedbacks', on_delete=models.CASCADE)

    def __str__(self):
        return self.content

    class Meta:
        unique_together = ('user', 'party')




