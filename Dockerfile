# Dockerfile

FROM python:3.10-slim

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Setting the working directory in the container
WORKDIR /app

# Copying the requirements file to the working directory
COPY requirements.txt /app/

# Installing system dependencies
RUN apt-get update && apt-get install -y \
    pkg-config \
    libmariadb-dev-compat \
    libmariadb-dev \
    gcc \
    build-essential \
    python3-dev

# Installing the dependencies
RUN pip install --upgrade pip && pip install -r requirements.txt

# Copying the Django project into the container
COPY . /app/

# Collecting static files
RUN python manage.py collectstatic --noinput

# The port that Gunicorn server will run on
EXPOSE 8000

# Starting Gunicorn
CMD ["gunicorn", "--workers=3", "--bind", "0.0.0.0:8000", "--timeout=120", "quiz_cloud.wsgi:application"]
