from rest_framework.pagination import PageNumberPagination

ESTATUS_WEDDINGPARTY = {
    'PENDING': 'PENDING',
    'COMPLETED': 'COMPLETED',
    'REJECTED': 'REJECTED'
}

PASSWORD_EMPLOYEE = '123456'

BASE_URL_CLOUDINARY = 'https://res.cloudinary.com/dvevyvqyt'

class Paginator(PageNumberPagination):
    page_size = 20