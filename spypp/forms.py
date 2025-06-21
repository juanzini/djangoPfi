from django.forms import PasswordInput
from django_registration.forms import RegistrationForm
from material.base import *
from . import models
from datetime import timedelta as td
from datetime import datetime
from django.utils import timezone
from django import forms
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.forms import UserChangeForm
from django.contrib.admin.widgets import FilteredSelectMultiple
from django.forms import ValidationError

class AlumnoDetailSubcomisionCarreraForm(forms.ModelForm):
    layout = Layout(Row('numero_registro', 'carrera'),
                    Row('telefono', 'progreso'),
                    'descripcion_intereses',
                    'descripcion_habilidades',
                    'consideraciones_particulares',
                    Row('ultima_actualizacion_perfil', 'ultima_postulacion'),
                    'condicion_acreditacion',
                    'expedicion_acreditacion',
                    'comentarios_carrera_visibles',
                    'comentarios_comision_carrera',
                    'comentarios_comision_pps')

    class Meta():
        model = models.Alumno
        fields = (
            'numero_registro',
            'carrera',
            'telefono',
            'progreso',
            'descripcion_intereses',
            'descripcion_habilidades',
            'consideraciones_particulares',
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
        self.fields['carrera'].disabled = True
        self.fields['descripcion_intereses'].disabled = True
        self.fields['telefono'].disabled = True
        self.fields['descripcion_habilidades'].disabled = True
        self.fields['consideraciones_particulares'].disabled = True
        self.fields['ultima_actualizacion_perfil'].disabled = True
        self.fields['ultima_postulacion'].disabled = True
        self.fields['comentarios_comision_pps'].disabled = True

class EmpresaDetailSubcomisionCarreraForm(forms.ModelForm):

    class Meta():
        model = models.Empresa
        fields = (
            'descripcion',
        )
    def __init__(self, *args, **kwargs):
        super(EmpresaDetailSubcomisionCarreraForm, self).__init__(*args, **kwargs)
        self.fields['descripcion'].disabled = True


class EmpresaDetailComisionPasantiasForm(forms.ModelForm):
    class Meta():
        model = models.Empresa
        fields = (
            'descripcion',
        )
    def __init__(self, *args, **kwargs):
        super(EmpresaDetailComisionPasantiasForm, self).__init__(*args, **kwargs)
        self.fields['descripcion'].disabled = True


class CreateTutoresEmpresaDetailComisionPasantiasForm(forms.ModelForm):

    class Meta():
        model = models.TutorEmpresa
        fields = (
            'empresa',
            'mail',
            'nombre',
            'apellido',
            'cargo',
        )
    def __init__(self, *args, **kwargs):
        user = kwargs.pop('user', None)
        super(CreateTutoresEmpresaDetailComisionPasantiasForm, self).__init__(*args, **kwargs)
        self.fields['empresa'].queryset = models.Empresa.objects.filter(departamento=user.pps_user.departamento)

class CreateDocenteEmpresaDetailComisionPasantiasForm(forms.ModelForm):

    class Meta():
        model = models.Docente
        fields = (
            'nombre',
            'apellido',
            'email',
            'box_oficina',
        )
    def __init__(self, *args, **kwargs):
        user = kwargs.pop('user', None)
        super(CreateDocenteEmpresaDetailComisionPasantiasForm, self).__init__(*args, **kwargs)
        self.instance.departamento = models.Departamento.objects.get(pk=user.pps_user.departamento.pk)

class UpdateDocenteEmpresaDetailComisionPasantiasForm(forms.ModelForm):

    class Meta():
        model = models.Docente
        fields = (
            'nombre',
            'apellido',
            'email',
            'box_oficina',
        )
    def __init__(self, *args, **kwargs):
        user = kwargs.pop('user', None)
        super(UpdateDocenteEmpresaDetailComisionPasantiasForm, self).__init__(*args, **kwargs)
        self.instance.departamento = models.Departamento.objects.get(pk=user.pps_user.departamento.pk)
        self.fields['email'].disabled = True


class EntrevistaDetailSubcomisionCarreraForm(forms.ModelForm):
    layout = Layout(Row('empresa', 'alumno'),
                    Row('status', 'fecha'),
                    'pasantia_aceptada',
                    'resultado',
                    'comentarios_empresa',
                    'comentarios_comision_pps')

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
        self.fields['fecha'].input_formats = ['%d/%m/%Y %H:%M']
        self.fields['alumno'].disabled = True
        self.fields['empresa'].disabled = True
        self.fields['resultado'].disabled = True
        self.fields['comentarios_empresa'].disabled = True
        if self.instance.alumno.condicion_acreditacion:
            self.fields['comentarios_comision_pps'].disabled = True
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
        if not self.instance.status in ['NOA'] or datetime.astimezone(self.instance.fecha - td(days=1)) < datetime.astimezone(datetime.now()):
            self.fields['fecha'].disabled = True
            self.fields['lugar'].disabled = True
        self.fields['comentarios_comision_pps'].disabled = True
        self.fields['fecha'].input_formats = ['%d/%m/%Y %H:%M']
        self.fields['fecha'].error_messages = {'invalid_day': "La fecha no puede ser anterior a hoy!"}

    def clean_fecha(self):
        date = self.cleaned_data['fecha']
        if date < timezone.now():
            raise ValidationError(self.fields['fecha'].error_messages['invalid_day'])
        return date

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
        self.fields['fecha'].disabled = True
        self.fields['lugar'].disabled = True
        self.fields['resultado'].disabled = True
        self.fields['fecha'].input_formats = ['%d/%m/%Y %H:%M']

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
        self.fields['fecha_fin'].disabled = True
        self.fields['fecha_inicio'].disabled = True
        self.fields['tutor_empresa'].queryset = models.TutorEmpresa.objects.filter(empresa=self.instance.entrevista.empresa)
        self.fields['tutor_docente'].disabled = True
        self.fields['comentarios_comision_pps'].disabled = True

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
    layout = Layout(Row('empresa', 'status'),
                    Row('fecha_inicio', 'fecha_fin'),
                    Row('tutor_empresa', 'tutor_docente'),
                    Row('numero_legajo', 'informe'),
                    'comentarios_empresa', 'comentarios_comision_pps')
    empresa = forms.CharField(label='Empresa')

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
            self.fields['status'].disabled = True
            self.fields['fecha_inicio'].disabled = True
            self.fields['fecha_fin'].disabled = True
            self.fields['informe'].disabled = True
            self.fields['numero_legajo'].disabled = True
            self.fields['comentarios_comision_pps'].disabled = True
        self.fields['tutor_empresa'].queryset = models.TutorEmpresa.objects.filter(
                empresa=self.instance.empresa)
        self.fields['comentarios_empresa'].disabled = True
        self.fields['empresa'].initial = self.instance.empresa.__str__()
        self.fields['empresa'].disabled = True
        self.fields['tutor_docente'].queryset = models.Docente.objects.filter(
                departamento=self.instance.alumno.carrera.departamento).order_by('apellido')

class AlumnoCreateForm(forms.ModelForm):
    layout = Layout(Row('numero_registro', 'telefono'),
                   'carrera',
                   Row('perfil', 'curriculum'),
                   Row('historia_academica'),
                   'descripcion_intereses','descripcion_habilidades','consideraciones_particulares')
    class Meta:
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
        )
        help_texts = {
            'historia_academica': (
                'La encontrás en tu Siu Guarani -> Reportes -> Historia Académica'),
            'consideraciones_particulares': (
                'Ej: celiaquía, movilidad reducida, diabetes, etc.'),
        }

    def __init__(self, *args, **kwargs):
        super(AlumnoCreateForm, self).__init__(*args, **kwargs)
        self.fields['carrera'].required = True
        self.fields['carrera'].queryset = models.Carrera.objects.filter(activa=True)
        self.fields['telefono'].error_messages['invalid'] = 'Ingrese un número telefónico válido (ej. 2664018048)'

