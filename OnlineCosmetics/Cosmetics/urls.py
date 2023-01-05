from django.urls import path

from . import views
from . import postRequests

urlpatterns = [
    # Render views
    path('', views.index, name='index'),
    path('register', views.registerPage, name='register'),
    path('login', views.loginPage, name='login'),
    path('logout', views.logout, name='logout'),
    path('profile', views.profile, name='profile'),
    path('produs', views.produs, name='produs'),
    path('cos', views.cos, name='cos'),

    # Special login and register forms
    path('registerPOST', postRequests.registerPOST, name='registerPOST'),
    path('loginPOST', postRequests.loginPOST, name='loginPOST'),

    # Bullshit
    path('adaugaProdusPOST', postRequests.adaugaProdusPOST, name='adaugaProdusPOST'),
    path('modificaCantitatePOST', postRequests.modificaCantitatePOST, name='modificaCantitatePOST'),
    path('plaseazaComandaPOST', postRequests.plaseazaComandaPOST, name='plaseazaComandaPOST')
]