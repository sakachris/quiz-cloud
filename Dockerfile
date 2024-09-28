# Dockerfile

# Use official Python image from the Docker Hub
FROM python:3.10-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file to the working directory
COPY requirements.txt /app/

# Install system dependencies
RUN apt-get update && apt-get install -y \
    pkg-config \
    libmariadb-dev-compat \
    libmariadb-dev \
    gcc \
    build-essential \
    python3-dev

# Install the dependencies
RUN pip install --upgrade pip && pip install -r requirements.txt

# Copy the Django project into the container
COPY . /app/

# Collect static files
RUN python manage.py collectstatic --noinput

# Expose the port that the Gunicorn server will run on
EXPOSE 8000

# Start Gunicorn
CMD ["gunicorn", "--workers=3", "--bind", "0.0.0.0:8000", "quiz_cloud.wsgi:application"]
