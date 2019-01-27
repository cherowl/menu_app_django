from django.urls import path
from menu_app import views

urlpatterns = [
    path('menu_app/', views.menu_list),
    path('menu_app/(?P<menu_name>\w+)', views.menu_list),

]
