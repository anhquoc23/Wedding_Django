from django.urls import path

from .views import Test, WeddingPartyAPIView

urlpatterns = [
    path('', Test.as_view(), name='Home'),
    path('wedding-party', WeddingPartyAPIView.as_view(), name='wedding-party')
]