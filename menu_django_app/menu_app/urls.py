from django.urls import path, re_path
from menu_app import views
from django.conf.urls.static import static
from django.conf import settings

urlpatterns = [
    path('menu_app/', views.home, name='home'),
    re_path(r'^menu_app/(?P<menu_name>[\w.-]+)/', views.menu_list, name='menu_list'),
] + static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)