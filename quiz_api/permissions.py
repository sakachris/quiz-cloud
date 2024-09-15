from rest_framework.permissions import BasePermission

class IsTeacher(BasePermission):
    def has_permission(self, request, view):
        return request.user.is_authenticated and request.user.status == 'teacher'

#class IsOwner(BasePermission):
#    def has_object_permission(self, request, view, obj):
#        return obj.created_by == request.user

class IsOwner(BasePermission):
    def has_object_permission(self, request, view, obj):
        # Check if the user is the creator of the quiz associated with the question
        if hasattr(obj, 'quiz'):
            # For Question or Option, check if the quiz was created by the user
            return obj.quiz.created_by == request.user
        # Otherwise, fallback to checking if the object has 'created_by' directly (e.g., for Quiz)
        return hasattr(obj, 'created_by') and obj.created_by == request.user

