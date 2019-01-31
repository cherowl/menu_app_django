import os
from menu_app.models import Menu, MenuItem
from django import template
from django.core.exceptions import *
from django.shortcuts import render


register = template.Library()

def hit_database(menu_name):
    '''Getting items of menu`menu_name from db` '''
    # Hits the database.
    items_with_additional_data = MenuItem.objects.select_related('menu')
    
    # Doesn't hit the database, because items.menu has been prepopulated inthe previous query.
    chosen_menu_items = [item for item in items_with_additional_data if item.menu.name == menu_name]
    # print(chosen_menu_items)
    if not chosen_menu_items:
        raise Exception(f'Menu named \'{menu_name}\' doesn\'t exist or hasn\'t items.')
    else:
        return chosen_menu_items


class TreeItem(object):
    "A tree to define the menu items hierarchy"
    def __init__(self, name, url, parent_name=None, children=None):
        self.name = name
        self.url = url
        self.parent_name = parent_name
        self.children = []
        if children is not None:
            for child in children:
                self.add_child(child)

    def __repr__(self):
        return self.name

    def add_child(self, node):
        assert isinstance(node, TreeItem)
        self.children.append(node)


# @register.inclusion_tag('menu_app/travel_tree.html', takes_context=True)
@register.simple_tag(takes_context=True)
def draw_menu(context, menu_name):
    try: 
        chosen_menu_items = hit_database(menu_name)

        ''' Building menu items tree using TreeItem class: '''
        items_tree = []
        for item in chosen_menu_items:
            if item.parent:
                p = item.parent.name
            else: 
                p = menu_name
            items_tree.append(TreeItem(item.name, None, p, None))
        items_tree.append(TreeItem(menu_name, None, None, None))
        
        root = items_tree[-1]
        for node in items_tree:
            node.children = [i for i in items_tree if i.parent_name == node.name]
        
        build_urls(root, '/menu_app/', 0)
        
        context['node'] = root
        context['root'] = root

        return ''

    except ObjectDoesNotExist as e:
        print(e)
        print(f'Menu named \'{menu_name}\' doesn\'t exist or hasn\'t items.')
        return ''

def build_urls(node, travel_path, lev):
    ''' This function builds url for each node in the menu items tree '''
    next_path = os.path.join(travel_path, node.name)
    node.url = next_path
    print(f'{lev*" "} {node.name} {node.url}')
    if node.children:
        for i in node.children:
            build_urls(i, next_path, lev+1)


def hide():
    pass
    # if(document.getElementById('mainselect').options[document.getElementById('mainselect').selectedIndex].value == "1")
    # {
    #      document.getElementById('a').style.display = 'none';
    #      document.getElementById('b').style.display = '';
    # }else
    # {
    #      document.getElementById('a').style.display = '';
    #      document.getElementById('b').style.display = 'none'
    # }


@register.simple_tag(takes_context=True)
# @register.inclusion_tag('menu_app/draw_children.html', takes_context=True)
def get_children(context, node, parent_name):
    '''This function works if TreeItem's tree is already built'''
    # print(node.name, parent_name)
    if node.name == parent_name:
        if node.children:
            context['children'] = node.children
            return ""
        else:
            context['children'] = None
            return ""
    else:
        for i in node.children:
            get_children(context, i, parent_name)


@register.simple_tag(takes_context=True)
def draw_current(context, current_menu):
    '''This function works if TreeItem's tree is already built'''
    current = ''
    return ''