'''from django.shortcuts import render
from rest_framework import viewsets
from rest_framework.response import Response
from quiz.models import Subject
from .serializers import SubjectSerializer


class SubjectView(viewsets.ViewSet):
    queryset = Subject.objects.all()

    def list(self, request):
        serializer = SubjectSerializer(self.queryset, many=True)
        return Response(serializer.data)'''
    

from rest_framework import viewsets, status
from rest_framework.decorators import action
from rest_framework.permissions import IsAuthenticated, AllowAny
from rest_framework.response import Response
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.models import User
from django.shortcuts import get_object_or_404, redirect
from django.contrib import messages
from quiz.models import (
    CustomUser,
    Subject,
    Quiz,
    Question,
    Option
)
from .serializers import (
    UserRegistrationSerializer, 
    UserLoginSerializer, 
    UserUpdateSerializer, 
    PasswordChangeSerializer, 
    PasswordResetSerializer,
    PasswordResetConfirmSerializer,
    UserSubjectsUpdateSerializer,
    SubjectSerializer,
    QuizSerializer,
    QuestionSerializer,
    OptionSerializer
)
from django.utils.http import urlsafe_base64_encode, urlsafe_base64_decode
from django.utils.encoding import force_bytes, force_str
from django.template.loader import render_to_string
from django.core.mail import EmailMessage
from django.contrib.sites.shortcuts import get_current_site
from .tokens import account_activation_token
from .permissions import IsTeacher, IsOwner
from .utils import validate_quiz_requirements


