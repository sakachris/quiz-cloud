# settings/production.py
from .base import *

DEBUG = False
# ALLOWED_HOSTS = ['pointsystem.tech', 'www.pointsystem.tech']
# ALLOWED_HOSTS = ['quizcloud.co.ke', 'www.quizcloud.co.ke']

# DATABASES = {
#     'default': {
#         'ENGINE': 'django.db.backends.mysql',
#         'NAME': os.getenv('DB_NAME_PRODUCTION'),
#         'USER': os.getenv('DB_USER_PRODUCTION'),
#         'PASSWORD': os.getenv('DB_PASSWORD_PRODUCTION'),
#         'HOST': os.getenv('DB_HOST_PRODUCTION'),
#         'PORT': os.getenv('DB_PORT'),
#     }
# }

# from .base import *

# DEBUG = False

# Load ALLOWED_HOSTS from environment variables
ALLOWED_HOSTS = os.getenv("ALLOWED_HOSTS", "").split(",")

# Security settings
SECURE_SSL_REDIRECT = True
SECURE_PROXY_SSL_HEADER = ("HTTP_X_FORWARDED_PROTO", "https")

# Session & CSRF cookies
SESSION_COOKIE_DOMAIN = os.getenv("SESSION_COOKIE_DOMAIN")
CSRF_COOKIE_DOMAIN = os.getenv("CSRF_COOKIE_DOMAIN")
SESSION_COOKIE_SECURE = True
SESSION_COOKIE_HTTPONLY = True
SESSION_SAVE_EVERY_REQUEST = True
SESSION_EXPIRE_AT_BROWSER_CLOSE = False
SESSION_COOKIE_NAME = "sessionid"  # Ensure unique session cookie name