from typing import Protocol
from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth import login, logout, authenticate, get_user_model
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from django.template.loader import render_to_string
from django.contrib.sites.shortcuts import get_current_site
from django.utils import timezone
from datetime import timedelta
from django.utils.http import urlsafe_base64_encode, urlsafe_base64_decode
from django.utils.encoding import force_bytes, force_str
from django.core.mail import EmailMessage
from django.db.models import Sum, Count
from django.db.models.query_utils import Q
from django.views.decorators.http import require_POST
from django.http.response import HttpResponse, HttpResponseNotAllowed
from django.http import JsonResponse, HttpResponseRedirect
from django.urls import reverse
from collections import defaultdict
from .forms import (
    UserRegistrationForm,
    UserLoginForm,
    UserUpdateForm,
    SetPasswordForm,
    PasswordResetForm,
    QuizForms,
    SubjectForm
    )
from .decorators import (
    user_not_authenticated,
    teacher_required, student_required,
    teacher_and_owner_required,
    question_owner_required,
    option_owner_required
    )
from .tokens import account_activation_token
from .models import (
    CustomUser,
    Quiz,
    Question,
    Option,
    QuizAttempt,
    Answer,
    PlannedQuiz
    )
from .forms import QuizForm, QuestionForm, OptionForm


@teacher_required
def create_quiz(request):
    ''' creating new quiz '''
    teacher = request.user
    if request.method == 'POST':
        form = QuizForm(request.POST)
        if form.is_valid():
            quiz = form.save(commit=False)
            quiz.created_by = teacher
            quiz.save()
            return redirect('add_question', quiz_id=quiz.id)
    else:
        form = QuizForm()
    return render(request, 'quiz/create_quiz.html', {'form': form})


@teacher_required
def created_quiz(request):
    ''' list of created quizzes '''
    q = request.GET.get('q', '')
    user_quizzes = Quiz.objects.filter(
        Q(created_by=request.user) &
        (
            Q(title__icontains=q) |
            Q(subject__name__icontains=q) |
            Q(description__icontains=q) |
            Q(created_by__username__icontains=q) |
            Q(time_limit__icontains=q) |
            Q(pass_mark__icontains=q)
        )
    )

    context = {'quizzes': user_quizzes, 'q': q}

    return render(request, 'quiz/created_quiz.html', context)


@teacher_required
def other_quizzes(request):
    ''' list of created quizzes by other users '''
    q = request.GET.get('q', '')
    other_quizzes = Quiz.objects.filter(
        ~Q(created_by=request.user) &
        Q(published=True) &
        (
            Q(title__icontains=q) |
            Q(subject__name__icontains=q) |
            Q(description__icontains=q) |
            Q(created_by__username__icontains=q) |
            Q(time_limit__icontains=q) |
            Q(pass_mark__icontains=q)
        )
    )
    context = {'quizzes': other_quizzes, 'q': q}

    return render(request, 'quiz/created_quiz_others.html', context)


@teacher_required
def add_question_form(request):
    ''' question form for adding a question '''
    form = QuestionForm()
    context = {
        "form": form
    }
    return render(request, "partials/question_form.html", context)


@teacher_required
def add_option_form(request):
    ''' option form for adding an option '''
    form = OptionForm()
    context = {
        "form": form
    }
    return render(request, "partials/option_form.html", context)


@teacher_required
def add_question(request, quiz_id):
    ''' view for adding questions and options to quiz '''
    quiz = Quiz.objects.get(id=quiz_id)
    questions = Question.objects.filter(quiz=quiz)
    total_questions = questions.count()
    total_marks = questions.aggregate(total=Sum('marks'))['total']
    form = QuestionForm(request.POST or None)
    if request.method == 'POST':
        if form.is_valid():
            question = form.save(commit=False)
            question.quiz = quiz
            question.save()
            return redirect('add_option', question_id=question.id)
    else:
        form = QuestionForm()

    context = {
        "quiz": quiz,
        "questions": questions,
        "form": form,
        "total_questions": total_questions,
        "total_marks": total_marks,
    }
    return render(request, 'quiz/add_question.html', context)


