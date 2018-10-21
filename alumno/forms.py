from .models import Alumno
from django import forms
from django.contrib import admin

class AlumnoForm(forms.ModelForm):

    class Meta():
        model = Alumno
        fields = ('numero_registro', )

class AlumnoFormAdmin(admin.ModelAdmin):
    form = AlumnoForm