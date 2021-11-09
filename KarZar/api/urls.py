from django.urls import path
from . import views


urlpatterns = [
    path('', views.getRoutes, name="getRoutes"),
    path('questions/create/', views.createQuestion, name="createQuestion"),
    path('questions/', views.getQuestions, name="getQuestions"),
    path('questions/<str:pk>/', views.getQuestion, name="getQuestion"),
    path('questions/<str:pk>/update/', views.updateQuestion, name="updateQuestion"),
]