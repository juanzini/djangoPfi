from . import models

from django import forms
from django.contrib import admin
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.forms import UserChangeForm
from django.contrib.auth.admin import UserAdmin
from bootstrap_datepicker_plus import DateTimePickerInput

class AlumnoForm(forms.ModelForm):

    class Meta():
        model = models.Alumno
        fields = (
            'numero_registro',
            'carrera',
            'curriculum',
            'plan_de_estudio',
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
            'plan_de_estudio',
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
        self.fields['plan_de_estudio'].widget.attrs['readonly'] = True
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
            'confirmada_alumno',
        )
    def __init__(self, *args, **kwargs):
        super(EntrevistaDetailSubcomisionCarreraForm, self).__init__(*args, **kwargs)
        self.fields['alumno'].widget.attrs['readonly'] = True
        self.fields['empresa'].widget.attrs['readonly'] = True
        self.fields['resultado'].widget.attrs['readonly'] = True
        self.fields['comentarios_empresa'].widget.attrs['readonly'] = True

TRUE_FALSE_CHOICES = (
    (True, 'Yes'),
    (False, 'No')
)

class EntrevistaDetailEmpresaForm(forms.ModelForm):
    class Meta():
        model = models.Entrevista
        fields = (
            'notificado_alumno',
            'confirmada_alumno',
            'fecha',
            'resultado',
            'comentarios_empresa',
            'comentarios_comision_pps',
        )

        widgets = {
            'notificado_alumno': forms.Select(choices=TRUE_FALSE_CHOICES),
            'confirmada_alumno': forms.Select(choices=TRUE_FALSE_CHOICES)
        }


    def __init__(self, *args, **kwargs):
        super(EntrevistaDetailEmpresaForm, self).__init__(*args, **kwargs)
        self.fields['fecha'].widget.attrs['readonly'] = True
        self.fields['comentarios_comision_pps'].widget.attrs['readonly'] = True
        self.fields['notificado_alumno'].widget.attrs['disabled'] = True
        self.fields['confirmada_alumno'].widget.attrs['disabled'] = True


class PasantiaDetailEmpresaForm(forms.ModelForm):
    class Meta():
        model = models.Pasantia
        fields = (
            'fecha_inicio',
            'fecha_fin',
            'comentarios_empresa',
            'tutor_empresa',
            'tutor_docente',
            'comentarios_comision_pps',
        )


    def __init__(self, *args, **kwargs):
        super(PasantiaDetailEmpresaForm, self).__init__(*args, **kwargs)
        self.fields['fecha_fin'].widget.attrs['readonly'] = True
        self.fields['fecha_inicio'].widget.attrs['readonly'] = True
        self.fields['tutor_empresa'].queryset = models.TutorEmpresa.objects.filter(empresa=self.instance.entrevista.empresa)
        self.fields['tutor_docente'].widget.attrs['disabled'] = True
        self.fields['comentarios_comision_pps'].widget.attrs['readonly'] = True


class PasantiaDetailSubcomisionCarreraForm(forms.ModelForm):
    class Meta():
        model = models.Pasantia
        fields = (
            'fecha_inicio',
            'fecha_fin',
            'tutor_docente',
            'tutor_empresa',
            'informe',
            'numero_legajo',
            'comentarios_empresa',
            'comentarios_comision_pps',
        )

    def __init__(self, *args, **kwargs):
        super(PasantiaDetailSubcomisionCarreraForm, self).__init__(*args, **kwargs)
        self.fields['fecha_inicio'].widget.attrs['readonly'] = True
        self.fields['fecha_fin'].widget.attrs['readonly'] = True
        self.fields['tutor_empresa'].widget.attrs['disabled'] = True
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
            'plan_de_estudio',
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
        fields = ('curriculum', 'plan_de_estudio', 'descripcion_intereses', 'descripcion_habilidades')

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
        fields = ('url', 'descripcion', 'logo')

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

