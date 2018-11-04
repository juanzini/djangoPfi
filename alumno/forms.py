from . import models

from django import forms
from django.contrib import admin

from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.forms import UserChangeForm

from django.contrib.auth.admin import UserAdmin

class AlumnoForm(forms.ModelForm):

    class Meta():
        model = models.Alumno
        fields = (
            'numero_registro',
            'carrera',
            'curriculum',
            'descripcion_intereses',
            'descripcion_habilidades',
            'prioridad',
            'condicion_acreditacion',
            'expedicion_acreditacion',
            'comentarios_comision_carrera',
            'comentarios_carrera_visibles',
            'comentarios_comision_pps',
            'user',
        )
        def nombre(self):
            return self.user.first_name
        def apellido(self):
            return self.user.last_name
        def username(self):
            return self.user.username
        def email(self):
            return self.user.email

class AlumnoFormAdmin(admin.ModelAdmin):
    form = AlumnoForm
    list_display = [form.Meta.nombre, form.Meta.apellido, form.Meta.username, form.Meta.email]

class AlumnoCreateForm(forms.ModelForm):
    class Meta:
        model = models.Alumno
        fields = (
            'numero_registro',
            'carrera',
            'curriculum',
            'descripcion_intereses',
            'descripcion_habilidades',
            'prioridad',
        )

class PuestoListAdmin(admin.ModelAdmin):
    list_display = ['nombre', 'empresa' ]

class UserCreateForm(UserCreationForm):
    class Meta:
        model = models.User
        fields = (
            'first_name',
            'last_name',
            'email',
            'password1',
            'password2',
        )
    def __init__(self, *args, **kwargs):
        super(UserAdmin.add_form, self).__init__(*args, **kwargs)
        self.fields['email'].required = True
        self.fields['first_name'].required = True
        self.fields['last_name'].required = True

class AlumnoUserEditForm(forms.ModelForm):
    class Meta:
        model = models.User
        fields = ('first_name', 'last_name', 'email')

class AlumnoEditForm(forms.ModelForm):
    class Meta:
        model = models.Alumno
        fields = ('curriculum', 'descripcion_intereses', 'descripcion_habilidades', 'prioridad')

class MyUserChangeForm(UserChangeForm):
    class Meta(UserChangeForm.Meta):
        model = models.User
    def __init__(self, *args, **kwargs):
        super(MyUserChangeForm, self).__init__(*args, **kwargs)
        self.fields['email'].required = True
        self.fields['first_name'].required = True
        self.fields['last_name'].required = True

class MyUserCreateForm(UserCreationForm):
    class Meta(UserCreationForm.Meta):
        model = models.User
    def __init__(self, *args, **kwargs):
        super(MyUserCreateForm, self).__init__(*args, **kwargs)
        self.fields['email'].required = True
        self.fields['first_name'].required = True
        self.fields['last_name'].required = True

class MyUserCreateAdmin(UserAdmin):
    add_form = MyUserCreateForm
    form = MyUserChangeForm

    list_display = ['first_name', 'last_name', 'email', ]

    add_fieldsets = (
        (None, {
            'classes': ('wide',),
            'fields': (
                'first_name',
                'last_name',
                'email',
                'password1',
                'password2',
                'tipo',
            ),
        }),
    )

    fieldsets = (
        (None, {
            'classes': ('wide',),
            'fields': (
                'first_name',
                'last_name',
                'email',
                'password',
                'tipo',
            ),
        }),
    )