class UserViewSet(viewsets.ViewSet):
    """
    ViewSet for managing users (registration, login, profile, activation, password reset)
    """
    def list(self, request):
        """
        GET /users/
        List all users
        """
        queryset = CustomUser.objects.all()
        serializer = UserRegistrationSerializer(queryset, many=True)
        return Response(serializer.data)

    @action(detail=False, methods=['post'], permission_classes=[AllowAny])
    def register(self, request):
        """
        POST /users/register/
        User registration
        """
        serializer = UserRegistrationSerializer(data=request.data)
        if serializer.is_valid():
            user = serializer.save(is_active=False)  # Deactivate user until email confirmation
            self.send_activation_email(request, user, serializer.validated_data['email'])
            return Response({'message': 'Please confirm your email address to complete registration'}, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    @action(detail=False, methods=['post'], permission_classes=[AllowAny])
    def login(self, request):
        """
        POST /users/login/
        User login
        """
        serializer = UserLoginSerializer(data=request.data)
        if serializer.is_valid():
            user = authenticate(
                username=serializer.validated_data["username"],
                password=serializer.validated_data["password"],
            )
            if user is not None:
                login(request, user)
                return Response({'message': f"Hello {user.username}! You have been logged in"}, status=status.HTTP_200_OK)
            return Response({"error": "Invalid login credentials"}, status=status.HTTP_400_BAD_REQUEST)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    @action(detail=False, methods=['post'], permission_classes=[IsAuthenticated])
    def logout(self, request):
        """
        POST /users/logout/
        User logout
        """
        logout(request)
        return Response({'message': 'Logged out successfully!'}, status=status.HTTP_200_OK)

    @action(detail=False, methods=['get'], permission_classes=[IsAuthenticated])
    def profile(self, request):
        """
        GET /users/profile/
        View logged-in user's profile
        """
        serializer = UserUpdateSerializer(request.user)
        return Response(serializer.data)

    @action(detail=False, methods=['post'], permission_classes=[IsAuthenticated])
    def update_profile(self, request):
        """
        POST /users/profile/update/
        Update user's profile
        """
        serializer = UserUpdateSerializer(request.user, data=request.data, partial=True)
        if serializer.is_valid():
            serializer.save()
            return Response({'message': 'Your profile has been updated'}, status=status.HTTP_200_OK)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    @action(detail=False, methods=['post'], permission_classes=[AllowAny])
    def activate(self, request, uidb64, token):
        """
        POST /users/activate/<uidb64>/<token>/
        Activate user's account after email confirmation
        """
        try:
            uid = force_str(urlsafe_base64_decode(uidb64))
            user = CustomUser.objects.get(pk=uid)
        except User.DoesNotExist:
            return Response({'error': 'Activation link is invalid!'}, status=status.HTTP_400_BAD_REQUEST)

        if account_activation_token.check_token(user, token):
            user.is_active = True
            user.save()
            return Response({'message': 'Your account has been activated'}, status=status.HTTP_200_OK)
        else:
            return Response({'error': 'Activation link is invalid!'}, status=status.HTTP_400_BAD_REQUEST)

    @action(detail=False, methods=['post'], permission_classes=[AllowAny])
    def password_reset(self, request):
        """
        POST /users/password-reset/
        Send password reset email
        """
        serializer = PasswordResetSerializer(data=request.data)
        if serializer.is_valid():
            user = CustomUser.objects.filter(email=serializer.validated_data['email']).first()
            if user:
                self.send_password_reset_email(request, user)
            return Response({'message': 'Password reset email sent if the email is registered.'}, status=status.HTTP_200_OK)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    @action(detail=False, methods=['post'], permission_classes=[AllowAny])
    def password_reset_confirm(self, request, uidb64, token):
        """
        POST /users/password-reset-confirm/<uidb64>/<token>/
        Confirm and reset password
        """
        try:
            uid = force_str(urlsafe_base64_decode(uidb64))
            user = CustomUser.objects.get(pk=uid)
        except CustomUser.DoesNotExist:
            return Response({'error': 'Invalid reset link!'}, status=status.HTTP_400_BAD_REQUEST)

        if account_activation_token.check_token(user, token):
            serializer = PasswordResetConfirmSerializer(user, data=request.data)
            if serializer.is_valid():
                serializer.save()
                return Response({'message': 'Your password has been reset.'}, status=status.HTTP_200_OK)
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
        else:
            return Response({'error': 'Invalid reset link!'}, status=status.HTTP_400_BAD_REQUEST)

    @action(detail=False, methods=['post'], permission_classes=[IsAuthenticated])
    def password_change(self, request):
        """
        POST /users/password-change/
        Change user's password
        """
        # serializer = PasswordChangeSerializer(user=request.user, data=request.data)
        serializer = PasswordChangeSerializer(data=request.data, context={'request': request})
        if serializer.is_valid():
            serializer.save()
            return Response({'message': 'Your password has been changed successfully'}, status=status.HTTP_200_OK)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    def send_activation_email(self, request, user, to_email):
        """
        Helper function to send account activation email
        """
        mail_subject = "Activate your account"
        message = render_to_string('template_activate_account.html', {
            'user': user,
            'domain': get_current_site(request).domain,
            'uid': urlsafe_base64_encode(force_bytes(user.pk)),
            'token': account_activation_token.make_token(user),
            'protocol': 'https' if request.is_secure() else 'http'
        })
        email = EmailMessage(mail_subject, message, to=[to_email])
        email.send()

    def send_password_reset_email(self, request, user):
        """
        Helper function to send password reset email
        """
        mail_subject = "Password Reset Request"
        message = render_to_string('template_reset_password.html', {
            'user': user,
            'domain': get_current_site(request).domain,
            'uid': urlsafe_base64_encode(force_bytes(user.pk)),
            'token': account_activation_token.make_token(user),
            'protocol': 'https' if request.is_secure() else 'http'
        })
        email = EmailMessage(mail_subject, message, to=[user.email])
        email.send()


class UserSubjectsUpdateViewSet(viewsets.ModelViewSet):
    queryset = CustomUser.objects.all()
    serializer_class = UserSubjectsUpdateSerializer

    @action(detail=True, methods=['post'])
    def update_subjects(self, request, pk=None):
        user = self.get_object()
        subject_ids = request.data.get('subjects', [])
        user.subjects.set(subject_ids)  # Update many-to-many relationship
        user.save()
        return Response({"status": "subjects updated"})
    
class SubjectView(viewsets.ViewSet):
    queryset = Subject.objects.all()

    def list(self, request):
        serializer = SubjectSerializer(self.queryset, many=True)
        return Response(serializer.data)
    
class QuizViewSet(viewsets.ModelViewSet):
    queryset = Quiz.objects.all()
    serializer_class = QuizSerializer
    permission_classes = [IsTeacher]
    
    def perform_create(self, serializer):
        # Allow the teacher to create a quiz without immediate validation
        serializer.save(created_by=self.request.user)

    @action(detail=True, methods=['post'], permission_classes=[IsTeacher])
    def validate_before_test(self, request, pk=None):
        """
        Validate the quiz before the teacher attempts to test it.
        """
        quiz = self.get_object()
        is_valid, message = validate_quiz_requirements(quiz)
        if not is_valid:
            return Response({"detail": message}, status=status.HTTP_400_BAD_REQUEST)
        return Response({"detail": "Quiz is valid for testing."})

    @action(detail=True, methods=['post'], permission_classes=[IsTeacher])
    def validate_and_publish(self, request, pk=None):
        """
        Validate the quiz before publishing. If valid, toggle the published status.
        """
        quiz = self.get_object()
        is_valid, message = validate_quiz_requirements(quiz)
        if not is_valid:
            return Response({"detail": message}, status=status.HTTP_400_BAD_REQUEST)
        
        # Toggle published status
        quiz.published = not quiz.published
        quiz.save()

        message = "Quiz published successfully." if quiz.published else "Quiz unpublished successfully."
        return Response({"detail": message})

    @action(detail=True, methods=['get'], permission_classes=[IsOwner])
    def quiz_detail(self, request, pk=None):
        """
        Retrieve detailed information of the quiz.
        """
        quiz = self.get_object()
        serializer = self.get_serializer(quiz)
        return Response(serializer.data)

    @action(detail=True, methods=['post'], permission_classes=[IsOwner])
    def delete_quiz(self, request, pk=None):
        """
        Allow the teacher to delete the quiz.
        """
        quiz = self.get_object()
        quiz.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)
    
    @action(detail=True, methods=['post'], permission_classes=[IsOwner])
    def publish(self, request, pk=None):
        """
        Toggle the publish status of a quiz. This endpoint publishes or unpublishes a quiz
        after validating it. Only the owner of the quiz can perform this action.
        """
        quiz = self.get_object()

        # Validate quiz before allowing publication
        is_valid, message = validate_quiz_requirements(quiz)

        if not is_valid:
            return Response({"detail": message}, status=status.HTTP_400_BAD_REQUEST)

        # Toggle the published status
        quiz.published = not quiz.published
        quiz.save()

        message = (
            "Quiz published successfully." if quiz.published else
            "Quiz unpublished successfully."
        )
        return Response({"detail": message}, status=status.HTTP_200_OK)


