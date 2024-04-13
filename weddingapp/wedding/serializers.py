from rest_framework import serializers
from .models import *
from .configs import *

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