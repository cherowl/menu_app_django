from django.shortcuts import render
from django.core.exceptions import *
from .models import Menu, MenuItem
import re
import os
from django.http import HttpResponse

def menu_list(request, menu_name=None):
    ''' 
    '...' - this part is descripted in urls.py
    There are several types of valid urls:

        .../main_menu/ 
    -> draw it and only the list of its children

        .../main_menu/menu_item_1/menu_item_1.1/ 
    -> check the path, if right draw all intermediate parents with the lists of its children and the last item with the list of its children

    NB! This is invalid
        .../menu_item/ 
    To draw an item url must contain full path to the item, including its parents
 
    Name structure of menues are optional. 
    '''
    current_url = request.path_info
    url_parsed = (current_url).split('/')
    url_parsed = list(filter(lambda x: x != "", url_parsed))
    current_menu = url_parsed[-1]

    print('cur_url = ', current_url)
    print('cur_menu_list = ', url_parsed)
    print('cur_menu = ', current_menu)

    try:
        pattern = re.compile('^/menu_app/' + menu_name + '/$')

        if pattern.match(current_url): # to draw all main menu
            context = {
                'title' : 'Menu App',
                'menu_name' : menu_name, 
                'current_menu' : menu_name,

            }
        else:
            context = {
                'title' : 'Menu App',
                'menu_name' : menu_name, 
                'current_menu' : current_menu,

            }
        context['another_menu_name']= 'main_menu_1'
        
        return render(request, 'menu_app/menu_list.html', context)

    except Exception as e:
        print(e)
        return HttpResponse('Internal error in templates')


def home(request):
    context = {
        'title' : 'Home page'
    }
    return render(request, 'menu_app/base.html', context)

