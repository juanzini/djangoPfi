from django import template

from spypp.models import Puesto

register = template.Library()


@register.filter
def verbose_name(obj):
    return obj._meta.verbose_name


@register.filter
def verbose_name_plural(obj):
    return obj._meta.verbose_name_plural

@register.filter
def classname(obj):
    return obj.__class__.__name__

@register.filter
def is_postulated(obj, estudiantePk):
    return Puesto.is_postulated(obj, estudiantePk)