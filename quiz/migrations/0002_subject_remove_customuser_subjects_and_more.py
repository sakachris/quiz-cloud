# Generated by Django 5.0.3 on 2024-03-10 17:10

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('quiz', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Subject',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=255)),
            ],
        ),
        migrations.RemoveField(
            model_name='customuser',
            name='subjects',
        ),
        migrations.AddField(
            model_name='customuser',
            name='subjects',
            field=models.ManyToManyField(blank=True, to='quiz.subject'),
        ),
    ]
