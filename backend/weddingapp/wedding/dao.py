from django.contrib.auth.models import Group

from .models import *

# Model Category
def get_categories():
    return Category.objects.filter(is_active=True)

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

# Model User
def get_group_by_group_name(name):
    query = Group.objects.get(name=name)
    return query

def get_users():
    return User.objects.all()

# Model WeddingParty
def get_wedding_party(dict:dict=None):
    query = WeddingHall.objects.filter(is_active=True)
    return query