def validate_quiz_requirements(quiz):
    min_options = 2
    if quiz.questions.count() == 0:
        return False, "The quiz must contain at least one question."

    for question in quiz.questions.all():
        options_count = question.options.count()
        correct_options = question.options.filter(is_correct=True).exists()
        question_text = question.text
        
        if options_count < min_options:
            return False, (f"The question '{question_text}' must have at "
                           f"least two options.")
        if not correct_options:
            return False, (f"The question '{question_text}' must have at "
                           "least one correct answer.")

    return True, ""


@teacher_required
def validate_quiz_before_test(request, quiz_id):
    quiz = get_object_or_404(Quiz, pk=quiz_id)
    is_valid, message = validate_quiz_requirements(quiz)

    if not is_valid:
        messages.error(request, message)
        return redirect('add_question', quiz_id=quiz.id)
    
    return redirect('test_quiz', quiz_id=quiz.id)


@teacher_required
def validate_and_publish_quiz(request, quiz_id):
    quiz = get_object_or_404(Quiz, pk=quiz_id)
    is_valid, message = validate_quiz_requirements(quiz)

    if not is_valid:
        messages.error(request, message)
    else:
        quiz.published = not quiz.published
        quiz.save()
        message = (
            "Quiz published successfully." if quiz.published else
            "Quiz unpublished successfully."
        )
        messages.success(request, message)

    return redirect('add_question', quiz_id=quiz.id)


@teacher_required
def validate_and_publish_quiz2(request, quiz_id):
    quiz = get_object_or_404(Quiz, pk=quiz_id)
    is_valid, message = validate_quiz_requirements(quiz)

    if not is_valid:
        messages.error(request, message)
        return redirect('add_question', quiz_id=quiz.id)
    else:
        quiz.published = not quiz.published
        quiz.save()
        message = (
            "Quiz published successfully." if quiz.published else
            "Quiz unpublished successfully."
        )
        messages.success(request, message)

    return redirect('created_quiz')


@teacher_required
def quiz_detail(request, quiz_id):
    ''' displaying quiz details '''
    quiz = get_object_or_404(Quiz, id=quiz_id)
    context = {
        "quiz": quiz
    }
    return render(request, "partials/quiz_detail.html", context)


@teacher_required
def question_detail(request, question_id):
    ''' displaying question details '''
    question = get_object_or_404(Question, id=question_id)
    context = {
        "question": question
    }
    return render(request, "partials/question_detail.html", context)


@teacher_required
def option_detail(request, option_id):
    ''' displaying option details '''
    option = get_object_or_404(Option, id=option_id)
    associated_question = option.question
    print(associated_question.id)
    context = {
        "option": option,
        "associated_question": associated_question
    }
    return render(request, "partials/option_detail.html", context)


@teacher_and_owner_required
def delete_quiz(request, quiz_id):
    ''' deleting quiz only by the creator '''
    quiz = get_object_or_404(Quiz, id=quiz_id)
    if request.method == 'POST':
        quiz.delete()
        return HttpResponse("")

    return HttpResponseNotAllowed(
        [
            "POST",
        ]
    )


@question_owner_required
def delete_question(request, question_id):
    ''' deleting question only by the owner '''
    question = get_object_or_404(Question, id=question_id)
    if request.method == 'POST':
        question.delete()
        return HttpResponse("")

    return HttpResponseNotAllowed(
        [
            "POST",
        ]
    )


@option_owner_required
def delete_option(request, option_id):
    ''' deleting option only by the owner '''
    option = get_object_or_404(Option, id=option_id)
    if request.method == 'POST':
        option.delete()
        return HttpResponse("")

    return HttpResponseNotAllowed(
        [
            "POST",
        ]
    )


