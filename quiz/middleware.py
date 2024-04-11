# middleware.py

from django.contrib.auth import logout
from django.conf import settings
from django.utils import timezone
import json
from datetime import datetime

class SessionTimeoutMiddleware:
    def __init__(self, get_response):
        self.get_response = get_response

    def __call__(self, request):
        if request.user.is_authenticated and settings.SESSION_COOKIE_AGE:
            last_activity_str = request.session.get('last_activity')
            if last_activity_str:
                # Converting last_activity string back to datetime object
                last_activity = datetime.fromisoformat(last_activity_str)
                elapsed_time = timezone.now() - last_activity
                if elapsed_time.total_seconds() > settings.SESSION_COOKIE_AGE:
                    logout(request)

            # Updating last_activity to current time in ISO 8601 format
            request.session['last_activity'] = timezone.now().isoformat()

        response = self.get_response(request)
        return response