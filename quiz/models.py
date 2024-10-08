from django.contrib.auth.models import AbstractUser
from django.db import models
from django.template.defaultfilters import slugify
from django.conf import settings
import os
import uuid


class Subject(models.Model):
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    name = models.CharField(max_length=255)

    def __str__(self):
        return self.name


class Quiz(models.Model):
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    title = models.CharField(max_length=255)
    description = models.TextField()
    time_limit = models.PositiveIntegerField(help_text="Time limit in minutes")
    subject = models.ForeignKey(
        Subject, related_name='quizzes',
        on_delete=models.SET_NULL,
        null=True
    )
    created_by = models.ForeignKey(
        settings.AUTH_USER_MODEL,
        on_delete=models.PROTECT,
        related_name='created_quizzes'
    )
    max_attempts = models.PositiveIntegerField(
        default=3,
        help_text="Maximum number of attempts allowed"
    )
    pass_mark = models.PositiveIntegerField(
        default=80,
        help_text="Percentage Pass Mark"
    )
    published = models.BooleanField(default=False)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.title


class Question(models.Model):
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    quiz = models.ForeignKey(
        Quiz, related_name='questions', on_delete=models.CASCADE
    )
    text = models.TextField()
    marks = models.PositiveIntegerField(default=5)

    def __str__(self):
        return self.text

    def has_multiple_correct_answers(self):
        return self.options.filter(is_correct=True).count() > 1


class Option(models.Model):
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    question = models.ForeignKey(
        Question, related_name='options', on_delete=models.CASCADE, null=True
    )
    text = models.CharField(max_length=255)
    is_correct = models.BooleanField(default=False)

    def __str__(self):
        return self.text


class PlannedQuiz(models.Model):
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    student = models.ForeignKey(
        settings.AUTH_USER_MODEL,
        on_delete=models.PROTECT,
        related_name='planned_quizzes'
    )
    quiz = models.ForeignKey(
        'Quiz', on_delete=models.CASCADE
    )
    taken = models.BooleanField(default=False)

    class Meta:
        unique_together = ['student', 'quiz']

    def __str__(self):
        return f"{self.student}'s planned quiz: {self.quiz.title}"


class QuizAttempt(models.Model):
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    user = models.ForeignKey(
        settings.AUTH_USER_MODEL, on_delete=models.PROTECT
    )
    quiz = models.ForeignKey(Quiz, on_delete=models.CASCADE)
    score = models.PositiveIntegerField(default=0)
    percentage_score = models.PositiveIntegerField(default=0)
    passed = models.BooleanField(default=False)
    date_attempted = models.DateTimeField(auto_now_add=True)
    start_time = models.DateTimeField(null=True, blank=True)
    end_time = models.DateTimeField(null=True, blank=True)
    expired = models.BooleanField(default=False)

    def __str__(self):
        return f"{self.user}'s attempt on {self.quiz.title}"


class Answer(models.Model):
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    quiz_attempt = models.ForeignKey(
        QuizAttempt, related_name='answers', on_delete=models.CASCADE
    )
    question = models.ForeignKey(Question, on_delete=models.CASCADE)
    selected_options = models.ManyToManyField(Option)

    def __str__(self):
        options_str = ', '.join(
            option.text for option in self.selected_options.all())
        question = self.question.text
        user = self.quiz_attempt.user
        return f"Answer to {question} by {user}: {options_str}"

    def is_fully_correct(self):
        correct_options = self.question.options.filter(is_correct=True)
        selected_correct_options = self.selected_options.filter(
            is_correct=True)
        return (
            correct_options.count() == selected_correct_options.count() and
            selected_correct_options.count() == self.selected_options.count()
        )


class CustomUser(AbstractUser):
    def image_upload_to(self, instance=None):
        if instance:
            return os.path.join("Users", self.username, instance)
        return None

    STATUS = (
        ('student', 'student'),
        ('teacher', 'teacher'),
    )

    subjects = models.ManyToManyField(Subject, blank=True)
    email = models.EmailField(unique=True)
    status = models.CharField(
        max_length=100, choices=STATUS, default='student'
    )
    school = models.CharField("School", max_length=100, default='', blank=True)
    image = models.ImageField(
        default='default/user.jpg', upload_to=image_upload_to
    )

    def __str__(self):
        return self.username
