from typing import Protocol
from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth import login, logout, authenticate, get_user_model
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from django.template.loader import render_to_string
from django.contrib.sites.shortcuts import get_current_site
from django.utils.http import urlsafe_base64_encode, urlsafe_base64_decode
from django.utils.encoding import force_bytes, force_str
from django.core.mail import EmailMessage
from django.db.models.query_utils import Q
from django.http.response import HttpResponse, HttpResponseNotAllowed

from .forms import UserRegistrationForm, UserLoginForm, UserUpdateForm, SetPasswordForm, PasswordResetForm
from .decorators import user_not_authenticated, teacher_required, student_required
from .tokens import account_activation_token
from .models import CustomUser, Subject, Quiz, Question, Option
from .forms import QuizForm, QuestionForm, OptionForm


def create_quiz(request):
    if request.method == 'POST':
        print('one')
        form = QuizForm(request.POST)
        if form.is_valid():
            quiz = form.save()
            return redirect('add_question', quiz_id=quiz.id)
    else:
        form = QuizForm()
    return render(request, 'quiz/create_quiz.html', {'form': form})

def created_quiz(request):
    quizzes = Quiz.objects.all()
    return render(request, 'quiz/created_quiz.html', {'quizzes': quizzes})

def add_question_form(request):
    form = QuestionForm()
    context = {
        "form": form
    }
    return render(request, "partials/question_form.html", context)

def add_option_form(request):
    form = OptionForm()
    context = {
        "form": form       
    }
    return render(request, "partials/option_form.html", context)

def add_question(request, quiz_id):
    quiz = Quiz.objects.get(id=quiz_id)
    questions = Question.objects.filter(quiz=quiz)
    form = QuestionForm(request.POST or None)
    if request.method == 'POST':
        if form.is_valid():
            question = form.save(commit=False)
            question.quiz = quiz
            question.save()
            return redirect('add_option', question_id=question.id)
        # else:
        #     return render(request, "partials/question_form.html", context={
        #         "form": form
        #     })
    else:
        form = QuestionForm()
    
    context = {
        "quiz": quiz,
        "questions": questions,
        "form": form
    }
    return render(request, 'quiz/add_question.html', context)

def quiz_detail(request, quiz_id):
    quiz = get_object_or_404(Quiz, id=quiz_id)
    context = {
        "quiz": quiz
    }
    return render(request, "partials/quiz_detail.html", context)

def question_detail(request, question_id):
    question = get_object_or_404(Question, id=question_id)
    context = {
        "question": question
    }
    return render(request, "partials/question_detail.html", context)

def option_detail(request, option_id):
    option = get_object_or_404(Option, id=option_id)
    associated_question = option.question
    print(associated_question.id)
    context = {
        "option": option,
        "associated_question": associated_question
    }
    return render(request, "partials/option_detail.html", context)

def delete_quiz(request, quiz_id):
    quiz = get_object_or_404(Quiz, id=quiz_id)
    if request.method == 'POST':
        quiz.delete()
        return HttpResponse("")
    
    return HttpResponseNotAllowed(
        [
            "POST",
        ]
    )

def delete_question(request, question_id):
    question = get_object_or_404(Question, id=question_id)
    if request.method == 'POST':
        question.delete()
        return HttpResponse("")
    
    return HttpResponseNotAllowed(
        [
            "POST",
        ]
    )

def delete_option(request, option_id):
    option = get_object_or_404(Option, id=option_id)
    if request.method == 'POST':
        option.delete()
        return HttpResponse("")
    
    return HttpResponseNotAllowed(
        [
            "POST",
        ]
    )

def add_option(request, question_id):
    question = Question.objects.get(id=question_id)
    options = Option.objects.filter(question=question)
    form = OptionForm(request.POST or None)
    if request.method == 'POST':
        if form.is_valid():
            option = form.save(commit=False)
            option.question = question
            option.save()
            return redirect('option_detail', option_id=option.id)
        #else:
            #redirect('add_option', question_id=question.id)
        #     return render(request, "partials/option_form.html", context={
        #         "form": form
        #     })
    else:
        form = OptionForm()

    context = {
        "question": question,
        "options": options,
        "form": form
    }

    return render(request, 'quiz/add_option.html', context)