class UserCreateForm(RegistrationForm):
    layout = Layout('username', 'email',
                   Row('password1', 'password2'),
                   Fieldset('Datos Personales',
                            Row('first_name', 'last_name')))
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
        help_texts = {
            'username': ('Alias con el que iniciarás sesion. 150 carácteres como máximo. Únicamente letras, dígitos y @/./+/-/_'),
        }

    def __init__(self, *args, **kwargs):
        super(UserCreateForm, self).__init__(*args, **kwargs)
        self.fields['email'].required = True
        self.fields['first_name'].required = True
        self.fields['last_name'].required = True


class UserWithoutNameCreateForm(RegistrationForm):
    layout = Layout(Row('username', 'email'),
                    Row('password1', 'password2'))

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


class UserWithoutNameAndPassCreateForm(forms.ModelForm):
    layout = Layout(Row('username', 'email'),)

    class Meta(RegistrationForm):
        model = models.User
        fields = (
            'username',
            'email',
        )
    def __init__(self, *args, **kwargs):
        super(UserWithoutNameAndPassCreateForm, self).__init__(*args, **kwargs)
        self.fields['email'].required = True


class UserEditForm(forms.ModelForm):
    layout = Layout('email',
                    'username',
                    Row('first_name', 'last_name'))
    class Meta:
        model = models.User
        fields = ('first_name', 'last_name', 'username', 'email')

