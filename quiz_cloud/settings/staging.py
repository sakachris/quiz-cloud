# settings/staging.py
from .base import *

# DEBUG = True
ALLOWED_HOSTS = ['staging.pointsystem.tech']

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': os.getenv('DB_NAME_STAGING'),
        'USER': os.getenv('DB_USER_STAGING'),
        'PASSWORD': os.getenv('DB_PASSWORD_STAGING'),
        'HOST': os.getenv('DB_HOST_STAGING'),
        'PORT': os.getenv('DB_PORT'),
    }
}