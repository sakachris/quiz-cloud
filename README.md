# QuizCloud: Interactive Learning Platform 📚✨

Welcome to QuizCloud - the ultimate destination for students and teachers aiming to enhance the learning and teaching experience through interactive quizzes. Whether you're a student looking to master new subjects, or a teacher striving to gauge student knowledge efficiently, QuizCloud is your go-to platform.

## Introduction
QuizCloud is a web-based platform designed to revolutionize the way students learn and teachers assess. QuizCloud allows students to take quizzes tailored to their curriculum and enables teachers to create and manage quizzes easily.

## Features
- Quizzes for a variety of subjects
- Dashboard for teachers to create, publish, and view quizzes attempted
- Student profiles with subject selections
- Adaptive quiz attempts based on performance

## Getting Started

### Prerequisites
- Python 3.x
- Django
- MySQL
- Git

### Installation Steps
1. Clone the repository
```bash
git clone https://github.com/sakachris/quiz-cloud 
cd quiz-cloud
```

2. Set up a virtual environment
```bash
python -m venv venv
source venv/bin/activate
```

3. Install dependencies
```bash
pip install -r requirements.txt
```

4. Configure your database in settings.py
Update the DATABASES configuration in quiz_cloud/settings.py with your MySQL credentials.

5. Run migrations
```bash
python manage.py migrate
```

6. Visit http://127.0.0.1:8000 in your browser to see QuizCloud in action!


## Usage Guide 💻

- **Students**: Sign up, select your subjects, and start taking quizzes! Save quizzes for later or retry them to improve your scores.
- **Teachers**: Create quizzes, publish them for students, and view attempts.

## Screenshots

## Contributing 👐

We welcome contributions from everyone! Here's how you can help:

1. Fork the repository and create your feature branch (`git checkout -b feature/AmazingFeature`).
2. Commit your changes (`git commit -m 'Add some AmazingFeature'`).
3. Push to the branch (`git push origin feature/AmazingFeature`).
4. Open a Pull Request.

Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details 📜 on our code of conduct and the process for submitting pull requests.


## License 📄

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.

## Acknowledgments 👏

- ALX for the opportunity to learn and resources.
- Motivation, inspiration and support from ALX peer learners.
- Django for the robust backend framework.
- Bootstrap for the responsive and modern UI components.
- HTMX for enhancing the interactivity of the web app with minimal JavaScript.
