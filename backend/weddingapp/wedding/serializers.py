from rest_framework import serializers
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
    password = serializers.CharField(write_only=True, style={'input_type': 'password'})
    confirm_password = serializers.CharField(write_only=True, style={'input_type': 'password'})

    class Meta:
        extra_kwargs = {
            'password': {
                'write_only': True
            }
        }
        model = User
        fields = ['first_name', 'last_name', 'email', 'username', 'password', 'avatar', 'confirm_password']

    def validate(self, attrs):
        password = attrs.get('password')
        confirm_password = attrs.get('confirm_password')

        if password.__eq__(confirm_password) is False:
            raise serializers.ValidationError({
                'password': 'Passwords do not match.'
            })

        return attrs

    def create(self, validated_data):
        validated_data.pop('confirm_password', None)
        user = User(**validated_data.copy())
        user.set_password(user.password)
        group = get_group_by_group_name('CUSTOMER')
        if user.save():
            group.user_set.add(user)
        return user

class WeddingHallSerializer(serializers.ModelSerializer):
    img = serializers.SerializerMethodField()
    class Meta:
        model = WeddingHall
        fields = ['id', 'name', 'description', 'created_date', 'updated_date', 'price_morning', 'price_afternoon',
                  'price_evening', 'capacity', 'img']

    def get_img(self, obj):
        return f'{BASE_URL_CLOUDINARY}/{obj.image}'

