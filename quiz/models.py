from django.contrib.auth.models import AbstractUser
from django.db import models
from django.template.defaultfilters import slugify
from django.conf import settings
import os

class Subject(models.Model):
    name = models.CharField(max_length=255)

    def __str__(self):
        return self.name

class Quiz(models.Model):
    title = models.CharField(max_length=255)
    description = models.TextField()
    time_limit = models.PositiveIntegerField(help_text="Time limit in minutes")
    # for_class = models.CharField(max_length=50, blank=True, help_text="Specify if for a specific class")
    subject = models.ForeignKey(Subject, related_name='quizzes', on_delete=models.SET_NULL, null=True)

    def __str__(self):
        return self.title

class Question(models.Model):
    quiz = models.ForeignKey(Quiz, related_name='questions', on_delete=models.CASCADE)
    text = models.TextField()
    marks = models.PositiveIntegerField(default=5)

    def __str__(self):
        return self.text

class Option(models.Model):
    question = models.ForeignKey(Question, related_name='options', on_delete=models.CASCADE, null=True)
    text = models.CharField(max_length=255)
    is_correct = models.BooleanField(default=False)

    def __str__(self):
        return self.text

class QuizAttempt(models.Model):
    user = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.PROTECT)
    quiz = models.ForeignKey(Quiz, on_delete=models.CASCADE)
    score = models.PositiveIntegerField(default=0)
    date_attempted = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"{self.user}'s attempt on {self.quiz.title}"

class Answer(models.Model):
    quiz_attempt = models.ForeignKey(QuizAttempt, related_name='answers', on_delete=models.CASCADE)
    question = models.ForeignKey(Question, on_delete=models.CASCADE)
    selected_option = models.ForeignKey(Option, on_delete=models.CASCADE)

    def __str__(self):
        return f"Answer to {self.question.text} by {self.quiz_attempt.user}"

class CustomUser(AbstractUser):
    def image_upload_to(self, instance=None):
        if instance:
            return os.path.join("Users", self.username, instance)
        return None

    STATUS = (
        ('student', 'student'),
        ('teacher', 'teacher'),
    )

    SUBJECT_CHOICES = [
        ('maths', 'Maths'),
        ('english', 'English'),
        ('science', 'Science'),
    ]
    DEFAULT_SUBJECT = 'maths'
    subjects = models.ManyToManyField(Subject, blank=True)

    email = models.EmailField(unique=True)
    status = models.CharField(max_length=100, choices=STATUS, default='student')
    school = models.CharField("School", max_length=100, default='', blank=True)
    image = models.ImageField(default='default/user.jpg', upload_to=image_upload_to)

    def __str__(self):
        return self.username