def update_quiz(request, quiz_id):
    quiz = Quiz.objects.get(id=quiz_id)
    form = QuizForm(request.POST or None, instance=quiz)

    if request.method == "POST":
        if form.is_valid():
            form.save()
            print(request.path)
            return redirect("quiz_detail", quiz_id=quiz.id)

    context = {
        "form": form,
        "quiz": quiz
    }

    return render(request, "partials/quiz_form.html", context)

def update_question(request, question_id):
    question = Question.objects.get(id=question_id)
    form = QuestionForm(request.POST or None, instance=question)

    if request.method == "POST":
        if form.is_valid():
            form.save()
            print(request.path)
            return redirect("question_detail", question_id=question.id)

    context = {
        "form": form,
        "question": question
    }

    return render(request, "partials/question_form.html", context)

def update_option(request, option_id):
    option = Option.objects.get(id=option_id)
    form = OptionForm(request.POST or None, instance=option)

    if request.method == "POST":
        if form.is_valid():
            form.save()
            print(request.path)
            return redirect("option_detail", option_id=option.id)

    context = {
        "form": form,
        "option": option
    }

    return render(request, "partials/option_form.html", context)

def homepage(request):
    return render(request=request, template_name="quiz/home.html")

@teacher_required
def teacher(request):
    return render(request=request, template_name="quiz/teacher.html")

@student_required
def student(request):
    return render(request=request, template_name="quiz/student.html")

def activate(request, uidb64, token):
    User = get_user_model()
    try:
        uid = force_str(urlsafe_base64_decode(uidb64))
        user = User.objects.get(pk=uid)
    except:
        user = None

    if user is not None and account_activation_token.check_token(user, token):
        user.is_active = True
        user.save()

        messages.success(request, "Thank you for your email confirmation. Now you can login your account.")
        return redirect('login')
    else:
        messages.error(request, "Activation link is invalid!")

    return redirect('homepage')

def activateEmail(request, user, to_email):
    mail_subject = "Activate your user account."
    message = render_to_string("template_activate_account.html", {
        'user': user,
        'domain': get_current_site(request).domain,
        'uid': urlsafe_base64_encode(force_bytes(user.pk)),
        'token': account_activation_token.make_token(user),
        "protocol": 'https' if request.is_secure() else 'http'
    })
    email = EmailMessage(mail_subject, message, to=[to_email])
    if email.send():
        messages.success(request, f'Dear <b>{user}</b>, please go to you email <b>{to_email}</b> inbox and click on \
                received activation link to confirm and complete the registration. <b>Note:</b> Check your spam folder.')
    else:
        messages.error(request, f'Problem sending email to {to_email}, check if you typed it correctly.')


@user_not_authenticated
def register(request):
    if request.method == "POST":
        form = UserRegistrationForm(request.POST)
        if form.is_valid():
            user = form.save(commit=False)
            user.is_active=False
            user.save()
            activateEmail(request, user, form.cleaned_data.get('email'))
            return redirect('homepage')

        else:
            for error in list(form.errors.values()):
                messages.error(request, error)

    else:
        form = UserRegistrationForm()

    return render(
        request=request,
        template_name="quiz/register.html",
        context={"form": form}
        )

@login_required
def custom_logout(request):
    logout(request)
    messages.info(request, "Logged out successfully!")
    return redirect("homepage")

@user_not_authenticated
def custom_login(request):
    if request.method == "POST":
        form = UserLoginForm(request=request, data=request.POST)
        if form.is_valid():
            user = authenticate(
                username=form.cleaned_data["username"],
                password=form.cleaned_data["password"],
            )
            if user is not None:
                login(request, user)
                messages.success(request, f"Hello <b>{user.username}</b>! You have been logged in")
                if user.status == 'teacher':
                    return redirect("teacher")
                elif user.status == 'student':
                    return redirect("student")
            
        else:
            for error in list(form.errors.values()):
                messages.error(request, error)
        '''else:
            for key, error in list(form.errors.items()):
                if key == 'captcha' and error[0] == 'This field is required.':
                    messages.error(request, "You must pass the reCAPTCHA test")
                    continue
                
                messages.error(request, error)'''

    form = UserLoginForm()

    return render(
        request=request,
        template_name="quiz/login.html",
        context={"form": form}
        )

