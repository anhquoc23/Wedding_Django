import re

from rest_framework import serializers
from rest_framework.exceptions import ValidationError

# from weddingapp.wedding.serializers import ServicePartySerializer
from .models import *
from .configs import *
from .dao import *

class CategorySerializer(serializers.ModelSerializer):
    class Meta:
        model = Category
        fields = ['id', 'name']
class MenuSerializer(serializers.ModelSerializer):
    category = CategorySerializer()
    url = serializers.SerializerMethodField(source='image')
    class Meta:
        model = Menu
        fields = ['id', 'name', 'unit_price', 'created_date', 'updated_date', 'url', 'category']

    def get_url(self, obj):
        return f'{BASE_URL_CLOUDINARY}/{obj.image}'

class ServiceSerializer(serializers.ModelSerializer):
    class Meta:
        model = Service
        fields = '__all__'


class UserSerializer(serializers.ModelSerializer):
    avatar = serializers.ImageField()
    image = serializers.SerializerMethodField(source='avatar')

    class Meta:
        extra_kwargs = {
            'password': {
                'write_only': True
            }
        }
        model = User
        fields = ['first_name', 'last_name', 'email', 'username', 'password', 'avatar', 'image']

    def get_image(self, obj):
        return f'{BASE_URL_CLOUDINARY}/{obj.avatar}'

    def create(self, validated_data):
        user = User(**validated_data.copy())
        user.set_password(user.password)
        group = get_group_by_group_name('CUSTOMER')
        user.save()
        user.groups.add(group)
        user.save()
        return user


class ChangePasswordSerializer(serializers.Serializer):
    current_password = serializers.CharField(write_only=True, style={'input_type': 'password'})
    new_password = serializers.CharField(write_only=True, style={'input_type': 'password'})

class EditUserSerializer(serializers.Serializer):
    first_name = serializers.CharField(max_length=255)
    last_name = serializers.CharField(max_length=255)
    email = serializers.EmailField()
    avatar = serializers.ImageField(required=False, allow_null=True)

class WeddingHallSerializer(serializers.ModelSerializer):
    img = serializers.SerializerMethodField()
    class Meta:
        model = WeddingHall
        fields = ['id', 'name', 'description_text', 'created_date', 'updated_date', 'price_morning', 'price_afternoon',
                  'price_evening', 'capacity', 'img']

    def get_img(self, obj):
        return f'{BASE_URL_CLOUDINARY}/{obj.image}'

class MenuPartySerializer(serializers.ModelSerializer):
    menu_name = serializers.CharField(source='menu.name', read_only=True)

    class Meta:
        model = WeddingMenu
        fields = ['id', 'unit_price', 'quantity', 'menu_name']

class ServicePartySerializer(serializers.ModelSerializer):

    class Meta:
        model = WeddingService
        fields = '__all__'

class WeddingPartySerializer(serializers.ModelSerializer):
    total = serializers.SerializerMethodField()
    wedding_hall = WeddingHallSerializer()
    menu_items = serializers.SerializerMethodField()
    service_items = serializers.SerializerMethodField()


    def get_menu_items(self, obj):
        return MenuPartySerializer(get_menu_by_party(obj), many=True).data

    def get_service_items(self, obj):
        return ServicePartySerializer(get_service_by_party(obj), many=True).data

    def get_total(self, obj):
        return get_total_party(obj)

    class Meta:
        model = WeddingParty
        fields = ['id', 'unit_price', 'created_date', 'order_date', 'menu_items', 'service_items', 'wedding_hall', 'total']

class CancelSerializer(serializers.ModelSerializer):
    employee = UserSerializer()
    wedding_party = WeddingPartySerializer()

    class Meta:
        model = Cancel
        fields = '__all__'

class FeedBackSerializer(serializers.ModelSerializer):
    hall = WeddingHallSerializer()
    user = UserSerializer()
    party = WeddingPartySerializer()

    class Meta:
        model = FeedBack
        fields = '__all__'

