from django import template

register = template.Library()

@register.filter(name='make_letter')
def make_letter(dummy, index):
    # Convert option index (1-based) to a letter (a, b, c, ...)
    # Subtract 1 to convert index to 0-based for letter calculation
    return chr(96 + index).lower()
