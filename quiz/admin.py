from django.contrib import admin
from .models import CustomUser, Subject

# Register your models here.
admin.site.register(CustomUser)
admin.site.register(Subject)