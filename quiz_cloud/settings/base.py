"""
Django settings for quiz_cloud project.

Generated by 'django-admin startproject' using Django 5.0.3.

For more information on this file, see
https://docs.djangoproject.com/en/5.0/topics/settings/

For the full list of settings and their values, see
https://docs.djangoproject.com/en/5.0/ref/settings/
"""

from pathlib import Path
from dotenv import load_dotenv
import os

load_dotenv()  # Load environment variables from .env file

# Build paths inside the project like this: BASE_DIR / 'subdir'.
# BASE_DIR = Path(__file__).resolve().parent.parent
BASE_DIR = Path(__file__).resolve().parent.parent.parent


#BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

# STATIC_URL = '/static/'
# STATIC_ROOT = os.path.join(BASE_DIR, 'staticfiles')  # This is where collectstatic will collect files
# STATIC_ROOT = os.path.join(BASE_DIR, 'static/')
# STATICFILES_DIRS = [
#     os.path.join(BASE_DIR, 'quiz', 'static'),
# ]

# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/5.0/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!
# SECRET_KEY = os.getenv('SECRET_KEY')
SECRET_KEY = '0+50tw*!%r8&%86pp81=q1pjz14z1t(&0a!p#9kf^83__6_hrc'

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True
#DEBUG = os.environ.get('DEBUG', 'False') == 'True'

ALLOWED_HOSTS = ['localhost', '127.0.0.1']

CSRF_TRUSTED_ORIGINS = [
    'https://pointsystem.tech',
    'https://www.pointsystem.tech',
    'https://staging.pointsystem.tech',
    'http://127.0.0.1'
]

CSRF_COOKIE_DOMAIN = '.pointsystem.tech'

CSRF_COOKIE_SECURE = True


# Application definition

INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'quiz.apps.QuizConfig',
    'quiz_api.apps.QuizApiConfig',
    'fontawesomefree',
    'crispy_forms',
    'crispy_bootstrap5',
    'rest_framework',
]

AUTH_USER_MODEL = 'quiz.CustomUser'

MIDDLEWARE = [
    'django.middleware.security.SecurityMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
    'quiz.middleware.SessionTimeoutMiddleware',
]

ROOT_URLCONF = 'quiz_cloud.urls'

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [BASE_DIR / "templates"],
        # 'DIRS': [],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
            ],
        },
    },
]

WSGI_APPLICATION = 'quiz_cloud.wsgi.application'


# Database
# https://docs.djangoproject.com/en/5.0/ref/settings/#databases

# DATABASES = {
#     'default': {
#         'ENGINE': 'django.db.backends.mysql',
#         'NAME': os.getenv('DB_NAME'),
#         'USER': os.getenv('DB_USER'),
#         'PASSWORD': os.getenv('DB_PASSWORD'),
#         'HOST': os.getenv('DB_HOST'),
#         'PORT': os.getenv('DB_PORT'),
#     }
# }

ALLOWED_HOSTS = ['staging.pointsystem.tech']
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'quizcloudstaging',
        'USER': 'quizstaging',
        'PASSWORD': 'myquizcloudstaging',
        'HOST': 'db-staging',
        'PORT': '3306',
    }
}

# Load specific environment settings based on the DJANGO_ENV environment variable
# DJANGO_ENV = os.getenv('DJANGO_ENV', 'production')

# if DJANGO_ENV == 'production':
#     # Production-specific settings
#     DEBUG = False
#     ALLOWED_HOSTS = ['pointsystem.tech', 'www.pointsystem.tech']

    # DATABASES['default'].update({
    #     'NAME': os.getenv('DB_PRODUCTION_NAME'),
    #     'HOST': os.getenv('DB_PRODUCTION_HOST'),
    #     'PORT': os.getenv('DB_PRODUCTION_PORT')
    # })

# elif DJANGO_ENV == 'staging':
#     # Staging-specific settings
#     DEBUG = True  # Optionally enable debug in staging
#     ALLOWED_HOSTS = ['staging.pointsystem.tech']

#     DATABASES['default'].update({
#         'NAME': os.getenv('DB_STAGING_NAME'),
#         # 'HOST': os.getenv('DB_STAGING_HOST'),
#         'PORT': os.getenv('DB_STAGING_PORT')
#     })

# Password validation
# https://docs.djangoproject.com/en/5.0/ref/settings/#auth-password-validators

AUTH_PASSWORD_VALIDATORS = [
    {
        'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator',
    },
]


# Internationalization
# https://docs.djangoproject.com/en/5.0/topics/i18n/

LANGUAGE_CODE = 'en-us'

# TIME_ZONE = 'UTC'
TIME_ZONE = 'Africa/Nairobi'

# USE_I18N = True

USE_TZ = True


# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/5.0/howto/static-files/
# settings/base.py
"""STATICFILES_DIRS = [
    os.path.join(BASE_DIR, 'quiz/static'),  # Adjust this path based on where your static files are
]"""

STATIC_URL = '/static/'
STATIC_ROOT = os.path.join(BASE_DIR, 'staticfiles')

CRISPY_ALLOWED_TEMPLATE_PACKS = "bootstrap5"

CRISPY_TEMPLATE_PACK = "bootstrap5"

LOGIN_REDIRECT_URL = '/'
LOGIN_URL = 'login'

AUTHENTICATION_BACKENDS = ['quiz.backends.EmailBackend']

# RECAPTCHA_PUBLIC_KEY = '6LddA3kgAAAAAPf1mAJmEc7Ku0cssbD5QMha09NT'
# RECAPTCHA_PRIVATE_KEY = '6LddA3kgAAAAAJY-2-Q0J3QX83DFJwFR1hXqmN8q'
# SILENCED_SYSTEM_CHECKS = ['captcha.recaptcha_test_key_error']

MEDIA_ROOT = os.path.join(BASE_DIR, 'media')
MEDIA_URL = '/media/'

# Default primary key field type
# https://docs.djangoproject.com/en/5.0/ref/settings/#default-auto-field

DEFAULT_AUTO_FIELD = 'django.db.models.BigAutoField'

# In your settings.py
'''AUTHENTICATION_BACKENDS = [
    'quiz.backends.EmailBackend',
    'django.contrib.auth.backends.ModelBackend',
]'''

# EMAIL_BACKEND = os.getenv('EMAIL_BACKEND')
# EMAIL_HOST = os.getenv('EMAIL_HOST')
# EMAIL_PORT = os.getenv('EMAIL_PORT')
# EMAIL_USE_TLS = os.getenv('EMAIL_USE_TLS') == 'True'  # Convert string to boolean
# EMAIL_HOST_USER = os.getenv('EMAIL_HOST_USER')
# EMAIL_HOST_PASSWORD = os.getenv('EMAIL_HOST_PASSWORD')

EMAIL_BACKEND = 'django.core.mail.backends.smtp.EmailBackend'
EMAIL_HOST = 'smtp.gmail.com'
EMAIL_PORT = 587
EMAIL_USE_TLS = True
EMAIL_HOST_USER = 'quizcloudapp@gmail.com'
EMAIL_HOST_PASSWORD = 'wpsosviuiocilcbq'

PASSWORD_RESET_TIMEOUT = 14400
SESSION_COOKIE_AGE = 60 * 60 * 8

# APPEND_SLASH = False
