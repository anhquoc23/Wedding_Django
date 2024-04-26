from django.urls import path

from .views import Test, WeddingPartyViewSet

urlpatterns = [
    path('', Test.as_view(), name='Home'),
    path('wedding-party', WeddingPartyViewSet.as_view(), name='wedding-party')
]