@question_owner_required
def add_option(request, question_id):
    ''' adding option to a question '''
    question = Question.objects.get(id=question_id)
    options = Option.objects.filter(question=question)
    form = OptionForm(request.POST or None)
    if request.method == 'POST':
        if form.is_valid():
            option = form.save(commit=False)
            option.question = question
            option.save()
            return redirect('option_detail', option_id=option.id)
    else:
        form = OptionForm()

    context = {
        "question": question,
        "options": options,
        "form": form
    }

    return render(request, 'quiz/add_option.html', context)


@question_owner_required
def validate_option(request, question_id):
    question = get_object_or_404(Question, id=question_id)
    options = Option.objects.filter(question=question)
    correct_options = options.filter(is_correct=True)

    # Check if the question has at least two options
    if options.count() < 2:
        messages.error(request, "Each question must have at least two options.")
        return redirect('add_option', question_id=question.id)

    # Check if at least one option is marked as correct
    if correct_options.count() < 1:
        messages.error(request, "There must be at least one correct option.")
        return redirect('add_option', question_id=question.id)

    # If validations pass, redirect to a page indicating the question setup is complete
    # or go back to the quiz details page where you can add more questions or finalize the quiz
    messages.success(request, "Question setup is complete. You can add another question or finalize the quiz.")
    return redirect('add_question', quiz_id=question.quiz.id)


@teacher_and_owner_required
def update_quiz(request, quiz_id):
    ''' updating quiz by owner '''
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


@question_owner_required
def update_question(request, question_id):
    ''' updating question by owner '''
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


@option_owner_required
def update_option(request, option_id):
    ''' updating option by owner '''
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


@student_required
def get_quiz(request, quiz_id):
    ''' getting quiz for answering by student '''
    quiz = get_object_or_404(Quiz, id=quiz_id, published=True)
    questions = quiz.questions.prefetch_related('options').all()
    total_questions = questions.count()
    attempt_count = QuizAttempt.objects.filter(
        quiz=quiz, user=request.user).count()
    if request.method == 'POST':
        form = QuizForms(request.POST, questions=questions)
        if form.is_valid():
            pass
    else:
        form = QuizForms(questions=questions)
    context = {
        'quiz': quiz,
        'form': form,
        'attempt_count': attempt_count,
        'total_questions': total_questions
    }
    return render(request, 'quiz/get_quiz.html', context)


@teacher_required
def test_quiz(request, quiz_id):
    ''' getting quiz to test by teacher '''
    quiz = get_object_or_404(Quiz, id=quiz_id, created_by=request.user)
    questions = quiz.questions.prefetch_related('options').all()

    if request.method == 'POST':
        form = QuizForms(request.POST, questions=questions)
        if form.is_valid():
            pass
    else:
        form = QuizForms(questions=questions)

    return render(request, 'quiz/test_quiz.html', {'quiz': quiz, 'form': form})


@student_required
@require_POST
def start_quiz(request, quiz_id):
    ''' view for starting a quiz by student '''
    quiz = get_object_or_404(Quiz, pk=quiz_id, published=True)
    current_attempts_count = QuizAttempt.objects.filter(
        user=request.user, quiz=quiz, expired=False).count()

    if current_attempts_count >= quiz.max_attempts:
        return JsonResponse({
            'status': 'error',
            'message': 'Maximum number of attempts reached.'
        }, status=400)

    # new attempt if maximum attempts is not reached
    attempt = QuizAttempt.objects.create(
        user=request.user,
        quiz=quiz,
        start_time=timezone.now()
    )

    return JsonResponse({
        'status': 'success',
        'message': 'New quiz attempt started',
        'attempt_id': attempt.id
    })


@teacher_required
@require_POST
def start_test_quiz(request, quiz_id):
    ''' start quiz testing by teacher '''
    quiz = get_object_or_404(Quiz, pk=quiz_id)

    attempt = QuizAttempt.objects.create(
        user=request.user,
        quiz=quiz,
        start_time=timezone.now()
    )

    return JsonResponse({
        'status': 'success',
        'message': 'New quiz test started',
        'attempt_id': attempt.id
    })


