from django.shortcuts import render
from django.views.generic import TemplateView
from rest_framework import viewsets, generics, parsers, permissions, status
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
    parser_classes = [parsers.MultiPartParser]

    def get_permissions(self):
        if self.action.__eq__('current_user') or self.action.__eq__('change_password'):
            return [permissions.IsAuthenticated()]
        return  [permissions.AllowAny()]

    @action(methods=['get'], url_path='current-user', url_name='current-user', detail=False)
    def current_user(self, request):
        return Response(UserSerializer(request.user).data)

    @action(methods=['post'], url_path='change-password', url_name='change-password', detail=False)
    def change_password(self, request):
        print(request.user.username)
        if change_password(request.user, request.data.get('current_password'), request.data.get('new_password')):
            return Response('Change Password Is Successful', status=status.HTTP_200_OK)
        return Response('Current PassWord is not true', status=status.HTTP_400_BAD_REQUEST)

class WeddingHallViewSet(viewsets.ViewSet, generics.ListAPIView, generics.RetrieveAPIView):
    queryset = get_wedding_hall()
    serializer_class = WeddingHallSerializer

class CategoryViewSet(viewsets.ViewSet, generics.ListAPIView):
    queryset = get_categories()
    serializer_class = CategorySerializer


class Test(TemplateView):
    template_name = 'index.html'

    def get(self, request):
        current_user = request.user
        return render(request, self.template_name, {
            'current_user': current_user
        })
