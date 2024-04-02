from django.shortcuts import redirect, get_object_or_404
from django.contrib.auth.decorators import user_passes_test, login_required
from django.core.exceptions import PermissionDenied
from django.http import HttpResponseForbidden
from functools import wraps
from .models import Quiz, Question, Option, QuizAttempt


def user_not_authenticated(function=None, redirect_url='/'):
    """
    Decorator for views that checks that the user is NOT logged in, redirecting
    to the homepage if necessary by default.
    """
    def decorator(view_func):
        def _wrapped_view(request, *args, **kwargs):
            if request.user.is_authenticated:
                return redirect(redirect_url)

            return view_func(request, *args, **kwargs)

        return _wrapped_view

    if function:
        return decorator(function)

    return decorator


def is_teacher(user):
    ''' authentication for teacher '''
    if user.is_authenticated and user.status == 'teacher':
        return True
    raise PermissionDenied


def is_student(user):
    ''' authentication for student '''
    if user.is_authenticated and user.status == 'student':
        return True
    raise PermissionDenied


teacher_required = user_passes_test(is_teacher, login_url='login')
student_required = user_passes_test(is_student, login_url='login')


def teacher_and_owner_required(function):
    @wraps(function)
    @login_required
    def wrapper(request, *args, **kwargs):
        quiz_id = kwargs.get('quiz_id')
        quiz = get_object_or_404(Quiz, pk=quiz_id)

        # Check if the logged-in user is the teacher who created the quiz
        if (
            not request.user.is_authenticated or
            request.user.status != 'teacher' or
            quiz.created_by != request.user
        ):
            return HttpResponseForbidden(
                "You do not have permission to perform this action."
            )

        return function(request, *args, **kwargs)

    return wrapper


def question_owner_required(view_func):
    @wraps(view_func)
    @login_required
    def _wrapped_view(request, *args, **kwargs):
        question_id = kwargs.get('question_id')
        question = get_object_or_404(Question, pk=question_id)
        quiz = get_object_or_404(Quiz, id=question.quiz.id)

        # Check if the user is authenticated, is a teacher,
        # and is the owner of the quiz
        if (
            request.user.is_authenticated and
            request.user.status == 'teacher' and
            quiz.created_by == request.user
        ):
            return view_func(request, *args, **kwargs)
        else:
            return HttpResponseForbidden(
                "You do not have permission to perform this action."
            )

    return _wrapped_view


def option_owner_required(view_func):
    @wraps(view_func)
    @login_required
    def _wrapped_view(request, *args, **kwargs):
        option_id = kwargs.get('option_id')
        option = get_object_or_404(Option, pk=option_id)
        question = get_object_or_404(Question, pk=option.question.id)
        quiz = question.quiz

        # Check if the user is authenticated, is a teacher,
        # and is the owner of the quiz that the question belongs to
        if (
            request.user.is_authenticated and
            request.user.status == 'teacher' and
            quiz.created_by == request.user
        ):
            return view_func(request, *args, **kwargs)
        else:
            return HttpResponseForbidden(
                "You do not have permission to perform this action."
            )

    return _wrapped_view


def student_and_quiz_attempt_owner_required(view_func):
    @wraps(view_func)
    @login_required
    def _wrapped_view(request, *args, **kwargs):
        quiz_attempt_id = kwargs.get('quiz_attempt_id')
        quiz_attempt = get_object_or_404(QuizAttempt, pk=quiz_attempt_id)

        # Check if the user is authenticated, is a student,
        # and is the owner of the quiz attempt
        if (
            request.user.is_authenticated and
            request.user.status == 'student' and
            quiz_attempt.user == request.user
        ):
            return view_func(request, *args, **kwargs)
        else:
            return HttpResponseForbidden(
                "You do not have permission to perform this action"
            )

    return _wrapped_view
