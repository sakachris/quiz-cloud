from django.urls import path
from . import views

urlpatterns = [
    path('quiz/create_quiz/', views.create_quiz, name='create_quiz'),
    path('quiz/created_quiz/', views.created_quiz, name='created_quiz'),
    path('quiz/other_quizzes/', views.other_quizzes, name='other_quizzes'),
    path('quiz/user_quizzes/', views.user_quizzes, name='user_quizzes'),
    path(
        'quiz/completed_quizzes/',
        views.completed_quizzes,
        name='completed_quizzes'
        ),
    path(
        'quiz/attempted_quizzes/',
        views.user_created_attempted_quizzes,
        name='attempted_quizzes'
        ),
    path(
        'quiz/quiz_attempts/<uuid:quiz_id>/',
        views.quiz_attempts,
        name='quiz_attempts'
        ),
    path(
        'quiz/quiz_attempts_owner/<uuid:quiz_id>/',
        views.quiz_attempts_owner,
        name='quiz_attempts_owner'
        ),
    path(
        'quiz/view_take_later/',
        views.view_take_later,
        name='view_take_later'
        ),
    path(
        'quiz/toggle_published/<uuid:quiz_id>/',
        views.toggle_quiz_published,
        name='toggle_published'
        ),
    path(
        'quiz/toggle_take_later/<uuid:quiz_id>/',
        views.toggle_take_later,
        name='toggle_take_later'
        ),
    path(
        'quiz/add_question/<uuid:quiz_id>/',
        views.add_question,
        name='add_question'
        ),
    path(
        'quiz/quiz_detail/<uuid:quiz_id>/',
        views.quiz_detail,
        name='quiz_detail'
        ),
    path(
        'quiz/question_detail/<uuid:question_id>/',
        views.question_detail,
        name='question_detail'
        ),
    path(
        'quiz/option_detail/<uuid:option_id>/',
        views.option_detail,
        name='option_detail'
        ),
    path(
        'quiz/delete_quiz/<uuid:quiz_id>/',
        views.delete_quiz,
        name='delete_quiz'
        ),
    path(
        'quiz/delete_question/<uuid:question_id>/',
        views.delete_question,
        name='delete_question'
        ),
    path(
        'quiz/delete_option/<uuid:option_id>/',
        views.delete_option,
        name='delete_option'
        ),
    path(
        'quiz/update_quiz/<uuid:quiz_id>/',
        views.update_quiz,
        name='update_quiz'
        ),
    path(
        'quiz/update_question/<uuid:question_id>/',
        views.update_question,
        name='update_question'
        ),
    path(
        'quiz/update_option/<uuid:option_id>/',
        views.update_option,
        name='update_option'
        ),
    path('quiz/question_form/', views.add_question_form, name='question_form'),
    path('quiz/option_form/', views.add_option_form, name='option_form'),
    path(
        'quiz/add_option/<uuid:question_id>/',
        views.add_option,
        name='add_option'
        ),
    path(
        'quiz/validate_option/<uuid:question_id>/',
        views.validate_option,
        name='validate_option'
        ),
    path('quiz/get_quiz/<uuid:quiz_id>/', views.get_quiz, name='get_quiz'),
    path('quiz/test_quiz/<uuid:quiz_id>/', views.test_quiz, name='test_quiz'),
    path(
        'quiz/start_quiz/<uuid:quiz_id>/',
        views.start_quiz,
        name='start_quiz'
        ),
    path(
        'quiz/start_test_quiz/<uuid:quiz_id>/',
        views.start_test_quiz,
        name='start_test_quiz'
        ),
    path(
        'quiz/submit_quiz/<uuid:quiz_id>/',
        views.submit_quiz,
        name='submit_quiz'
        ),
    path(
        'quiz/submit_test_quiz/<uuid:quiz_id>/',
        views.submit_test_quiz,
        name='submit_test_quiz'
        ),
    path(
        'quiz/quiz_results/<uuid:attempt_id>/',
        views.quiz_results,
        name='quiz_results'
        ),
    path(
        'quiz/quiz_test_results/<uuid:attempt_id>/',
        views.quiz_test_results,
        name='quiz_test_results'
        ),
    path(
        'quiz/delete_attempt/<uuid:attempt_id>/',
        views.delete_attempt,
        name='delete_attempt'
        ),
    path("", views.homepage, name="homepage"),
    path("register", views.register, name="register"),
    path('login', views.custom_login, name='login'),
    path('logout', views.custom_logout, name='logout'),
    path('profile/<username>', views.profile, name='profile'),
    path('subjects/<username>', views.subjects, name='subjects'),
    path('activate/<uidb64>/<token>', views.activate, name='activate'),
    path("password_change", views.password_change, name="password_change"),
    path(
        "password_reset",
        views.password_reset_request,
        name="password_reset"
        ),
    path(
        'reset/<uidb64>/<token>',
        views.passwordResetConfirm,
        name='password_reset_confirm'
        ),
    path(
        'quiz/<uuid:quiz_id>/validate-test/',
        views.validate_quiz_before_test,
        name='validate_quiz_before_test'
        ),
    path(
        'quiz/<uuid:quiz_id>/validate-publish/',
        views.validate_and_publish_quiz,
        name='validate_and_publish_quiz'
        ),
    path(
        'quiz/<uuid:quiz_id>/validate-publish2/',
        views.validate_and_publish_quiz2,
        name='validate_and_publish_quiz2'
        ),

]
