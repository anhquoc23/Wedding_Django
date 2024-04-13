from django.shortcuts import render
from rest_framework import viewsets, generics
from .serializers import *
from .models import *
from .dao import *
from .configs import Paginator

# Create your views here.
# Api Menu
class MenuViewSet(viewsets.ViewSet, generics.ListAPIView):
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