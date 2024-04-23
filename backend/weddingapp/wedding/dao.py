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

def change_password(user, current_password, new_password):
    print(current_password, new_password)
    if user.check_password(current_password):
        print('true')
        user.password = new_password
        user.set_password(user.password)
        user.save()
        return True
    return False

def get_users():
    return User.objects.all()

# Model WeddingHall
def get_wedding_hall(dict:dict=None):
    query = WeddingHall.objects.filter(is_active=True)

    if dict:
        if 'name' in dict:
            query = query.filter(name__icontains=dict['name'])
    return query