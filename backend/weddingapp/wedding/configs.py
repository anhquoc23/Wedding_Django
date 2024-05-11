from rest_framework.pagination import PageNumberPagination
from rest_framework.response import Response

ESTATUS_WEDDINGPARTY = [
    ('PENDING', 'PENDING'),
    ('COMPLETED', 'COMPLETED'),
    ('REJECTED', 'REJECTED')
]

SHIFT_PARTY = [
    ('MORNING', 'MORNING'),
    ('AFTERNOON', 'AFTERNOON'),
    ('EVENING', 'EVENING')
]

PASSWORD_EMPLOYEE = '123456'

BASE_URL_CLOUDINARY = 'https://res.cloudinary.com/dvevyvqyt'

GROUP_NAME = {
    'EMPLOYEE': 'EMPLOYEE',
    'ADMIN': 'ADMIN',
    'CUSTOMER': 'CUSTOMER'
}

INCREASE_PRICE = 1.5


class Paginator(PageNumberPagination):
    page_size = 20

class Paginator_5(PageNumberPagination):
    page_size = 5

class PagintorCustom(PageNumberPagination):
    def get_paginated_response(self, data):
        return Response({
            'count': self.page.paginator.count,
            'next': self.get_next_link(),
            'previous': self.get_previous_link(),
            'results': data
        })