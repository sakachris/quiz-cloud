def validate_quiz_requirements(quiz):
    min_options = 2
    if quiz.questions.count() == 0:
        return False, "The quiz must contain at least one question."

    for question in quiz.questions.all():
        options_count = question.options.count()
        correct_options = question.options.filter(is_correct=True).exists()
        question_text = question.text

        if options_count < min_options:
            return False, (f"The question '{question_text}' must have at least two options.")
        if not correct_options:
            return False, (f"The question '{question_text}' must have at least one correct answer.")

    return True, ""
