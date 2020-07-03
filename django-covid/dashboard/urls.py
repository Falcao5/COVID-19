from django.urls import path

from . import views

urlpatterns = [
    path('', views.home, name='home'),
    path('graph', views.graph, name='graph'),
    path('thanh-guong', views.thanh_guong, name='thanh-guong')
]