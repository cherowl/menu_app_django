import os
from menu_app.models import Menu, MenuItem
from django import template
from django.template.loader import get_template
from django.core.exceptions import *

register = template.Library()

@register.simple_tag(takes_context=True)
# @register.inclusion_tag('menu_app/travel_tree.html', takes_context=True)
def draw_menu(context, menu_name):
    """
    {% draw_menu 'menu_name' %}
     """
    try: 
        # Hits the database.
        items_with_additional_data = MenuItem.objects.select_related('menu')
        
        # Doesn't hit the database, because items.menu has been prepopulated in the previous query.
        chosen_menu_items = [item for item in items_with_additional_data if item.menu.name == menu_name]
        
        ''' Building menu items tree: '''
        items_tree = []
        for item in chosen_menu_items:
            if item.parent:
                p = item.parent.name
            else: p = None
            items_tree.append(TreeItem(item.name, None, p, None))
        
        root = ""
        for node in items_tree:
            if node.parent_name is None:
                root = node
            node.children = [i for i in items_tree if i.parent_name == node.name]
        
        main_menu_url = os.path.join(context['request'].path, menu_name)
        build_urls(root, main_menu_url, 0)

        # context['root'] = root
        context['main_menu_url'] = main_menu_url
        context['node'] = root
        return "" 

    except ObjectDoesNotExist:
        print(f'Menu named \'{menu_name}\' doesn\'t exist or hasn\'t items.')
        return ""


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


def build_urls(node, travel_path, lev):
    ''' This function builds url for each node in the menu items tree '''
    next_path = os.path.join(travel_path, node.name)
    node.url = next_path
    print(f'{lev*" "} {node.name} {node.url}')
    if node.children:
        for i in node.children:
            build_urls(i, next_path, lev+1)
