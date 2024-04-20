from django.shortcuts import render
from rest_framework import viewsets, generics, parsers, permissions
from rest_framework.decorators import action
from rest_framework.response import Response

from .serializers import *
from .models import *
from .dao import *
from .configs import Paginator

# Create your views here.
# Api Menu
class MenuViewSet(viewsets.ViewSet, generics.ListAPIView, generics.RetrieveAPIView):
    queryset = get_menus()
    serializer_class = MenuSerializer
    pagination_class = Paginator

    def get_queryset(self):
        return get_menus(self.request.query_params)

# APi Service
class ServiceViewSet(viewsets.ViewSet, generics.ListAPIView):
    queryset = get_services()
    serializer_class = ServiceSerializer
    pagination_class = Paginator

    def get_queryset(self):
        return get_services(self.request.query_params)


# API User
class UserViewSet(viewsets.ViewSet, generics.CreateAPIView):
    queryset = get_users()
    serializer_class = UserSerializer

    def get_permissions(self):
        if self.action.__eq__('current_user'):
            return [permissions.IsAuthenticated()]
        return  [permissions.AllowAny()]

    @action(methods=['get'], url_path='current-user', url_name='current-user', detail=False)
    def current_user(self, request):
        return Response(UserSerializer(request.user).data)

class WeddingHallViewSet(viewsets.ViewSet, generics.ListAPIView, generics.RetrieveAPIView):
    queryset = get_wedding_party()
    serializer_class = WeddingHallSerializer

class CategoryViewSet(viewsets.ViewSet, generics.ListAPIView):
    queryset = get_categories()
    serializer_class = CategorySerializer

