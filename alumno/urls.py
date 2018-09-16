from django.urls import path

from . import views

urlpatterns = [
    path('', views.index, name='index'),
    path('<int:num_reg>/', views.detail, name='detail'),
]