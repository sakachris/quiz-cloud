import os

ENVIRONMENT = os.getenv("DJANGO_ENV", "development")

if ENVIRONMENT == "production":
    from .production import *

elif ENVIRONMENT == "staging":
    from .staging import *

elif ENVIRONMENT == "development":
    from .development import *