from django import forms
from django.contrib.auth.forms import UserCreationForm, AuthenticationForm, SetPasswordForm, PasswordResetForm
from django.contrib.auth import get_user_model
from .models import Subject, Quiz, Question, Option
#from captcha.fields import ReCaptchaField
#from captcha.widgets import ReCaptchaV2Checkbox
# forms.py
#from django import forms
from django.forms import inlineformset_factory

class QuizForm(forms.ModelForm):
    class Meta:
        model = Quiz
        fields = ['title', 'description', 'time_limit', 'subject', 'max_attempts', 'pass_mark']

        widgets = {
            'title': forms.TextInput(attrs={'class': 'form-control'}),
            'description': forms.TextInput(attrs={'class': 'form-control'}),
            'time_limit': forms.NumberInput(attrs={'marks': 'form-control'}),
            'subject': forms.Select(attrs={'class': 'form-control'}),
            'max_attempts': forms.NumberInput(attrs={'marks': 'form-control'}),
            'pass_mark': forms.NumberInput(attrs={'marks': 'form-control'})
        }

'''class QuizForms(forms.Form):
    def __init__(self, *args, **kwargs):
        questions = kwargs.pop('questions')
        super(QuizForms, self).__init__(*args, **kwargs)
        
        for i, question in enumerate(questions, 1):
            field_name = f'question_{question.id}'
            choices = [(o.id, o.text) for o in question.options.all()]
            self.fields[field_name] = forms.ChoiceField(
                label=f"{i}. {question.text} ({question.marks} marks)",
                choices=choices,
                widget=forms.RadioSelect
            )'''

class QuizForms(forms.Form):
    def __init__(self, *args, **kwargs):
        questions = kwargs.pop('questions')
        super(QuizForms, self).__init__(*args, **kwargs)

        #for question in questions:
        for i, question in enumerate(questions, 1):
            #field_name = f"question_{question.pk}"
            field_name = f"question_{question.id}"
            #choices = [(option.pk, option.text) for option in question.options.all()]
            choices = [(option.id, option.text) for option in question.options.all()]
            if question.has_multiple_correct_answers():
                self.fields[field_name] = forms.MultipleChoiceField(
                    #label=f"{question.text} ({question.marks} marks)",
                    label=f"{i}. {question.text} ({question.marks} marks)",
                    choices=choices,
                    widget=forms.CheckboxSelectMultiple,
                    required=False
                )
            else:
                self.fields[field_name] = forms.ChoiceField(
                    #label=f"{question.text} ({question.marks} marks)",
                    label=f"{i}. {question.text} ({question.marks} marks)",
                    choices=choices,
                    widget=forms.RadioSelect,
                    required=True
                )

class QuestionForm(forms.ModelForm):
    class Meta:
        model = Question
        fields = ['text', 'marks']

        widgets = {
            'text': forms.TextInput(attrs={'class': 'form-control'}),
            'marks': forms.NumberInput(attrs={'marks': 'form-control'})
        }

class OptionForm(forms.ModelForm):
    class Meta:
        model = Option
        fields = ['text', 'is_correct']

        widgets = {
            'text': forms.TextInput(attrs={'class': 'form-control'}),
            'is_correct': forms.CheckboxInput(attrs={'class': 'form-check-input'})
        }


class UserRegistrationForm(UserCreationForm):
    email = forms.EmailField(help_text='A valid email address, please.', required=True)

    class Meta:
        model = get_user_model()
        fields = ['status', 'first_name', 'last_name', 'username', 'email', 'school', 'password1', 'password2']

    def save(self, commit=True):
        user = super(UserRegistrationForm, self).save(commit=False)
        user.email = self.cleaned_data['email']
        if commit:
            user.save()

        return user

class UserLoginForm(AuthenticationForm):
    def __init__(self, *args, **kwargs):
        super(UserLoginForm, self).__init__(*args, **kwargs)

    username = forms.CharField(widget=forms.TextInput(
        attrs={'class': 'form-control', 'placeholder': 'Username or Email'}),
        label="Username or Email*")

    password = forms.CharField(widget=forms.PasswordInput(
        attrs={'class': 'form-control', 'placeholder': 'Password'}))

    #captcha = ReCaptchaField(widget=ReCaptchaV2Checkbox())

class UserUpdateForm(forms.ModelForm):
    email = forms.EmailField()
    subjects = forms.ModelMultipleChoiceField(
        queryset=Subject.objects.all(),
        widget=forms.CheckboxSelectMultiple,
        required=False
    )

    class Meta:
        model = get_user_model()
        fields = ['first_name', 'last_name', 'email', 'image', 'subjects', 'school']

class SetPasswordForm(SetPasswordForm):
    class Meta:
        model = get_user_model()
        fields = ['new_password1', 'new_password2']

class PasswordResetForm(PasswordResetForm):
    def __init__(self, *args, **kwargs):
        super(PasswordResetForm, self).__init__(*args, **kwargs)

    # captcha = ReCaptchaField(widget=ReCaptchaV2Checkbox())