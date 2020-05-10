from django_registration.forms import RegistrationForm

from . import models
# from material import *
from datetime import timedelta as td
from datetime import datetime
from django import forms
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.forms import UserChangeForm
from django.contrib.admin.widgets import FilteredSelectMultiple

class AlumnoForm(forms.ModelForm):

    class Meta():
        model = models.Alumno
        fields = (
            'numero_registro',
            'carrera',
            'perfil',
            'telefono',
            'curriculum',
            'plan_de_estudio',
            'historia_academica',
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
            'telefono',
            'progreso',
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
        widgets = {
            'carrera': forms.TextInput,
        }
    def __init__(self, *args, **kwargs):
        super(AlumnoDetailSubcomisionCarreraForm, self).__init__(*args, **kwargs)
        self.fields['carrera'].disabled = True
        self.fields['descripcion_intereses'].widget.attrs['readonly'] = True
        self.fields['telefono'].widget.attrs['readonly'] = True
        self.fields['descripcion_habilidades'].widget.attrs['readonly'] = True
        self.fields['ultima_actualizacion_perfil'].widget.attrs['readonly'] = True
        self.fields['ultima_postulacion'].widget.attrs['readonly'] = True
        self.fields['comentarios_comision_pps'].widget.attrs['readonly'] = True

class EmpresaDetailSubcomisionCarreraForm(forms.ModelForm):

    class Meta():
        model = models.Empresa
        fields = (
            'nombre_fantasia',
            'descripcion',
            'logo',
            'url'
        )
    def __init__(self, *args, **kwargs):
        super(EmpresaDetailSubcomisionCarreraForm, self).__init__(*args, **kwargs)
        self.fields['nombre_fantasia'].disabled = True
        self.fields['descripcion'].disabled = True
        self.fields['logo'].disabled = True
        self.fields['url'].disabled = True


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
            'status',
            'pasantia_aceptada'
        )
    def __init__(self, *args, **kwargs):
        super(EntrevistaDetailSubcomisionCarreraForm, self).__init__(*args, **kwargs)
        self.fields['fecha'].disabled = True
        self.fields['alumno'].widget.attrs['readonly'] = True
        self.fields['empresa'].widget.attrs['readonly'] = True
        self.fields['resultado'].widget.attrs['readonly'] = True
        self.fields['comentarios_empresa'].widget.attrs['readonly'] = True
        self.fields['status'].disabled = True
        self.fields['pasantia_aceptada'].disabled = True


class EntrevistaDetailEmpresaForm(forms.ModelForm):
    class Meta():
        model = models.Entrevista
        fields = (
            'pasantia_aceptada',
            'fecha',
            'lugar',
            'resultado',
            'comentarios_empresa',
            'comentarios_comision_pps',
        )

    def __init__(self, *args, **kwargs):
        super(EntrevistaDetailEmpresaForm, self).__init__(*args, **kwargs)
        if self.instance.status == 'REA':
            if self.instance.pasantia_aceptada == True or self.instance.pasantia_aceptada == False:
                self.fields['pasantia_aceptada'].disabled = True
        else:
            self.fields.pop('pasantia_aceptada')
        if not self.instance.status in ['COA', 'NOA'] or datetime.astimezone(self.instance.fecha - td(days=1)) < datetime.astimezone(datetime.now()):
            self.fields['fecha'].widget.attrs['readonly'] = True
            self.fields['lugar'].widget.attrs['readonly'] = True
        self.fields['comentarios_comision_pps'].widget.attrs['readonly'] = True

class EntrevistaDetailAlumnoForm(forms.ModelForm):
    class Meta():
        model = models.Entrevista
        fields = (
            'fecha',
            'lugar',
            'resultado'
        )

    def __init__(self, *args, **kwargs):
        super(EntrevistaDetailAlumnoForm, self).__init__(*args, **kwargs)
        self.fields['fecha'].widget.attrs['readonly'] = True
        self.fields['lugar'].widget.attrs['readonly'] = True
        self.fields['resultado'].widget.attrs['readonly'] = True


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
        self.fields['tutor_docente'].disabled = True
        self.fields['comentarios_comision_pps'].widget.attrs['readonly'] = True

class TutorEmpresaDetailEmpresaForm(forms.ModelForm):
    class Meta():
        model = models.TutorEmpresa
        fields = (
            'apellido',
            'nombre',
            'cargo',
            'mail',
        )

