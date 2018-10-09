from django import forms
from alumno.models import Alumno

class AlumnoForm(forms.ModelForm):
    class Meta:
        # Provide an association between the ModelForm and a model
        model = Alumno
        exclude = ('ultima_actualizacion_perfil', 'ultima_postulacion', 'ultimo_ingreso', 'primer_ingreso')