@student_required
def submit_quiz(request, quiz_id):
    ''' submit quiz by student after answering '''
    if request.method == 'POST':
        quiz = get_object_or_404(Quiz, pk=quiz_id)
        quiz_attempt = QuizAttempt.objects.filter(
            user=request.user, quiz=quiz).order_by('-start_time').first()
        if not quiz_attempt:
            return HttpResponse("No quiz attempt found", status=404)

        quiz_attempt.end_time = timezone.now()
        quiz_attempt.save()

        total_score = 0

        for key, value in request.POST.lists():
            if key.startswith('question_'):
                question_id = key.split('_')[1]
                selected_option_ids = value

                question = get_object_or_404(Question, pk=question_id)
                answer = Answer.objects.create(
                    quiz_attempt=quiz_attempt, question=question)

                # Adding selected options to the answer
                for option_id in selected_option_ids:
                    selected_option = get_object_or_404(Option, pk=option_id)
                    answer.selected_options.add(selected_option)

                # Use is_fully_correct method to check if the answer is correct
                if answer.is_fully_correct():
                    total_score += question.marks

        total_marks = sum(question.marks for question in quiz.questions.all())
        percentage_marks = round(
            (total_score / total_marks) * 100) if total_marks else 0

        quiz_attempt.score = total_score
        quiz_attempt.percentage_score = percentage_marks
        quiz_attempt.passed = percentage_marks >= quiz.pass_mark
        quiz_attempt.save()

        PlannedQuiz.objects.filter(
            student=request.user, quiz=quiz, taken=False).delete()

        return redirect('quiz_results', quiz_attempt.id)
    else:
        return HttpResponse("Invalid request", status=400)


@teacher_required
def submit_test_quiz(request, quiz_id):
    if request.method == 'POST':
        quiz = get_object_or_404(Quiz, pk=quiz_id)
        quiz_attempt = QuizAttempt.objects.filter(
            user=request.user, quiz=quiz).order_by('-start_time').first()
        if not quiz_attempt:
            return HttpResponse("No quiz attempt found", status=404)

        quiz_attempt.end_time = timezone.now()
        quiz_attempt.save()

        total_score = 0

        for key, value in request.POST.lists():
            if key.startswith('question_'):
                question_id = key.split('_')[1]
                selected_option_ids = value

                question = get_object_or_404(Question, pk=question_id)

                # Create an Answer instance
                answer = Answer.objects.create(
                    quiz_attempt=quiz_attempt, question=question)

                # Add selected options to the Answer instance
                for option_id in selected_option_ids:
                    selected_option = get_object_or_404(Option, pk=option_id)
                    answer.selected_options.add(selected_option)

                # Using is_fully_correct method to check correct options
                if answer.is_fully_correct():
                    total_score += question.marks

        total_marks = sum(question.marks for question in quiz.questions.all())
        percentage_marks = round(
            (total_score / total_marks) * 100) if total_marks else 0

        quiz_attempt.score = total_score
        quiz_attempt.percentage_score = percentage_marks
        quiz_attempt.passed = percentage_marks >= quiz.pass_mark
        quiz_attempt.save()

        return redirect('quiz_test_results', quiz_attempt.id)
    else:
        return HttpResponse("Invalid request", status=400)