class AlumnoEditForm(forms.ModelForm):
    layout = Layout(Row('telefono'),
                    Row('perfil', 'curriculum'),
                    Row('historia_academica'),
                    'descripcion_intereses', 'descripcion_habilidades', 'consideraciones_particulares')

    class Meta:
        model = models.Alumno
        fields = ('perfil', 'telefono', 'curriculum', 'historia_academica', 'descripcion_intereses', 'descripcion_habilidades', 'consideraciones_particulares')

    def __init__(self, *args, **kwargs):
        super(AlumnoEditForm, self).__init__(*args, **kwargs)
        self.fields['telefono'].error_messages['invalid'] = 'Ingrese un número telefónico válido (ej. 2664018048)'


class EmpresaUserEditForm(forms.ModelForm):
    class Meta:
        model = models.User
        fields = ['email',]

    def __init__(self, *args, **kwargs):
        super(EmpresaUserEditForm, self).__init__(*args, **kwargs)
        self.fields['email'].required = True

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
        fields = ('mail_publico','docentes',)

    def __init__(self, *args, **kwargs):
        super(SubcomisionCarreraEditForm, self).__init__(*args, **kwargs)
        self.fields['docentes'] = forms.ModelMultipleChoiceField(queryset=models.Docente.objects.filter(departamento=self.instance.carrera.departamento).order_by('apellido'), widget=FilteredSelectMultiple("Docentes", is_stacked=False))

class SubcomisionCarreraCreateForm(forms.ModelForm):
    class Meta:
        model = models.SubcomisionCarrera
        fields = ('docentes',)

    class Media:
        css = {'all': ('/static/admin/css/widgets.css',), }
        js = ('/static/jsAdmin.js',)

    def __init__(self, user, *args, **kwargs):
        super(SubcomisionCarreraCreateForm, self).__init__(*args, **kwargs)
        self.fields['docentes'] = forms.ModelMultipleChoiceField(queryset=models.Docente.objects.filter(departamento=user.pps_user.departamento).order_by('apellido'), widget=FilteredSelectMultiple("Docentes", is_stacked=False))


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
    fecha = forms.DateTimeField()

    class Meta():
        model = models.Entrevista
        fields = ['fecha', 'lugar']
        
    def __init__(self, *args, **kwargs):
        super(EntrevistaCreateForm, self).__init__(*args, **kwargs)
        self.fields['fecha'].input_formats = ["%d/%m/%Y %H:%M"]
        self.fields['fecha'].error_messages = {'invalid_day': "La fecha no puede ser anterior a hoy!"}

    def clean_fecha(self):
        date = self.cleaned_data['fecha']
        if date < timezone.now():
            raise ValidationError(self.fields['fecha'].error_messages['invalid_day'])
        return date
        
