"""
URL configuration for weddingapp project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/5.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
import debug_toolbar
from django.contrib import admin
from django.urls import path, include, re_path
from drf_yasg import openapi
from drf_yasg.views import get_schema_view
from rest_framework import routers, permissions
from wedding import views, admin

# Url API
route = routers.DefaultRouter()
route.register('menus', views.MenuViewSet, basename='menu')
route.register('catgories', views.CategoryViewSet, basename='category')
route.register('services', views.ServiceViewSet, basename='service')
route.register('users', views.UserViewSet, basename='user')
route.register('wedding-hall', views.WeddingHallViewSet, basename='wedding-hall')
route.register('wedding-party', views.WeddingPartyViewSet, basename='wedding-party')
route.register('feedbacks', views.FeedBackViewSet, basename='feedbacks')
route.register('cancles', views.CancelViewSet, basename='cancles')

# Swagger
schema_view = get_schema_view(
openapi.Info(
    title="Wedding API",
    default_version='v1',
    description="APIs for WeddingApp",
    contact=openapi.Contact(email="2051052111@ou.edu.vn"),
    license=openapi.License(name="Nguyễn Anh Quốc & Trần Văn Cương @ 2024"),
    ),
    public=True,
    permission_classes=(permissions.AllowAny,)
)


urlpatterns = [
    path('weddingapp/', include('wedding.urls')),
    path('', include(route.urls)),
    path('admin/', admin.administration_site.urls),
    path('o/',include('oauth2_provider.urls', namespace='oauth2_provider')),
    re_path(r'^ckeditor/', include('ckeditor_uploader.urls')),
    path('__debug__', include(debug_toolbar.urls)),
    re_path(r'^swagger(?P<format>\.json|\.yaml)$', schema_view.without_ui(cache_timeout=0), name='schema-json'),
    re_path(r'^swagger/$', schema_view.with_ui('swagger', cache_timeout=0), name='schema-swagger-ui'),
    re_path(r'^redoc/$', schema_view.with_ui('redoc', cache_timeout=0), name='schema-redoc'),
    path('auth/', include('social_django.urls', namespace='social'))
]
