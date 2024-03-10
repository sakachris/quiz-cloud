from django.contrib.auth.models import AbstractUser
from django.db import models
from django.template.defaultfilters import slugify
import os

class Subject(models.Model):
    name = models.CharField(max_length=255)

    def __str__(self):
        return self.name

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