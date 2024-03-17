from django.contrib import admin
from .models import CustomUser, Subject, Quiz, Question, Option

# Register your models here.
admin.site.register(CustomUser)
admin.site.register(Subject)
#admin.site.register(Quiz)
#admin.site.register(Question)
#admin.site.register(Option)

class QuestionInLineAdmin(admin.TabularInline):
    model = Question

class OptionInLineAdmin(admin.TabularInline):
    model = Option


class QuizAdmin(admin.ModelAdmin):
    inlines = [QuestionInLineAdmin]

class QuestionAdmin(admin.ModelAdmin):
    inlines = [OptionInLineAdmin]


admin.site.register(Quiz, QuizAdmin)
admin.site.register(Question, QuestionAdmin)