class PasantiaDetailSubcomisionCarreraForm(forms.ModelForm):
    class Meta():
        model = models.Pasantia
        fields = (
            'status',
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
        if not self.instance.practica_plan_de_estudio:
            self.fields['status'].widget.disabled = True
        self.fields['fecha_inicio'].widget.attrs['readonly'] = True
        self.fields['fecha_fin'].widget.attrs['readonly'] = True
        self.fields['tutor_empresa'].queryset = models.TutorEmpresa.objects.filter(
                empresa=self.instance.entrevista.empresa)
        self.fields['informe'].widget.attrs['readonly'] = True
        self.fields['numero_legajo'].widget.attrs['readonly'] = True
        self.fields['comentarios_empresa'].widget.attrs['readonly'] = True
        self.fields['comentarios_comision_pps'].widget.attrs['readonly'] = True

class AlumnoCreateForm(forms.ModelForm):
#    layout = Layout(Row('numero_registro', 'telefono'),
 #                   'carrera',
 #                   Row('perfil', 'curriculum'),
 #                   Row('historia_academica', 'plan_de_estudio'),
  #                  'descripcion_intereses','descripcion_habilidades')
    class Meta:
        model = models.Alumno
        fields = (
            'numero_registro',
            'carrera',
            'perfil',
            'telefono',
            'curriculum',
            'plan_de_estudio',
            'historia_academica',
            'descripcion_intereses',
            'descripcion_habilidades',
        )

    def __init__(self, *args, **kwargs):
        super(AlumnoCreateForm, self).__init__(*args, **kwargs)
        self.fields['carrera'].required = True
        self.fields['carrera'].queryset = models.Carrera.objects.filter(activa=True)

class UserCreateForm(RegistrationForm):
#    layout = Layout('username', 'email',
#                    Row('password1', 'password2'),
#                    Fieldset('Datos Personales',
 #                            Row('first_name', 'last_name')))
    class Meta(RegistrationForm):
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
        super(UserCreateForm, self).__init__(*args, **kwargs)
        self.fields['email'].required = True
        self.fields['first_name'].required = True
        self.fields['last_name'].required = True


class UserWithoutNameCreateForm(RegistrationForm):
    class Meta(RegistrationForm):
        model = models.User
        fields = (
            'username',
            'email',
            'password1',
            'password2',
        )
    def __init__(self, *args, **kwargs):
        super(UserWithoutNameCreateForm, self).__init__(*args, **kwargs)
        self.fields['email'].required = True

class UserEditForm(forms.ModelForm):
    class Meta:
        model = models.User
        fields = ('first_name', 'last_name', 'username', 'email')

class AlumnoEditForm(forms.ModelForm):
    class Meta:
        model = models.Alumno
        fields = ('perfil', 'telefono', 'curriculum', 'plan_de_estudio', 'historia_academica', 'descripcion_intereses', 'descripcion_habilidades')

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
        self.fields['email'].disabled = True
        self.fields['username'].disabled = True

class SubcomisionCarreraEditForm(forms.ModelForm):
    class Meta:
        model = models.SubcomisionCarrera
        fields = ('docentes',)

    class Media:
        css = {'all': ('/static/admin/css/widgets.css',), }
        js = ('/static/jsAdmin.js',)

    def __init__(self, *args, **kwargs):
        super(SubcomisionCarreraEditForm, self).__init__(*args, **kwargs)
        self.fields['docentes'] = forms.ModelMultipleChoiceField(queryset=models.Docente.objects.filter(departamento=self.instance.carrera.departamento), widget=FilteredSelectMultiple("Docentes", is_stacked=False))

class SubcomisionCarreraCreateForm(forms.ModelForm):
    class Meta:
        model = models.SubcomisionCarrera
        fields = ('docentes',)

    class Media:
        css = {'all': ('/static/admin/css/widgets.css',), }
        js = ('/static/jsAdmin.js',)

    def __init__(self, user, *args, **kwargs):
        super(SubcomisionCarreraCreateForm, self).__init__(*args, **kwargs)
        self.fields['docentes'] = forms.ModelMultipleChoiceField(queryset=models.Docente.objects.filter(departamento=user.pps_user.departamento), widget=FilteredSelectMultiple("Docentes", is_stacked=False))


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

class EntrevistaCreateForm(forms.ModelForm):

    class Meta():
        model = models.Entrevista
        fields = ['fecha', 'lugar']
        
class EntrevistaExistenteCreateForm(forms.ModelForm):
    class Meta:
        model = models.Entrevista
        fields = ['fecha', 'lugar']

    def __init__(self, *args, **kwargs):
        super(EntrevistaExistenteCreateForm, self).__init__(*args, **kwargs)
        self.fields['fecha'].widget.attrs['readonly'] = True


class SubcomisionPasantiasUserEditForm(forms.ModelForm):
    class Meta:
        model = models.User
        fields = ('username', 'email')
    def __init__(self, *args, **kwargs):
        super(SubcomisionPasantiasUserEditForm, self).__init__(*args, **kwargs)
        self.fields['email'].disable = True
        self.fields['username'].required = True

class SubcomisionPasantiasForm(forms.ModelForm):
    class Meta:
        model = models.SubcomisionPasantiasPPS
        fields = ('docentes',)

    class Media:
        css = {'all': ('/static/admin/css/widgets.css',), }
        js = ('/static/jsAdmin.js',)

    def __init__(self, *args, **kwargs):
        super(SubcomisionPasantiasForm, self).__init__(*args, **kwargs)
        self.fields['docentes'] = forms.ModelMultipleChoiceField(
            queryset=models.Docente.objects.filter(departamento=self.instance.departamento).order_by('apellido'),
            widget=FilteredSelectMultiple("Docentes", is_stacked=False))


class AlumnoDetailComisionPasantiasForm(forms.ModelForm):

    class Meta():
        model = models.Alumno
        fields = (
            'numero_registro',
            'carrera',
            'progreso',
            'perfil',
            'telefono',
            'curriculum',
            'plan_de_estudio',
            'historia_academica',
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
        self.fields['condicion_acreditacion'].disabled = True
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
            'status',
            'pasantia_aceptada'
        )
    def __init__(self, *args, **kwargs):
        super(EntrevistaDetailComisionPasantiasForm, self).__init__(*args, **kwargs)
        self.fields['alumno'].widget.attrs['readonly'] = True
        self.fields['empresa'].widget.attrs['readonly'] = True
        self.fields['resultado'].widget.attrs['readonly'] = True
        self.fields['comentarios_empresa'].widget.attrs['readonly'] = True

class CarreraCreateComisionPasantiasForm(forms.ModelForm):
    class Meta:
        model = models.Carrera
        fields = ('nombre',)

    def __init__(self, *args, **kwargs):
        super(CarreraCreateComisionPasantiasForm, self).__init__(*args, **kwargs)
        self.fields['nombre'].required = True


class EmpresaCreateComisionPasantiasForm(forms.ModelForm):
    class Meta:
        model = models.Empresa
        fields = ('nombre_fantasia',)

    def __init__(self, *args, **kwargs):
        super(EmpresaCreateComisionPasantiasForm, self).__init__(*args, **kwargs)
        self.fields['nombre_fantasia'].required = True

class PasantiaDetailComisionPasantiasForm(forms.ModelForm):
    class Meta():
        model = models.Pasantia
        fields = (
            'status',
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
        user = kwargs.pop('user', None)
        super(PasantiaDetailComisionPasantiasForm, self).__init__(*args, **kwargs)
        self.fields['tutor_docente'].queryset = models.Docente.objects.filter(
            departamento=user.pps_user.departamento)
        self.fields['tutor_empresa'].queryset = models.TutorEmpresa.objects.filter(
            empresa=self.instance.entrevista.empresa)
        self.fields['comentarios_empresa'].widget.attrs['readonly'] = True


class PasantiaCreateForm(forms.ModelForm):
    class Meta():
        model = models.Pasantia
        fields = (
            'fecha_inicio',
            'fecha_fin',
            'entrevista',
            'tutor_docente',
            'tutor_empresa',
            'informe',
            'numero_legajo',
            'comentarios_comision_pps',
        )

    def __init__(self, *args, **kwargs):
        user = kwargs.pop('user', None)
        super(PasantiaCreateForm, self).__init__(*args, **kwargs)
        self.fields['tutor_docente'].queryset = models.Docente.objects.filter(
            departamento=user.pps_user.departamento)