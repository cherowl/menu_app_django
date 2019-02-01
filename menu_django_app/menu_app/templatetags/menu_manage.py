import os
from menu_app.models import Menu, MenuItem
from django import template
from django.core.exceptions import *
from django.shortcuts import render

register = template.Library()


# @register.inclusion_tag('/menu_app/travel_tree.html', takes_context=True)
@register.simple_tag(takes_context=True)
def draw_menu(context, menu_name):
    try: 
        request = context['request']
        root = ""
        # del context['visible_items'][:] 
        context['node'] = ""
        if menu_name not in request.session['menu']:
            request.session['menu'][menu_name] = {}
            chosen_menu_items = hit_database(menu_name)
            root = build_tree(chosen_menu_items, menu_name)
            request.session['menu'][menu_name]['was_built'] = True
            request.session['menu'][menu_name]['tree_root'] = root
            context['node'] = root

        elif request.session['menu'][menu_name]['was_built']:
            context['node'] = request.session['menu'][menu_name]['tree_root']
            root = context['node']
        tmp = []
        context['visible_items'] = get_children_names(root, menu_name, tmp)
        print('DEBUG', context['visible_items'], context['node'])
        context['test'] = 'test'
        print('FFF')
        return ''
    
    except ObjectDoesNotExist as e:
        print(e)
        print(f'Menu named \'{menu_name}\' doesn\'t exist or hasn\'t items.')
        return ''

@register.inclusion_tag('menu_app/travel_tree.html', takes_context=True)
# @register.simple_tag(takes_context=True)
def draw_current(context):
    try: 
        request = context['request']
        menu_name = context['menu_name']
        root = ""
        if request.session['menu'][menu_name]['was_built']:
            context['node'] = request.session['menu'][menu_name]['tree_root']
            root = context['node']

        else:
            chosen_menu_items = hit_database(menu_name)
            root = build_tree(chosen_menu_items, menu_name)
            request.session['menu'][menu_name]['was_built'] = True
            request.session['menu'][menu_name]['tree_root'] = root
            context['node'] = root

        context['visible_items'] = build_visible_items(root, context['path_list'])
       
       
        context['test'] = 'cur'
        return context
    
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

def build_tree(chosen_menu_items, menu_name):
    ''' Building menu items tree using TreeItem class: '''
    items_tree = []
    for item in chosen_menu_items:
        if item.parent:
            p = item.parent.name
        else: 
            p = menu_name
        items_tree.append(TreeItem(item.name, None, p, None))
    items_tree.append(TreeItem(menu_name, None, None, None))
    root = ""
    root = items_tree[-1]
    for node in items_tree:
        node.children = [i for i in items_tree if i.parent_name == node.name]
    
    build_urls(root, '/menu_app/', 0)
    return root

def build_urls(node, travel_path, lev):
    ''' This function builds url for each node in the menu items tree '''
    next_path = os.path.join(travel_path, node.name)
    node.url = next_path
    print(f'{lev*" "} {node.name} {node.url}')
    if node.children:
        for i in node.children:
            build_urls(i, next_path, lev+1)

def build_visible_items(root, path_list):
    visible_items = []
    visible_items.extend(path_list)
    print('PATH',path_list)
    for item in path_list:
        tmp = []
        get_children_names(root, item, tmp)
        visible_items.extend(tmp)
    return visible_items


def get_children_names(root, name_to_find, tmp):
    ''' This function returns children names
    Parameters:
    TreeItem: root - defines the tree
    str: name_to_find - name of TreeItem object which children we are looking for
    '''
    print(root, name_to_find)
    if name_to_find == root.name:
        if root.children:
            tmp.extend([i.name for i in root.children])
            print('children = ', tmp)
            return tmp
        else:
            return None
    elif root.children:
        for i in root.children:
           get_children_names(i, name_to_find, tmp)
        



