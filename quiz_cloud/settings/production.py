# settings/production.py
from .base import *

DEBUG = False
# ALLOWED_HOSTS = ['pointsystem.tech', 'www.pointsystem.tech']
ALLOWED_HOSTS = ['quizcloud.co.ke', 'www.quizcloud.co.ke']

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': os.getenv('DB_NAME_PRODUCTION'),
        'USER': os.getenv('DB_USER_PRODUCTION'),
        'PASSWORD': os.getenv('DB_PASSWORD_PRODUCTION'),
        'HOST': os.getenv('DB_HOST_PRODUCTION'),
        'PORT': os.getenv('DB_PORT'),
    }
}