from django.shortcuts import render
from rest_framework import viewsets
from rest_framework.response import Response
from quiz.models import Subject
from .serializers import SubjectSerializer


class SubjectView(viewsets.ViewSet):
    queryset = Subject.objects.all()

    def list(self, request):
        serializer = SubjectSerializer(self.queryset, many=True)
        return Response(serializer.data)
