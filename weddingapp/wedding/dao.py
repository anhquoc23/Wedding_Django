from .models import *

# Model Menu
def get_menus(dict:dict=None):
    query = Menu.objects.filter(is_active=True)
    if dict:
        if 'name' in dict:
            query = query.filter(name__icontains=dict['name'])
        elif 'price' in dict:
            price = float(dict['price'])
            query = query.filter(unit_price=price)
        elif 'category_id' in dict:
            query = query.filter(category__id=dict['category_id'])
    return query



# Model Service
def get_services(dict:dict=None):
    query = Service.objects.filter(is_active=True)
    if dict:
        if 'name' in dict:
            query = query.filter(name__icontains=dict['name'])
        elif 'price' in dict:
            price = float(dict['price'])
            query = query.filter(unit_price=price)
    return query