class EntrevistaExistenteCreateForm(forms.ModelForm):
    fecha = forms.DateTimeField()

    class Meta:
        model = models.Entrevista
        fields = ['fecha', 'lugar']

    def __init__(self, *args, **kwargs):
        super(EntrevistaExistenteCreateForm, self).__init__(*args, **kwargs)
        self.fields['fecha'].disabled = True
        self.fields['fecha'].input_formats = ['%d/%m/%Y %H:%M']
        self.fields['fecha'].error_messages = {'invalid_day': "La fecha no puede ser anterior a hoy!"}

    def clean_fecha(self):
        date = self.cleaned_data['fecha']
        if date < timezone.now():
            raise ValidationError(self.fields['fecha'].error_messages['invalid_day'])
        return date


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
    layout = Layout(Row('numero_registro', 'carrera'),
                    Row('telefono', 'progreso'),
                    'descripcion_intereses',
                    'descripcion_habilidades',
                    'consideraciones_particulares',
                    Row('ultima_actualizacion_perfil', 'ultima_postulacion'),
                    'condicion_acreditacion',
                    'expedicion_acreditacion',
                    'comentarios_comision_carrera',
                    'comentarios_comision_pps',
                    'comentarios_carrera_visibles')

    class Meta():
        model = models.Alumno
        fields = (
            'numero_registro',
            'carrera',
            'progreso',
            'perfil',
            'telefono',
            'curriculum',
            'historia_academica',
            'descripcion_intereses',
            'descripcion_habilidades',
            'consideraciones_particulares',
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
        if not self.instance.expedicion_acreditacion:
            self.fields['expedicion_acreditacion'].label = 'No hay detalle sobre acreditación o su negativa'
        self.fields['expedicion_acreditacion'].disabled = True
        if not self.instance.expedicion_acreditacion:
            self.fields['comentarios_comision_carrera'].label = 'No hay comentarios de la comisión de carrera'
        self.fields['comentarios_comision_carrera'].disabled = True
        self.fields['telefono'].error_messages['invalid'] = 'Ingrese un número telefónico válido (ej. 2664018048)'

class EntrevistaDetailComisionPasantiasForm(forms.ModelForm):
    layout = Layout(Row('empresa', 'alumno'),
                    Row('status', 'fecha'),
                    'pasantia_aceptada',
                    'comentarios_comision_pps',
                    'resultado',
                    'comentarios_empresa')

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
        self.fields['alumno'].disabled = True
        self.fields['empresa'].disabled = True
        self.fields['fecha'].input_formats = ['%d/%m/%Y %H:%M']
        if not self.instance.resultado:
            self.fields['resultado'].label = 'Aún no hay resultado de la entrevista'
        self.fields['resultado'].disabled = True
        if not self.instance.comentarios_empresa:
            self.fields['comentarios_empresa'].label = 'No hay comentarios de la empresa'
        self.fields['comentarios_empresa'].disabled = True

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
    layout = Layout('status',
                    Row('fecha_inicio', 'fecha_fin'),
                    Row('tutor_docente', 'tutor_empresa'),
                    'informe',
                    'numero_legajo',
                    'comentarios_comision_pps',
                    'comentarios_empresa',
                    'practica_plan_de_estudio')

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
            'practica_plan_de_estudio',
            'comentarios_empresa',
            'comentarios_comision_pps',
        )

    def __init__(self, *args, **kwargs):
        user = kwargs.pop('user', None)
        super(PasantiaDetailComisionPasantiasForm, self).__init__(*args, **kwargs)
        self.fields['tutor_docente'].queryset = models.Docente.objects.filter(
            departamento=user.pps_user.departamento).order_by('apellido')
        self.fields['tutor_empresa'].queryset = models.TutorEmpresa.objects.filter(
            empresa=self.instance.empresa).order_by('apellido')
        if not self.instance.comentarios_empresa:
            self.fields['comentarios_empresa'].label = 'No hay comentarios de la empresa'
        self.fields['comentarios_empresa'].disabled = True
        self.fields['practica_plan_de_estudio'].widget = forms.RadioSelect(choices=((True, 'Si'), (False, 'No')))


class PasantiaCreateForm(forms.ModelForm):
    layout = Layout('status',
                    'alumno',
                    'empresa',
                    Row('fecha_inicio', 'fecha_fin'),
                    Row('tutor_docente', 'tutor_empresa'),
                    'informe',
                    'numero_legajo',
                    'comentarios_comision_pps')

    class Meta():
        model = models.Pasantia
        fields = (
            'status',
            'fecha_inicio',
            'fecha_fin',
            'alumno',
            'empresa',
            'tutor_docente',
            'tutor_empresa',
            'informe',
            'numero_legajo',
            'comentarios_comision_pps',
        )

    def __init__(self, *args, **kwargs):
        user = kwargs.pop('user', None)
        super(PasantiaCreateForm, self).__init__(*args, **kwargs)
        if user.tipo == models.User.CC:
            self.fields['tutor_docente'].queryset = models.Docente.objects.filter(
                departamento=user.carrera_user.carrera.departamento).order_by('apellido')
        else:
            self.fields['tutor_docente'].queryset = models.Docente.objects.filter(
                departamento=user.pps_user.departamento).order_by('apellido')
        self.fields['tutor_empresa'].queryset = models.TutorEmpresa.objects.none()