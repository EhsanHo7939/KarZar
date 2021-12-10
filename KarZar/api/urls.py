from django.urls import path
from . import views


urlpatterns = [
    path('', views.getRoutes, name="getRoutes"),
    path('questions/', views.QuestionList.as_view(), name="QuestionList"),
    path('questions/<str:pk>/', views.QuestionDetail.as_view(), name="QuestionDetail"),
    path('votes/', views.VoteList.as_view(), name="VoteList"),
    path('votes/<str:pk>/', views.VoteDetail.as_view(), name="VoteDetail"),
    path('users/', views.UserList.as_view(), name="UserList"),
    path('users/<str:pk>/', views.UserDetail.as_view(), name="UserDetail"),
]