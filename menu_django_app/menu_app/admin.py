from django.contrib import admin
from .models import Menu, MenuItem

"""Should add one or several menus (this is list) to the chosen page """
def add_menu_to_db(menus, page_url): 
    pass 


class MenuItemAdmin(admin.ModelAdmin):
    model = MenuItem

admin.site.register(MenuItem, MenuItemAdmin)