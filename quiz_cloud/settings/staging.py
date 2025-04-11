# settings/staging.py
from .base import *

DEBUG = False

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