@student_required
def quiz_results(request, attempt_id):
    ''' getting quiz results by students '''
    now = timezone.now()
    attempt = get_object_or_404(QuizAttempt, pk=attempt_id)
    total_marks = sum(
        question.marks for question in attempt.quiz.questions.all())
    date_submitted = attempt.end_time.strftime(
        "%Y-%m-%d %H:%M:%S") if attempt.end_time else "N/A"

    if attempt.start_time and attempt.end_time:
        time_delta = attempt.end_time - attempt.start_time
        minutes = time_delta.seconds // 60
        seconds = time_delta.seconds % 60
        time_taken_str = f"{minutes} minutes, {seconds} seconds"
    else:
        time_taken_str = "N/A"

    number_of_attempts = QuizAttempt.objects.filter(
        user=attempt.user, quiz=attempt.quiz, expired=False).count()
    non_expired_attempts = QuizAttempt.objects.filter(
        user=attempt.user, quiz=attempt.quiz, expired=False
    ).order_by('-date_attempted')
    max_attempts = attempt.quiz.max_attempts
    hours = 0
    minutes = 0
    if non_expired_attempts.count() >= max_attempts:
        last_attempt = non_expired_attempts.first()
        time_since_last_attempt = now - last_attempt.date_attempted
        cooldown_period = timedelta(days=1)

        if time_since_last_attempt > cooldown_period:
            non_expired_attempts.update(expired=True)
        else:
            remaining_time = cooldown_period - time_since_last_attempt
            hours, remainder = divmod(remaining_time.seconds, 3600)
            minutes = remainder // 60

    context = {
        'attempt': attempt,
        'total_marks': total_marks,
        'date_submitted': date_submitted,
        'time_taken': time_taken_str,
        'number_of_attempts': number_of_attempts,
        'max_attempts': max_attempts,
        'remaining_hours': hours,
        'remaining_minutes': minutes,
    }
    return render(request, 'quiz/quiz_results.html', context)


@teacher_required
def quiz_test_results(request, attempt_id):
    ''' quiz results for teaching after testing quiz '''
    attempt = get_object_or_404(QuizAttempt, pk=attempt_id)
    total_marks = sum(
        question.marks for question in attempt.quiz.questions.all())
    date_submitted = attempt.end_time.strftime(
        "%Y-%m-%d %H:%M:%S") if attempt.end_time else "N/A"

    if attempt.start_time and attempt.end_time:
        time_delta = attempt.end_time - attempt.start_time
        minutes = time_delta.seconds // 60
        seconds = time_delta.seconds % 60
        time_taken_str = f"{minutes} minutes, {seconds} seconds"
    else:
        time_taken_str = "N/A"

    context = {
        'attempt': attempt,
        'total_marks': total_marks,
        'date_submitted': date_submitted,
        'time_taken': time_taken_str,
    }
    return render(request, 'quiz/quiz_test_results.html', context)


@teacher_required
def delete_attempt(request, attempt_id):
    ''' deleting quiz attempt after testing quiz '''
    attempt = get_object_or_404(QuizAttempt, id=attempt_id, user=request.user)
    quiz_id = attempt.quiz.id
    attempt.delete()

    return HttpResponseRedirect(reverse('add_question', args=[quiz_id]))


@student_required
def user_quizzes(request):
    ''' all quizzes students can access according to selected subject '''
    user = request.user
    student_subjects = user.subjects.all()
    attempted_quiz_ids = QuizAttempt.objects.filter(
        user=user).values_list('quiz_id', flat=True)

    q = request.GET.get('q', '')
    quizzes = Quiz.objects.filter(
        Q(published=True) &
        Q(subject__in=student_subjects) &
        (
            Q(title__icontains=q) |
            Q(subject__name__icontains=q) |
            Q(description__icontains=q) |
            Q(created_by__username__icontains=q) |
            Q(time_limit__icontains=q) |
            Q(pass_mark__icontains=q)
        )
    ).exclude(
        id__in=attempted_quiz_ids
    ).distinct()
    planned_quizzes = PlannedQuiz.objects.filter(student=user, taken=False)
    planned_quizzes_ids = [quiz.quiz.id for quiz in planned_quizzes]

    # Quizzes with at least one attempt by the user
    attempted_quizzes_ids = QuizAttempt.objects.filter(
        user=user).values_list('quiz_id', flat=True)
    attempted_quizzes = quizzes.filter(id__in=attempted_quizzes_ids)

    context = {
        'quizzes': quizzes,
        'attempted_quizzes': attempted_quizzes,
        'user': user,
        'planned_quizzes_ids': planned_quizzes_ids,
        'student_subjects': student_subjects,
        'q': q,
    }

    return render(request, 'quiz/user_quizzes.html', context)


