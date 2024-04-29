from django.contrib.auth.models import Group
from django.db.models import Sum, F, Count
from django.db.models.functions import ExtractMonth, ExtractYear, ExtractQuarter

from .models import *
from .utils import *


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

def get_menu_by_id(id):
    return Menu.objects.get(pk=id)



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

def get_service_by_id(id):
    return Service.objects.get(pk=id)


# Model User
def get_group_by_group_name(name):
    query = Group.objects.get(name=name)
    return query

def get_groups_by_user(user:User):
    return user.groups.all()

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

def edit_user(dict:dict, current_user:User):
    user = current_user
    user.first_name = dict['first_name']
    user.last_name = dict['last_name']
    user.email = dict['email']
    user.avatar = dict['avatar']

    user.save()
    return user

# Model WeddingHall

def get_wedding_hall(dict:dict=None):
    query = WeddingHall.objects.filter(is_active=True)

    if dict:
        if 'name' in dict:
            query = query.filter(name__icontains=dict['name'])
    return query

def get_wedding_hall_by_id(id):
    return WeddingHall.objects.get(pk=id)

# Model Wedding Party
def get_wedding_party():
    return WeddingParty.objects.all()

def add_wedding_party(dict:dict):
    party = WeddingParty.objects.create(unit_price=dict['unit_price'], order_date=dict['order_date'],
                                        wedding_hall=dict['wedding_hall'], user=dict['user'],
                                        shift_party=dict['shift_party'], is_weekend=dict['is_weekend'])
    return party

def change_wedding_party_status(party:WeddingParty, status):
    s = get_value_choice(ESTATUS_WEDDINGPARTY, status)
    if s:
        party.status = s

        party.save()
        return party
    return None


#Model MenuParty
def get_menu():
    return Menu

def add_menus_party(dict:dict):
    menu = WeddingMenu.objects.create(unit_price=dict['unit_price'], quantity=dict['quantity'], party=dict['party'],
                                      menu=dict['menu'])
    return menu

def add_service_party(dict:dict):
    service = WeddingService.objects.create(unit_price=dict['unit_price'], party=dict['party'],
                                            service=dict['service'])
    return service

# Model Cancel
def add_cancle(party: WeddingParty, employee_id):
    return Cancel.objects.create(wedding_party=party, employee=employee_id)


# Model Feedback
def add_feedback(content:str, wedding_party:WeddingParty, wedding_hall:WeddingHall, user:User):
    return FeedBack.objects.create(content=content, hall=wedding_hall, user=user, party=wedding_party)

def get_feedbacks():
    return FeedBack.objects.all()

def get_feedbacks_by_party(party):
    return FeedBack.objects.filter(party=party)


# Stat
def revenue_by_year():
    query = WeddingParty.objects\
        .annotate(title=ExtractYear('order_date')).values('title') \
        .annotate(revenue_party=Sum('unit_price'))\
        .annotate(revenue_menu=Sum(F('weddingmenu_parties__unit_price') * F('weddingmenu_parties__quantity')))\
        .annotate(value=Sum('weddingservice_parties__unit_price'))\
        .values('title', 'value').order_by('title')

    return query

def revenue_by_month(year):
    query = WeddingParty.objects.filter(order_date__year=year) \
        .annotate(title=ExtractMonth('order_date')).values('title') \
        .annotate(revenue_party=Sum('unit_price')) \
        .annotate(revenue_menu=Sum(F('weddingmenu_parties__unit_price') * F('weddingmenu_parties__quantity'))) \
        .annotate(value=Sum('weddingservice_parties__unit_price')) \
        .values('title', 'value').order_by('title')

    return query

def revenue_by_quarter(year):
    query = WeddingParty.objects.filter(order_date__year=year) \
        .annotate(title=ExtractQuarter('order_date')).values('title')  \
        .annotate(revenue_party=Sum('unit_price')) \
        .annotate(revenue_menu=Sum(F('weddingmenu_parties__unit_price') * F('weddingmenu_parties__quantity'))) \
        .annotate(value=Sum('weddingservice_parties__unit_price')) \
        .values('title', 'value').order_by('title')

    return query

def density_wedding_by_year():
    query = WeddingParty.objects \
            .annotate(title=ExtractYear('order_date')).values('title') \
            .annotate(value=Count('id')) \
            .values('title', 'value').order_by('title')

    return query


def density_wedding_by_month(year):
    query = WeddingParty.objects.filter(order_date__year=year) \
        .annotate(title=ExtractMonth('order_date')).values('title')  \
        .annotate(value=Count('id')) \
        .values('title', 'value').order_by('title')

    return query


def density_wedding_by_quarter(year):
    query = WeddingParty.objects.filter(order_date__year=year) \
        .annotate(title=ExtractQuarter('order_date')).values('title') \
        .annotate(value=Count('id')) \
        .values('title', 'value').order_by('title')

    return query