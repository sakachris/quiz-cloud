from django import template
register = template.Library()

@register.filter
def count_correct_selected_options(answer):
    """Returns the count of correctly selected options for an answer."""
    return answer.selected_options.filter(is_correct=True).count()