@student_required
def completed_quizzes(request):
    ''' list of quizzes a student has done '''
    user = request.user
    student_subjects = user.subjects.all()

    q = request.GET.get('q', '')
    attempted_quizzes_ids = QuizAttempt.objects.filter(
        user=user).values_list('quiz_id', flat=True)

    attempted_quizzes = Quiz.objects.filter(
        Q(id__in=attempted_quizzes_ids) &
        Q(subject__in=student_subjects) &
        (
            Q(title__icontains=q) |
            Q(subject__name__icontains=q) |
            Q(description__icontains=q) |
            Q(created_by__username__icontains=q) |
            Q(time_limit__icontains=q) |
            Q(pass_mark__icontains=q)
        )
    ).distinct()

    context = {
        'attempted_quizzes': attempted_quizzes,
        'user': user,
        'q': q,
    }
    return render(request, 'quiz/completed_quizzes.html', context)


@login_required
def quiz_attempts(request, quiz_id):
    ''' list of attempted quizzes '''
    now = timezone.now()
    user = request.user
    attempts = QuizAttempt.objects.filter(
        user=user, quiz_id=quiz_id).order_by('-date_attempted')
    quiz = get_object_or_404(Quiz, id=quiz_id)
    non_expired_attempts = QuizAttempt.objects.filter(
        user=user, quiz=quiz, expired=False).order_by('-date_attempted')
    total_attempts = non_expired_attempts.count()
    hours = 0
    minutes = 0
    if non_expired_attempts.count() >= quiz.max_attempts:
        last_attempt = non_expired_attempts.first()
        time_since_last_attempt = now - last_attempt.date_attempted
        cooldown_period = timedelta(days=1)
        if not last_attempt.passed:
            if time_since_last_attempt > cooldown_period:
                non_expired_attempts.update(expired=True)
            else:
                remaining_time = cooldown_period - time_since_last_attempt
                hours, remainder = divmod(remaining_time.seconds, 3600)
                minutes = remainder // 60

    context = {
        'attempts': attempts,
        'total_attempts': total_attempts,
        'non_expired_attempts': non_expired_attempts,
        'remaining_hours': hours,
        'remaining_minutes': minutes,
    }
    attempts_html = render_to_string('partials/quiz_attempts.html', context)

    return HttpResponse(attempts_html)


@teacher_required
def quiz_attempts_owner(request, quiz_id):
    ''' quiz attempts for a teacher's quizzes '''
    all_attempts = QuizAttempt.objects.filter(
        quiz_id=quiz_id,
        user__status='student'
    ).select_related('user').order_by('user', '-date_attempted')
    # Organizing attempts by user
    attempts_by_user = defaultdict(list)
    for attempt in all_attempts:
        attempts_by_user[attempt.user].append(attempt)

    context = {'attempts_by_user': dict(attempts_by_user)}
    attempts_html = render_to_string(
        'partials/quiz_attempts_owner.html', context)

    return HttpResponse(attempts_html)


@student_required
def view_take_later(request):
    ''' quizzes saved for later by students '''
    q = request.GET.get('q', '')
    planned_quizzes = PlannedQuiz.objects.filter(
        student=request.user, taken=False, quiz__published=True
    ).filter(
        Q(quiz__title__icontains=q) |
        Q(quiz__subject__name__icontains=q) |
        Q(quiz__description__icontains=q) |
        Q(quiz__created_by__username__icontains=q) |
        Q(quiz__time_limit__icontains=q) |
        Q(quiz__pass_mark__icontains=q)
    )
    quizzes = [quiz.quiz for quiz in planned_quizzes]

    context = {'quizzes': quizzes, 'q': q}

    return render(request, 'quiz/view_take_later.html', context)


@login_required
@require_POST
def toggle_quiz_published(request, quiz_id):
    ''' toggle to publish or unpublish quiz'''
    quiz = get_object_or_404(Quiz, id=quiz_id, created_by=request.user)
    quiz.published = not quiz.published
    quiz.save()

    context = {'quiz': quiz}
    return render(request, 'partials/toggle_published_button.html', context)