class EntrevistaCreateForm(forms.ModelForm):

    class Meta():
        model = models.Entrevista
        fields = ['fecha']
        widgets = {
            'fecha': DateTimePickerInput(options={
                    "format": "DD/MM/YYYY HH:mm",
                    "locale": "es",
                }),
        }
        
class EntrevistaExistenteCreateForm(forms.ModelForm):
    class Meta():
        model = models.Entrevista
        fields = ['fecha']

    def __init__(self, *args, **kwargs):
        super(EntrevistaExistenteCreateForm, self).__init__(*args, **kwargs)
        self.fields['fecha'].widget.attrs['readonly'] = True


class SubcomisionPasantiasUserEditForm(forms.ModelForm):
    class Meta:
        model = models.User
        fields = ('username', 'email')
    def __init__(self, *args, **kwargs):
        super(SubcomisionPasantiasUserEditForm, self).__init__(*args, **kwargs)
        self.fields['email'].required = True
        self.fields['username'].required = True

class SubcomisionPasantiasEditForm(forms.ModelForm):
    class Meta:
        model = models.SubcomisionCarrera
        fields = ('docente',)

class AlumnoDetailComisionPasantiasForm(forms.ModelForm):

    class Meta():
        model = models.Alumno
        fields = (
            'numero_registro',
            'carrera',
            'curriculum',
            'plan_de_estudio',
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
        super(AlumnoDetailComisionPasantiasForm, self).__init__(*args, **kwargs)
        self.fields['condicion_acreditacion'].widget.attrs['disabled'] = True
        self.fields['expedicion_acreditacion'].widget.attrs['readonly'] = True
        self.fields['comentarios_comision_carrera'].widget.attrs['readonly'] = True

class EntrevistaDetailComisionPasantiasForm(forms.ModelForm):
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
            'confirmada_alumno',
            'cancelada_empresa',
            'cancelada_alumno'
        )
    def __init__(self, *args, **kwargs):
        super(EntrevistaDetailComisionPasantiasForm, self).__init__(*args, **kwargs)
        self.fields['alumno'].widget.attrs['readonly'] = True
        self.fields['empresa'].widget.attrs['readonly'] = True
        self.fields['resultado'].widget.attrs['readonly'] = True
        self.fields['comentarios_empresa'].widget.attrs['readonly'] = True

class PasantiaDetailComisionPasantiasForm(forms.ModelForm):
    class Meta():
        model = models.Pasantia
        fields = (
            'fecha_inicio',
            'fecha_fin',
            'tutor_docente',
            'tutor_empresa',
            'informe',
            'numero_legajo',
            'comentarios_empresa',
            'comentarios_comision_pps',
        )
        widgets = {
            'fecha_inicio': DateTimePickerInput(options={
                "format": "DD/MM/YYYY HH:mm",
                "locale": "es",
            }),
            'fecha_fin': DateTimePickerInput(options={
                "format": "DD/MM/YYYY HH:mm",
                "locale": "es",
            })
        }

    def __init__(self, *args, **kwargs):
        super(PasantiaDetailComisionPasantiasForm, self).__init__(*args, **kwargs)
        self.fields['tutor_empresa'].widget.attrs['disabled'] = True
        self.fields['comentarios_empresa'].widget.attrs['readonly'] = True


class PasantiaCreateForm(forms.ModelForm):
    class Meta():
        model = models.Pasantia
        fields = (
            'fecha_inicio',
            'fecha_fin',
            'entrevista',
            'tutor_empresa',
            'informe',
            'numero_legajo',
            'comentarios_comision_pps',
        )
        widgets = {
            'fecha_inicio': DateTimePickerInput(options={
                "format": "DD/MM/YYYY HH:mm",
                "locale": "es",
            }),
            'fecha_fin': DateTimePickerInput(options={
                "format": "DD/MM/YYYY HH:mm",
                "locale": "es",
            })
        }

        def __init__(self, *args, **kwargs):
            super(PasantiaCreateForm, self).__init__(*args, **kwargs)
            self.fields['tutor_empresa'].queryset = models.TutorEmpresa.objects.filter(
                empresa=self.instance.entrevista.empresa)