from . import models

from django import forms
from django.contrib import admin
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.forms import UserChangeForm
from django.contrib.auth.admin import UserAdmin
from django.contrib.admin.widgets import FilteredSelectMultiple

class AlumnoForm(forms.ModelForm):

    class Meta():
        model = models.Alumno
        fields = (
            'numero_registro',
            'carrera',
            'curriculum',
            'descripcion_intereses',
            'descripcion_habilidades',
            'condicion_acreditacion',
            'expedicion_acreditacion',
            'comentarios_comision_carrera',
            'comentarios_carrera_visibles',
            'comentarios_comision_pps',
            'ultima_actualizacion_perfil',
            'user',
        )

class AlumnoDetailSubcomisionCarreraForm(forms.ModelForm):

    class Meta():
        model = models.Alumno
        fields = (
            'numero_registro',
            'carrera',
            'curriculum',
            'descripcion_intereses',
            'descripcion_habilidades',
            'ultima_actualizacion_perfil',
            'ultima_postulacion',
            'condicion_acreditacion',
            'expedicion_acreditacion',
            'comentarios_comision_carrera',
            'comentarios_carrera_visibles',
            'comentarios_comision_pps',
        )
    def __init__(self, *args, **kwargs):
        super(AlumnoDetailSubcomisionCarreraForm, self).__init__(*args, **kwargs)
        self.fields['curriculum'].widget.attrs['readonly'] = True
        self.fields['descripcion_intereses'].widget.attrs['readonly'] = True
        self.fields['descripcion_habilidades'].widget.attrs['readonly'] = True
        self.fields['ultima_actualizacion_perfil'].widget.attrs['readonly'] = True
        self.fields['ultima_postulacion'].widget.attrs['readonly'] = True
        self.fields['comentarios_comision_pps'].widget.attrs['readonly'] = True

class EntrevistaDetailSubcomisionCarreraForm(forms.ModelForm):
    class Meta():
        model = models.Entrevista
        fields = (
            'alumno',
            'empresa',
            'fecha',
            'resultado',
            'comentarios_empresa',
            'comentarios_comision_pps',
            'notificado_alumno',
            'notificado_empresa',
            'confirmada_alumno',
        )
    def __init__(self, *args, **kwargs):
        super(EntrevistaDetailSubcomisionCarreraForm, self).__init__(*args, **kwargs)
        self.fields['alumno'].widget.attrs['readonly'] = True
        self.fields['empresa'].widget.attrs['readonly'] = True
        self.fields['comentarios_empresa'].widget.attrs['readonly'] = True

class PasantiaDetailSubcomisionCarreraForm(forms.ModelForm):
    class Meta():
        model = models.Pasantia
        fields = (
            'fecha_inicio',
            'fecha_fin',
            'tutor_docente',
            'tutor_empresa',
            'entrevista',
            'informe',
            'numero_legajo',
            'comentarios_empresa',
            'comentarios_comision_pps',
        )

    def __init__(self, *args, **kwargs):
        super(PasantiaDetailSubcomisionCarreraForm, self).__init__(*args, **kwargs)
        self.fields['fecha_inicio'].widget.attrs['readonly'] = True
        self.fields['fecha_fin'].widget.attrs['readonly'] = True
        self.fields['tutor_empresa'].widget.attrs['readonly'] = True
        self.fields['entrevista'].widget.attrs['readonly'] = True
        self.fields['informe'].widget.attrs['readonly'] = True
        self.fields['numero_legajo'].widget.attrs['readonly'] = True
        self.fields['comentarios_empresa'].widget.attrs['readonly'] = True
        self.fields['comentarios_comision_pps'].widget.attrs['readonly'] = True

class AlumnoFormAdmin(admin.ModelAdmin):
    form = AlumnoForm

class AlumnoCreateForm(forms.ModelForm):
    class Meta:
        model = models.Alumno
        fields = (
            'numero_registro',
            'carrera',
            'curriculum',
            'descripcion_intereses',
            'descripcion_habilidades',
        )

class UserCreateForm(UserCreationForm):
    class Meta:
        model = models.User
        fields = (
            'first_name',
            'last_name',
            'username',
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
        fields = ('curriculum', 'descripcion_intereses', 'descripcion_habilidades')

class EmpresaUserEditForm(forms.ModelForm):
    class Meta:
        model = models.User
        fields = ('username', 'email')
    def __init__(self, *args, **kwargs):
        super(EmpresaUserEditForm, self).__init__(*args, **kwargs)
        self.fields['email'].required = True
        self.fields['username'].required = True

class EmpresaEditForm(forms.ModelForm):
    class Meta:
        model = models.Empresa
        fields = ('descripcion',)

class SubcomisionCarreraUserEditForm(forms.ModelForm):
    class Meta:
        model = models.User
        fields = ('username', 'email')
    def __init__(self, *args, **kwargs):
        super(SubcomisionCarreraUserEditForm, self).__init__(*args, **kwargs)
        self.fields['email'].required = True
        self.fields['username'].required = True

class SubcomisionCarreraEditForm(forms.ModelForm):
    class Meta:
        model = models.SubcomisionCarrera
        fields = ('docente',)

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
            ),
        }),
    )