@student_required
@require_POST
def toggle_take_later(request, quiz_id):
    ''' toggle to take quiz later or remove '''
    quiz = get_object_or_404(Quiz, pk=quiz_id)
    planned_quiz, created = PlannedQuiz.objects.get_or_create(
        student=request.user, quiz=quiz)

    button_id = f'quiz-button-{quiz_id}'

    if created:
        planned_quiz.save()
        button_html = (
            f'<button class="btn btn-secondary btn-sm" id="{button_id}" '
            f'hx-post="{request.build_absolute_uri()}" hx-swap="outerHTML" '
            f'hx-target="#{button_id}">Added</button>'
        )
    else:
        planned_quiz.delete()
        button_html = (
            f'<button class="btn btn-primary btn-sm" id="{button_id}" '
            f'hx-post="{request.build_absolute_uri()}" hx-swap="outerHTML" '
            f'hx-target="#{button_id}">Take Later</button>'
        )

    return HttpResponse(button_html)


@teacher_required
def user_created_attempted_quizzes(request):
    ''' attempted quizzes for teacher's quizzes '''
    q = request.GET.get('q', '')
    user_quizzes = Quiz.objects.filter(
        Q(created_by=request.user) &
        (
            Q(title__icontains=q) |
            Q(subject__name__icontains=q)
        )
    )
    attempted_quizzes = user_quizzes.filter(
        quizattempt__isnull=False,
        quizattempt__user__status="student"
    ).annotate(
        total_attempts=Count('quizattempt'),
        total_students=Count('quizattempt__user', distinct=True)
    ).distinct()

    context = {
        'attempted_quizzes': attempted_quizzes,
        'q': q
    }

    return render(request, 'quiz/view_attempted_quizzes.html', context)


def homepage(request):
    if request.user.is_authenticated:
        if request.user.status == 'teacher':
            return redirect('created_quiz')
        elif request.user.status == 'student':
            return redirect('user_quizzes')
    return render(request=request, template_name="quiz/landing.html")


def activate(request, uidb64, token):
    ''' activating new account '''
    User = get_user_model()
    try:
        uid = force_str(urlsafe_base64_decode(uidb64))
        user = User.objects.get(pk=uid)
    except User.DoesNotExist:
        user = None

    if user is not None and account_activation_token.check_token(user, token):
        user.is_active = True
        user.save()

        messages.success(
            request,
            "Thank you for your email confirmation."
            "Now you can login your account."
        )
        return redirect('login')
    else:
        messages.error(request, "Activation link is invalid!")

    return redirect('login')


def activateEmail(request, user, to_email):
    ''' activating user email '''
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
        messages.success(
            request,
            f'Dear <b>{user}</b>, please go to your email <b>{to_email}</b>'
            'inbox and click on the received activation link to confirm and'
            'complete the registration.<b>Note:</b> Check your spam folder.'
        )
    else:
        messages.error(
            request,
            f'Problem sending email to {to_email},'
            'check if you typed it correctly.'
        )


@user_not_authenticated
def register(request):
    ''' register new user '''
    if request.method == "POST":
        form = UserRegistrationForm(request.POST)
        if form.is_valid():
            user = form.save(commit=False)
            user.is_active = False
            user.save()
            activateEmail(request, user, form.cleaned_data.get('email'))
            return redirect('login')

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
    ''' logging out user '''
    logout(request)
    messages.info(request, "Logged out successfully!")
    return redirect("login")


