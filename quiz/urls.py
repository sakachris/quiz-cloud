from django.urls import path
from . import views

urlpatterns = [
    path('create_quiz/', views.create_quiz, name='create_quiz'),
    path('created_quiz/', views.created_quiz, name='created_quiz'),
    path('add_question/<int:quiz_id>/', views.add_question, name='add_question'),
    path('question_detail/<int:question_id>/', views.question_detail, name='question_detail'),
    path('option_detail/<int:option_id>/', views.option_detail, name='option_detail'),
    path('question_form/', views.add_question_form, name='question_form'),
    path('option_form/', views.add_option_form, name='option_form'),
    path('add_option/<int:question_id>/', views.add_option, name='add_option'),
    path("", views.homepage, name="homepage"),
    path("teacher", views.teacher, name="teacher"),
    path("student", views.student, name="student"),
    path("register", views.register, name="register"),
    path('login', views.custom_login, name='login'),
    path('logout', views.custom_logout, name='logout'),
    path('profile/<username>', views.profile, name='profile'),
    path('activate/<uidb64>/<token>', views.activate, name='activate'),
    path("password_change", views.password_change, name="password_change"),
    path("password_reset", views.password_reset_request, name="password_reset"),
    path('reset/<uidb64>/<token>', views.passwordResetConfirm, name='password_reset_confirm'),
]