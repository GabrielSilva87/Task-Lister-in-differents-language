#!/bin/bash

sudo apt update
sudo apt install -y python3-pip
pip3 install django
django-admin startproject todolist
cd todolist
python3 manage.py startapp tasks

cat <<EOL > tasks/models.py
from django.db import models

class Task(models.Model):
    title = models.CharField(max_length=200)
    completed = models.BooleanField(default=False)

    def __str__(self):
        return self.title
EOL

cat <<EOL > tasks/admin.py
from django.contrib import admin
from .models import Task

admin.site.register(Task)
EOL

echo "INSTALLED_APPS = [" >> todolist/settings.py
echo "    'django.contrib.admin'," >> todolist/settings.py
echo "    'django.contrib.auth'," >> todolist/settings.py
echo "    'django.contrib.contenttypes'," >> todolist/settings.py
echo "    'django.contrib.sessions'," >> todolist/settings.py
echo "    'django.contrib.messages'," >> todolist/settings.py
echo "    'django.contrib.staticfiles'," >> todolist/settings.py
echo "    'tasks'," >> todolist/settings.py
echo "]" >> todolist/settings.py

python3 manage.py makemigrations
python3 manage.py migrate

cat <<EOL > tasks/views.py
from django.shortcuts import render
from .models import Task

def task_list(request):
    tasks = Task.objects.all()
    return render(request, 'tasks/task_list.html', {'tasks': tasks})
EOL

mkdir -p tasks/templates/tasks
cat <<EOL > tasks/templates/tasks/task_list.html
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lista de Tarefas</title>
</head>
<body>
    <h1>Lista de Tarefas</h1>
    <ul>
        {% for task in tasks %}
            <li>
                {{ task.title }} - {% if task.completed %} Concluída {% else %} Pendente {% endif %}
            </li>
        {% endfor %}
    </ul>
</body>
</html>
EOL

cat <<EOL > tasks/urls.py
from django.urls import path
from .views import task_list

urlpatterns = [
    path('', task_list, name='task_list'),
]
EOL

echo "from django.contrib import admin" >> todolist/urls.py
echo "from django.urls import path, include" >> todolist/urls.py
echo "" >> todolist/urls.py
echo "urlpatterns = [" >> todolist/urls.py
echo "    path('admin/', admin.site.urls)," >> todolist/urls.py
echo "    path('', include('tasks.urls'))," >> todolist/urls.py
echo "]" >> todolist/urls.py

python3 manage.py runserver