# QuizCloud: Interactive Learning Platform 📚✨

Welcome to QuizCloud - the ultimate destination for students and teachers aiming to enhance the learning and teaching experience through interactive quizzes. Whether you're a student looking to master new subjects, or a teacher striving to gauge student knowledge efficiently, QuizCloud is your go-to platform.

## Introduction
QuizCloud is a web-based platform designed to revolutionize the way students learn and teachers assess. QuizCloud allows students to take quizzes tailored to their curriculum and enables teachers to create and manage quizzes easily.

## Features
- Quizzes for a variety of subjects
- Dashboard for teachers to create, publish, and view quizzes attempted
- Student profiles with subject selections
- Adaptive quiz attempts based on performance
- Timed quizzes
- Save quiz for later

## Getting Started

### Prerequisites
- Python 3.x
- Django
- MySQL
- Git

**Deployed Site:** [QuizCloud](https://qc.sakachris.com/)

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
If encountering errors install
```bash
sudo apt update
sudo apt install python3-dev default-libmysqlclient-dev build-essential
```

4. Configure your database in settings.py.
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

![View available Quizzes](https://github.com/sakachris/quiz-cloud/assets/125475525/9c2c6c8a-481c-4dfd-aebf-69afa244b6da)

![Take later Quizzes](https://github.com/sakachris/quiz-cloud/assets/125475525/457430e7-027c-4f65-9309-e8815ee5177e)

![Taken Quizzes](https://github.com/sakachris/quiz-cloud/assets/125475525/402606bc-d7fa-4ad7-80c8-bba5758b72e0)

![Quiz Attempt](https://github.com/sakachris/quiz-cloud/assets/125475525/ffa365b6-e0b8-469e-8a43-b78709b17a6c)

![Taking Quiz](https://github.com/sakachris/quiz-cloud/assets/125475525/d22ccdbd-9900-42ac-b5d0-bd5a832c0da3)

![Attempted Quizzes](https://github.com/sakachris/quiz-cloud/assets/125475525/1dcfe25d-639d-4792-9542-cf22f6b3510e)

![Quizzes](https://github.com/sakachris/quiz-cloud/assets/125475525/23d7d4ce-a0c7-477b-98e3-2c830243842b)

## Contributing 👐

We welcome contributions from everyone! Here's how you can help:

1. Fork the repository and create your feature branch (`git checkout -b feature/AmazingFeature`).
2. Commit your changes (`git commit -m 'Add some AmazingFeature'`).
3. Push to the branch (`git push origin feature/AmazingFeature`).
4. Open a Pull Request.

Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details 📜 on our code of conduct and the process for submitting pull requests.


## License 📄

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.

**Authors LinkedIn:**
- [Linkedin](https://www.linkedin.com/in/chris-saka/)

## Acknowledgments 👏

- ALX for the opportunity to learn and resources.
- Motivation, inspiration and support from ALX peer learners.
- Django for the robust backend framework.
- Bootstrap for the responsive and modern UI components.
- HTMX for enhancing the interactivity of the web app with minimal JavaScript.