@user_not_authenticated
def custom_login(request):
    ''' logging in user '''
    if request.method == "POST":
        form = UserLoginForm(request=request, data=request.POST)
        if form.is_valid():
            user = authenticate(
                username=form.cleaned_data["username"],
                password=form.cleaned_data["password"],
            )
            if user is not None:
                login(request, user)
                messages.success(
                    request,
                    f"Hello <b>{user.username}</b>! You have been logged in"
                )
                if user.status == 'teacher':
                    return redirect('created_quiz')
                elif user.status == 'student':
                    return redirect('user_quizzes')

        else:
            for error in list(form.errors.values()):
                messages.error(request, error)

    form = UserLoginForm()

    return render(
        request=request,
        template_name="quiz/login.html",
        context={"form": form}
        )


@login_required
def profile(request, username):
    ''' user profile '''
    user = get_object_or_404(CustomUser, username=username)

    if request.user != user:
        messages.error(
            request,
            "You do not have permission to edit this profile."
        )
        return redirect("login")

    if request.method == "POST":
        form = UserUpdateForm(request.POST, request.FILES, instance=user)
        if form.is_valid():
            form.save()
            messages.success(
                request,
                f'{user.username}, your profile has been updated!'
            )
            return redirect("profile", username=user.username)

    else:
        form = UserUpdateForm(instance=user)
    return render(
        request=request,
        template_name="quiz/profile.html",
        context={"form": form}
    )


@student_required
def subjects(request, username):
    ''' updates subjects '''
    user = get_object_or_404(CustomUser, username=username)

    if request.user != user:
        messages.error(
            request,
            "You do not have permission to edit subjects."
        )
        return redirect("login")

    if request.method == "POST":
        form = SubjectForm(request.POST, instance=user)
        if form.is_valid():
            form.save()
            messages.success(
                request,
                f'{user.username}, your subjects have been updated!'
            )
            return redirect("subjects", username=user.username)

    else:
        form = SubjectForm(instance=user)
    return render(
        request=request,
        template_name="quiz/subjects.html",
        context={"form": form}
    )


@login_required
def password_change(request):
    ''' password change '''
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
    ''' resetting password '''
    if request.method == 'POST':
        form = PasswordResetForm(request.POST)
        if form.is_valid():
            user_email = form.cleaned_data['email']
            associated_user = get_user_model().objects.filter(
                Q(email=user_email)).first()
            if associated_user:
                subject = "Password Reset Request"
                message = render_to_string("template_reset_password.html", {
                    'user': associated_user,
                    'domain': get_current_site(request).domain,
                    'uid': urlsafe_base64_encode(
                        force_bytes(associated_user.pk)),
                    'token': account_activation_token.make_token(
                        associated_user),
                    "protocol": 'https' if request.is_secure() else 'http'
                })
                email = EmailMessage(
                    subject,
                    message,
                    to=[associated_user.email]
                )
                if email.send():
                    messages.success(
                        request,
                        "<h2>Password reset sent</h2><hr>"
                        "<p>We've emailed you instructions for setting your"
                        "password, if an account exists with the email you "
                        "entered, you should receive them shortly.<br>If "
                        "you don't receive an email, please make sure you've "
                        "entered the address you registered with, "
                        "and check your spam folder.</p>"
                    )
                else:
                    messages.error(
                        request,
                        "Problem sending reset password email,"
                        "<b>SERVER PROBLEM</b>"
                    )

            return redirect('login')

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
    ''' password reset confirmation '''
    User = get_user_model()
    try:
        uid = force_str(urlsafe_base64_decode(uidb64))
        user = User.objects.get(pk=uid)
    except User.DoesNotExist:
        user = None

    if user is not None and account_activation_token.check_token(user, token):
        if request.method == 'POST':
            form = SetPasswordForm(user, request.POST)
            if form.is_valid():
                form.save()
                messages.success(
                    request,
                    "Your password has been set. "
                    "You may go ahead and <b>log in </b> now."
                )
                return redirect('login')
            else:
                for error in list(form.errors.values()):
                    messages.error(request, error)

        form = SetPasswordForm(user)
        return render(request, 'password_reset_confirm.html', {'form': form})
    else:
        messages.error(request, "Link is expired")

    messages.error(
        request,
        'Something went wrong, redirecting back to Homepage'
    )
    return redirect("login")
