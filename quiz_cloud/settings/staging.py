# settings/staging.py
from .base import *

DEBUG = True
ALLOWED_HOSTS = ['staging.pointsystem.tech']
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'quizcloudstaging',
        'USER': 'quizstaging',
        'PASSWORD': 'myquizcloudstaging',
        'HOST': 'db-staging',
        'PORT': '3307',
    }
}
