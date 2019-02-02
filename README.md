# Menu App

Menu App is a RESTful Python3.6+ django-app for implementing a tree menu.

## Installation

```bash
virtualenv --python=python3.6 venv
pip install -r requirements.txt
pip install psycopg2

```

## Usage

To add/edit/delete a menu or an item of existed one you should go to the admin/ page and log in

To draw menu (NB: it should already exist in the DB) type the following in the file 'menu_app/template/menu_list.html' inside {% block menu %}: 
```python
{% draw_menu 'main_menu' %}
```

## Contributing

Any feedback is welcome. 

## Notes

The main logic locates in the file 'menu_django_app/menu_app/templatetags/menu_manage.py'

In the project folder there is a dump of postgreSQL named 'dbmenu.pgsql'.
To restore it:
- create new db (also change menu_django_app/settings.py according to your data):
```bash
sudo -i -u postgres
psql
create database dbname owner user_name;
```
- restore:
```bash
sudo pg_restore -U username -d dbname dbmenu.pgsql
```
- make migrate:
```bash
./manage.py migrate
```