'''def profile(request, username):
    if request.method == "POST":
        user = request.user
        form = UserUpdateForm(request.POST, request.FILES, instance=user)
        if form.is_valid():
            user_form = form.save()
            messages.success(request, f'{user_form.username}, Your profile has been updated!')
            return redirect("profile", user_form.username)

        for error in list(form.errors.values()):
            messages.error(request, error)

    user = get_user_model().objects.filter(username=username).first()
    if user:
        form = UserUpdateForm(instance=user)
        form.fields['school'].widget.attrs = {'rows': 1}
        return render(
            request=request,
            template_name="quiz/profile.html",
            context={"form": form}
            )
    
    return redirect("homepage")'''

def profile(request, username):
    user = get_object_or_404(CustomUser, username=username)

    if request.user != user:
        messages.error(request, "You do not have permission to edit this profile.")
        return redirect("homepage")  # Replace with your homepage URL name

    if request.method == "POST":
        form = UserUpdateForm(request.POST, request.FILES, instance=user)
        if form.is_valid():
            form.save()
            messages.success(request, f'{user.username}, your profile has been updated!')
            return redirect("profile", username=user.username)  # Ensure this URL pattern is correct in your urls.py

    else:
        form = UserUpdateForm(instance=user)
    # form.fields['school'].widget.attrs = {'rows': 1}
    return render(
        request=request,
        template_name="quiz/profile.html",
        context={"form": form}
    )

@login_required
def password_change(request):
    user = request.user
    if request.method == 'POST':
        form = SetPasswordForm(user, request.POST)
        if form.is_valid():
            form.save()
            messages.success(request, "Your password has been changed")
            return redirect('login')
        else:
            for error in list(form.errors.values()):
                messages.error(request, error)

    form = SetPasswordForm(user)
    return render(request, 'password_reset_confirm.html', {'form': form})

@user_not_authenticated
def password_reset_request(request):
    if request.method == 'POST':
        form = PasswordResetForm(request.POST)
        if form.is_valid():
            user_email = form.cleaned_data['email']
            associated_user = get_user_model().objects.filter(Q(email=user_email)).first()
            if associated_user:
                subject = "Password Reset request"
                message = render_to_string("template_reset_password.html", {
                    'user': associated_user,
                    'domain': get_current_site(request).domain,
                    'uid': urlsafe_base64_encode(force_bytes(associated_user.pk)),
                    'token': account_activation_token.make_token(associated_user),
                    "protocol": 'https' if request.is_secure() else 'http'
                })
                email = EmailMessage(subject, message, to=[associated_user.email])
                if email.send():
                    messages.success(request,
                        """
                        <h2>Password reset sent</h2><hr>
                        <p>
                            We've emailed you instructions for setting your password, if an account exists with the email you entered. 
                            You should receive them shortly.<br>If you don't receive an email, please make sure you've entered the address 
                            you registered with, and check your spam folder.
                        </p>
                        """
                    )
                else:
                    messages.error(request, "Problem sending reset password email, <b>SERVER PROBLEM</b>")

            return redirect('homepage')

        '''for key, error in list(form.errors.items()):
            if key == 'captcha' and error[0] == 'This field is required.':
                messages.error(request, "You must pass the reCAPTCHA test")
                continue'''

        for error in list(form.errors.values()):
            messages.error(request, error)
            continue

    form = PasswordResetForm()
    return render(
        request=request, 
        template_name="password_reset.html", 
        context={"form": form}
        )

def passwordResetConfirm(request, uidb64, token):
    User = get_user_model()
    try:
        uid = force_str(urlsafe_base64_decode(uidb64))
        user = User.objects.get(pk=uid)
    except:
        user = None

    if user is not None and account_activation_token.check_token(user, token):
        if request.method == 'POST':
            form = SetPasswordForm(user, request.POST)
            if form.is_valid():
                form.save()
                messages.success(request, "Your password has been set. You may go ahead and <b>log in </b> now.")
                return redirect('homepage')
            else:
                for error in list(form.errors.values()):
                    messages.error(request, error)

        form = SetPasswordForm(user)
        return render(request, 'password_reset_confirm.html', {'form': form})
    else:
        messages.error(request, "Link is expired")

    messages.error(request, 'Something went wrong, redirecting back to Homepage')
    return redirect("homepage")