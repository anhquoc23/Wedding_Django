from django.shortcuts import render
from django.views.generic import TemplateView
from rest_framework import viewsets, generics, parsers, permissions, status, views
from rest_framework.decorators import action
from rest_framework.response import Response
from .perm import AuthenticateIsEmployeeORADMIN

from .serializers import *
from .models import *
from .dao import *
from .configs import Paginator
from .utils import *

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
        if self.action.__eq__('current_user') or self.action.__eq__('change_password') or self.action.__eq__('edit'):
            return [permissions.IsAuthenticated()]
        return [permissions.AllowAny()]

    @action(methods=['get'], url_path='current-user', url_name='current-user', detail=False)
    def current_user(self, request):
        return Response(UserSerializer(request.user).data)

    @action(methods=['post'], url_path='change-password', url_name='change-password', detail=False,
            serializer_class = ChangePasswordSerializer, parser_classes = [parsers.JSONParser])
    def change_password(self, request):
        if change_password(request.user, request.data.get('current_password'), request.data.get('new_password')):
            return Response('Change Password Is Successful', status=status.HTTP_200_OK)
        return Response('Current PassWord is not true', status=status.HTTP_400_BAD_REQUEST)

    @action(methods=['put'], url_path='edit', url_name='edit', detail=False,
            serializer_class=EditUserSerializer, parser_classes=[parsers.MultiPartParser])
    def edit(self, req):
        serializer = self.get_serializer(data=req.data)
        if serializer.is_valid():
            dict = {
                'first_name': serializer.validated_data['first_name'],
                'last_name': serializer.validated_data['last_name'],
                'email': serializer.validated_data['email'],
                'avatar': serializer.validated_data['avatar']
            }

            user = edit_user(dict, current_user=req.user)
            return Response(UserSerializer(user).data, status=status.HTTP_200_OK)
        return Response(serializers.errors, status=status.HTTP_400_BAD_REQUEST)


class WeddingHallViewSet(viewsets.ViewSet, generics.ListAPIView, generics.RetrieveAPIView):
    queryset = get_wedding_hall()
    serializer_class = WeddingHallSerializer

    def get_queryset(self):
        return get_wedding_hall(self.request.query_params)

class CategoryViewSet(viewsets.ViewSet, generics.ListAPIView):
    queryset = get_categories()
    serializer_class = CategorySerializer


class WeddingPartyAPIView(views.APIView):
    queryset = get_wedding_party()
    # serializer_class = WeddingPartySerializer
    permission_classes = [permissions.IsAuthenticated]
    # parser_classes = [parsers.JSONParser]

    def post(self, request):
        wedding_hall = get_wedding_hall_by_id(request.data.get('wedding_hall_id'))
        # Thêm Wedding Party
        party = add_wedding_party({
            'unit_price': request.data.get('unit_price'),
            'order_date': request.data.get('order_date'),
            'user': request.user,
            'wedding_hall': wedding_hall,
            'shift_party': request.data.get('shift_party'),
            'is_weekend': request.data.get('is_weekend')
        })
        # Thêm menu và service party
        menus = request.data.get('menus')
        services = request.data.get('services')

        for m in menus:
            menu = get_menu_by_id(m['id'])
            add_menus_party({
                'menu': menu,
                'unit_price': m['unit_price'],
                'party': party,
                'quantity': m['quantity']
            })

        for s in services:
            print('*' * 100)
            print(s)
            service = get_service_by_id(s['id'])
            print(service)
            add_service_party({
                'service': service,
                'unit_price': s['unit_price'],
                'party': party
            })

        serializers = WeddingPartySerializer(party)

        return Response(serializers.data, status=status.HTTP_201_CREATED)

    # @action(methods=['post'], det)

class WeddingPartyViewSet(viewsets.ViewSet, generics.ListAPIView, generics.RetrieveAPIView):
    queryset = get_wedding_party()
    serializer_class = WeddingPartySerializer
    permission_classes = [AuthenticateIsEmployeeORADMIN]

    @action(methods=['post'], url_path='status', url_name='status', detail=True)
    def change_status(self, req, pk):
        status_party = self.request.data.get('status')
        party = self.get_object()
        if party:
            if status_party == 'REJECTED':
                cancel = add_cancle(party, req.user)
                return Response(CancelSerializer(cancel).data, status=status.HTTP_200_OK)
            party = change_wedding_party_status(party, status_party)
            return Response(WeddingPartySerializer(party).data, status=status.HTTP_200_OK)
        return Response({
            'Error': 'status is not valid. Its must be REJECTED OR COMPLETED'
        }, status=status.HTTP_400_BAD_REQUEST)



class Test(TemplateView):
    template_name = 'index.html'

    def get(self, request):
        current_user = request.user
        return render(request, self.template_name, {
            'current_user': current_user
        })
