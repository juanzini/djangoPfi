from django import forms
from . import models
from django.contrib import admin
from django.contrib.auth.admin import UserAdmin
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.forms import UserChangeForm

class MyUserCreateForm(UserCreationForm):
    class Meta(UserCreationForm.Meta):
        model = models.User
    def __init__(self, *args, **kwargs):
        super(MyUserCreateForm, self).__init__(*args, **kwargs)
        self.fields['email'].required = True
        self.fields['first_name'].required = True
        self.fields['last_name'].required = True

class MyUserChangeForm(UserChangeForm):
    class Meta(UserChangeForm.Meta):
        model = models.User
    def __init__(self, *args, **kwargs):
        super(MyUserChangeForm, self).__init__(*args, **kwargs)
        self.fields['email'].required = True
        self.fields['first_name'].required = True
        self.fields['last_name'].required = True

class MyUserCreateAdmin(UserAdmin):
    add_form = MyUserCreateForm
    form = MyUserChangeForm
    prepopulated_fields = {'username': ('first_name', 'last_name', )}

    list_display = ['username', 'first_name', 'last_name', 'email', ]

    add_fieldsets = (
        (None, {
            'classes': ('wide',),
            'fields': (
                'first_name',
                'last_name',
                'username',
                'email',
                'password1',
                'password2',
                'tipo',
                'is_active'
            ),
        }),
    )

    fieldsets = (
        (None, {
            'classes': ('wide',),
            'fields': (
                'first_name',
                'last_name',
                'username',
                'email',
                'password',
                'tipo',
                'is_active'
            ),
        }),
    )


class AlumnoForm(forms.ModelForm):

    class Meta():
        model = models.Alumno
        fields = (
            'numero_registro',
            'carrera',
            'perfil',
            'telefono',
            'curriculum',
            'historia_academica',
            'descripcion_intereses',
            'descripcion_habilidades',
            'consideraciones_particulares',
            'condicion_acreditacion',
            'expedicion_acreditacion',
            'comentarios_comision_carrera',
            'comentarios_carrera_visibles',
            'comentarios_comision_pps',
            'ultima_actualizacion_perfil',
            'is_test',
            'user',
        )

class AlumnoFormAdmin(admin.ModelAdmin):
    form = AlumnoForm