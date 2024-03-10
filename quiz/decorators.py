from django.shortcuts import redirect
from django.contrib.auth.decorators import user_passes_test
from django.core.exceptions import PermissionDenied

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
    if user.is_authenticated and user.status == 'teacher':
        return True
    raise PermissionDenied

def is_student(user):
    if user.is_authenticated and user.status == 'student':
        return True
    raise PermissionDenied

teacher_required = user_passes_test(is_teacher, login_url='login')
student_required = user_passes_test(is_student, login_url='login')
