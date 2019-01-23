from django.contrib import admin
from .models import Menu, MenuItem



class MenuItemInline(admin.TabularInline):
    model = MenuItem
    fields = ('menu', 'name','parent')
    extra = 1

class MenuAdmin(admin.ModelAdmin):
    model = Menu
    fieldsets = [
        ('MAIN MENU', {'fields': ['name']}),
    ]
    inlines = [MenuItemInline]


admin.site.site_url = 'admin/menu_app/' 
admin.site.register(Menu, MenuAdmin)




 # def get_model_perms(self, request):
    #     perms = {}
    #     perms['list_hide'] = True
    #     return perms

"""Should add one or several menus (this is list) to the chosen page """
def add_menu_to_db(menus, page_url): 
    pass 