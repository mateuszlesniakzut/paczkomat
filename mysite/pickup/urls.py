from django.urls import path
from . import views

urlpatterns = [
    path('', views.index, name='index'),
    path('number', views.number, name="number"),
    path('checking_number', views.checking_number, name="checking_number"),
    path('checking_code', views.checking_code, name="checking_code"),
    path('checking_payment', views.checking_payment, name="checking_payment")
]