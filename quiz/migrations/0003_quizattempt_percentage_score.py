# Generated by Django 5.0.3 on 2024-03-23 07:20

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('quiz', '0002_quiz_pass_mark_quizattempt_passed'),
    ]

    operations = [
        migrations.AddField(
            model_name='quizattempt',
            name='percentage_score',
            field=models.PositiveIntegerField(default=0),
        ),
    ]
