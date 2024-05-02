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
    ava = serializers.SerializerMethodField(source='avatar')

    class Meta:
        extra_kwargs = {
            'password': {
                'write_only': True
            }
        }
        model = User
        fields = ['first_name', 'last_name', 'email', 'username', 'password', 'avatar', 'ava']

    def get_ava(self, obj):
        req = self.context.get('request')
        if obj.avatar:
            if req:
                return req.build_absolute_uri('/static/%s' % obj.avatar.name)
            return '/static/%s' % obj.avatar.name

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
    avatar = serializers.ImageField()

class WeddingHallSerializer(serializers.ModelSerializer):
    img = serializers.SerializerMethodField()
    class Meta:
        model = WeddingHall
        fields = ['id', 'name', 'description', 'created_date', 'updated_date', 'price_morning', 'price_afternoon',
                  'price_evening', 'capacity', 'img']

    def get_img(self, obj):
        return f'{BASE_URL_CLOUDINARY}/{obj.image}'

class MenuPartySerializer(serializers.ModelSerializer):

    class Meta:
        model = WeddingMenu
        fields = '__all__'

class ServicePartySerializer(serializers.ModelSerializer):

    class Meta:
        model = WeddingService
        fields = '__all__'

class WeddingPartySerializer(serializers.ModelSerializer):
    menus = MenuSerializer(many=True)
    services = ServiceSerializer(many=True)
    wedding_hall = WeddingHallSerializer()

    class Meta:
        model = WeddingParty
        exclude = ['users']

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

