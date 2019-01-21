from django.shortcuts import render
from .models import Menu


def menu_list(request):
    m1 = Menu('menu_1')
    m2 = Menu('menu_2')
    m1.save()
    m2.save()
    menu_list = [m1, m2]
    print(m1)
    context = {
        'menu_list' : menu_list,
        'test' : 'This is test',
    }
    return render(request, 'menu_app/menu_list.html', context)


def home(request):
    context = {
        # 'title' : 'Home page'
    }
    return render(request, 'menu_app/base.html', context)
