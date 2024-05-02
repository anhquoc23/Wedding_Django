from django.contrib import admin
from django.template.response import TemplateResponse
from django.urls import path
from django.utils.safestring import mark_safe
from django.utils.translation import gettext_lazy
from django.contrib.auth.models import Group

from .models import *
from django import forms
from ckeditor_uploader.widgets import CKEditorUploadingWidget
from .utils import *
from .configs import PASSWORD_EMPLOYEE
from .dao import *


# Custom Admin Site
class WeddingAppAdminSite(admin.AdminSite):
    site_header = 'Quản Lý Đặt Tiệc Cưới'
    index_title = gettext_lazy('Trang Quản Trị Website')

    def get_urls(self):
        return [
            path('stats', self.stat_view)
        ] + super().get_urls()

    def stat_view(self, req):

        revenue, density = None, None
        if req.method.__eq__('GET'):
            date = datetime.now()
            type = 'MONTH'

            if req.GET.get('date-stat') and req.GET.get('type'):
                date = datetime.strptime(req.GET.get('date-stat'), '%Y-%m-%d')
                type = req.GET.get('type')
            year = date.year

            match type:
                case 'MONTH':
                    revenue = revenue_by_month(year)
                    density = density_wedding_by_month(year)
                case 'YEAR':
                    revenue = revenue_by_year()
                    density = density_wedding_by_year()
                case _:
                    revenue = revenue_by_quarter(year)
                    density = density_wedding_by_quarter(year)
            # print(date.year)
        return TemplateResponse(request=req, template='admin/stats.html', context={
            'revenue': revenue,
            'density': density,
            'date': date.year,
            'type': type
        })

# Custom Model Form
class WeddingHallForm(forms.ModelForm):
    description = forms.CharField(widget=CKEditorUploadingWidget)


    class Meta:
        model = WeddingHall
        fields = '__all__'

class UserAdmin(admin.ModelAdmin):
    list_display = ['id', 'username', 'first_name', 'last_name', 'date_joined', 'is_active']
    list_filter = ['id', 'username', 'first_name', 'last_name', 'date_joined', 'is_active']
    readonly_fields = ['username', 'password', 'user_permissions', 'ava']

    def ava(self, obj):
        if obj:
            return mark_safe('<img src="/static/{url}" width="120" />'.format(url=obj.avatar.name))
    def save_model(self, request, obj, form, change):
        if change is False:
            obj.username = gerenate_username(obj.first_name, obj.last_name)
            obj.password = PASSWORD_EMPLOYEE
            obj.set_password(obj.password)
        obj.save()
        

# Custom Model Admin
class MenuAdmin(admin.ModelAdmin):
    list_display = ['name', 'unit_price', 'created_date', 'updated_date']
    list_filter = ['name', 'unit_price', 'category']
    search_fields = ['name', 'unit_price', 'created_date', 'updated_date']
    readonly_fields = ['menu']

    def menu(self, obj):
        if obj:
            return mark_safe('<img src="{url}" width="120" />'.format(url=obj.image.url))

class WeddingHallAdmin(admin.ModelAdmin):
    form = WeddingHallForm
    list_display = ['name', 'price_morning', 'price_afternoon', 'price_evening', 'capacity']
    search_fields = ['name', 'price_morning', 'price_afternoon', 'price_evening', 'capacity']
    list_filter = ('name', 'price_morning', 'price_afternoon', 'price_evening', 'capacity')
    readonly_fields = ['img']

    def img(self, obj):
        if obj:
            return mark_safe('<img src="{url}" width="120" />'.format(url=obj.image.url))


class ServiceAdmin(admin.ModelAdmin):
    list_display = ['name', 'unit_price', 'created_date', 'updated_date']
    list_filter = ['name', 'unit_price', 'created_date']
    search_fields = ['name', 'unit_price', 'created_date', 'updated_date']

class CancelAdmin(admin.ModelAdmin):
    readonly_fields = ["wedding_party", "cancel_date", "employee"]
    list_filter = ["cancel_date", 'employee']
    search_fields = ("employee__first_name", "employee__last_name")

    def has_add_permission(self, request):
        return False





# Register your models here.
administration_site = WeddingAppAdminSite()

administration_site.register(User, UserAdmin)
administration_site.register(Group)
administration_site.register(Category)
administration_site.register(Menu, MenuAdmin)
administration_site.register(Service, ServiceAdmin)
administration_site.register(WeddingHall, WeddingHallAdmin)
administration_site.register(Cancel, CancelAdmin)
