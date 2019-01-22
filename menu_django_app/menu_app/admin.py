from django.contrib import admin
from .models import Menu, MenuItem

# class MenuItem(admin.TabularInline):
#     model = MenuItem

#     list_display = ['name', 'url']
#     search_fields = ['name', 'url']
    

# class MenuAdmin(admin.ModelAdmin):
#     list_display = ['name']
#     search_fields = ['name']

#     # prepopulated_fields = {'slug': ('name',)}
#     inlines = [MenuItem]

admin.site.register(Menu)