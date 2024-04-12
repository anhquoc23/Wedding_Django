from django.contrib import admin
from django.utils.safestring import mark_safe
from .models import *
from django import forms
from ckeditor_uploader.widgets import CKEditorUploadingWidget
from .utils import *

# Custom Model Form
class WeddingHallForm(forms.ModelForm):
    description = forms.CharField(widget=CKEditorUploadingWidget)


    class Meta:
        model = WeddingHall
        fields = '__all__'

class UserAdmin(admin.ModelAdmin):
    list_display = ['id', 'username', 'first_name', 'last_name', 'date_joined', 'is_active']
    list_filter = ['id', 'username', 'first_name', 'last_name', 'date_joined', 'is_active']
    readonly_fields = ['username', 'password', 'user_permissions']

    def save_model(self, request, obj, form, change):
        if change is False:
            obj.username = gerenate_username(obj.first_name, obj.last_name)
            obj.set_password = obj.password
        obj.save()
        

# Custom Model Admin
class MenuAdmin(admin.ModelAdmin):
    list_display = ['name', 'unit_price', 'created_date', 'updated_date']
    list_filter = ['name', 'unit_price']
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





# Register your models here.
admin.site.register(User, UserAdmin)
admin.site.register(Category)
admin.site.register(Menu, MenuAdmin)
admin.site.register(Service)
admin.site.register(WeddingHall, WeddingHallAdmin)