class QuestionViewSet(viewsets.ModelViewSet):
    queryset = Question.objects.all()
    serializer_class = QuestionSerializer
    permission_classes = [IsOwner]

    @action(detail=True, methods=['get'], permission_classes=[IsOwner])
    def question_detail(self, request, pk=None):
        question = self.get_object()
        serializer = self.get_serializer(question)
        return Response(serializer.data)

    @action(detail=True, methods=['post'], permission_classes=[IsOwner])
    def delete_question(self, request, pk=None):
        question = self.get_object()
        question.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)

    @action(detail=True, methods=['post'], permission_classes=[IsOwner])
    def validate_options(self, request, pk=None):
        question = self.get_object()
        options = Option.objects.filter(question=question)
        correct_options = options.filter(is_correct=True)

        if options.count() < 2:
            return Response({"detail": "Each question must have at least two options."}, status=status.HTTP_400_BAD_REQUEST)
        if correct_options.count() < 1:
            return Response({"detail": "There must be at least one correct option."}, status=status.HTTP_400_BAD_REQUEST)

        return Response({"detail": "Question setup is complete."})

class OptionViewSet(viewsets.ModelViewSet):
    queryset = Option.objects.all()
    serializer_class = OptionSerializer
    permission_classes = [IsOwner]

    @action(detail=True, methods=['get'], permission_classes=[IsOwner])
    def option_detail(self, request, pk=None):
        option = self.get_object()
        serializer = self.get_serializer(option)
        return Response(serializer.data)

    @action(detail=True, methods=['post'], permission_classes=[IsOwner])
    def delete_option(self, request, pk=None):
        option = self.get_object()
        option.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)