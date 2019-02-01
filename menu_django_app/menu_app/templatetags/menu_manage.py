import os
from menu_app.models import Menu, MenuItem
from django import template
from django.core.exceptions import *
from django.shortcuts import render

register = template.Library()

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
        
        children_of_current = []
        global tmp 
        for i in context['path_list']:
            tmp = []
            get_children_names(root, i)
            children_of_current.extend(tmp)
        if children_of_current:
            context['path_list'].extend(children_of_current)
        
        print(context['path_list'])
        return ''
    
    except ObjectDoesNotExist as e:
        print(e)
        print(f'Menu named \'{menu_name}\' doesn\'t exist or hasn\'t items.')
        return ''


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



def hit_database(menu_name):
    '''Getting items of menu `menu_name` from db '''
    # Hits the database.
    items_with_additional_data = MenuItem.objects.select_related('menu')
    
    # Doesn't hit the database, because items.menu has been prepopulated inthe previous query.
    chosen_menu_items = [item for item in items_with_additional_data if item.menu.name == menu_name]
    # print(chosen_menu_items)
    if not chosen_menu_items:
        raise Exception(f'Menu named \'{menu_name}\' doesn\'t exist or hasn\'t items.')
    else:
        return chosen_menu_items


def build_urls(node, travel_path, lev):
    ''' This function builds url for each node in the menu items tree '''
    next_path = os.path.join(travel_path, node.name)
    node.url = next_path
    # print(f'{lev*" "} {node.name} {node.url}')
    if node.children:
        for i in node.children:
            build_urls(i, next_path, lev+1)


def get_children_names(root, name_to_find):
    ''' This function returns children names
    Parameters:
    TreeItem: root - defines the tree
    str: name_to_find - name of TreeItem object which children we are looking for
    '''
    if name_to_find == root.name:
        if root.children:
            tmp.extend([i.name for i in root.children])
            print('children = ', tmp)
            return tmp
        else:
            return None
    if root.children:
        for i in root.children:
           get_children_names(i,name_to_find)
        



