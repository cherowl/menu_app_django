from django.shortcuts import render
from .models import Menu, MenuItem


def menu_list(request, menu_name=None):
    print(menu_name)
    context = {
        'title' : 'Menu App',
        'main_menu' : 'main_menu_3',
    }
    # context = init_menus()
    return render(request, 'menu_app/menu_list.html', context)

def init_menus():
    m1 = Menu(name='Menu 1')
    m1.save()

    i1 = MenuItem(menu=m1, name='Menu 1.1', parent= None, visible=True)
    i2 = MenuItem(menu=m1, name='Menu 1.2', parent=i1, visible=False)
    i1.save()
    i2.save()
    cntx = {
        'root_menu': m1,
        'childs': [i1, i2]
    }
    return cntx

def home(request):
    context = {
        'title' : 'Home page'
    }
    return render(request, 'menu_app/base.html', context)
