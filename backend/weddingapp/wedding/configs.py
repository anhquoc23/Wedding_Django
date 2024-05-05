from rest_framework.pagination import PageNumberPagination

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


class Paginator(PageNumberPagination):
    page_size = 20

class Paginator_5(PageNumberPagination):
    page_size = 5