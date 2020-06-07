from django.db import models
from django.contrib.auth.models import AbstractUser, UserManager
from datetime import date
from datetime import datetime
from pytz import UTC
from django.core.exceptions import ValidationError
from private_storage.fields import PrivateFileField
from django.core.validators import MinValueValidator, MaxValueValidator
from django.db.models import Count
from phonenumber_field.modelfields import PhoneNumberField
from datetime import timedelta as td
import uuid
import re

class UserManager(UserManager):
    pass

AbstractUser._meta.get_field('email')._unique = True
AbstractUser._meta.get_field('email').blank = False
AbstractUser._meta.get_field('email').null = False

class User(AbstractUser):
    AL = 'AL'
    CC = 'CC'
    CP = 'CP'
    EM = 'EM'
    TYPE_CHOICES = (
        (AL, 'Alumno'),
        (CC, 'Comision Carrera'),
        (CP, 'Comision PPS'),
        (EM, 'Empresa'),
    )
    tipo = models.CharField(max_length=2, choices=TYPE_CHOICES, default=AL)

    def __str__(self):
        return str(self.username)

    def __firstName__(self):
        return str(self.first_name)


class Alumno(models.Model):
    def validate_hash(value):
        reg = re.compile('^30[0-9]{5,6}')
        if not reg.match(str(value)):
            raise ValidationError(u'Formato de registro erroneo, recuerda que debe comenzar con 30')

    def curriculum_upload_path(instance, filename):
        return 'curriculums/{0}-{1}-{2}'.format("curriculum", instance.user.username, filename)
    def plan_upload_path(instance, filename):
        return 'planes_de_estudio/{0}-{1}-{2}'.format("plan", instance.user.username, filename)
    def historia_upload_path(instance, filename):
        return 'historias_academicas/{0}-{1}-{2}'.format("historia", instance.user.username, filename)
    def perfil_upload_path(instance, filename):
        return 'perfiles/{0}-{1}-{2}'.format("perfil", instance.user.username, filename)

    numero_registro = models.PositiveIntegerField(validators=[validate_hash], unique=True)
    curriculum = PrivateFileField('Curriculum (.pdf)', upload_to=curriculum_upload_path,
                                  content_types='application/pdf', max_file_size=1024 * 1024)
    plan_de_estudio = PrivateFileField('Plan de Estudio (.pdf)', upload_to=plan_upload_path,
                                  content_types='application/pdf', max_file_size=1024 * 1024)
    historia_academica = PrivateFileField('Historia Académica (.pdf)', upload_to=historia_upload_path,
                                       content_types='application/pdf', max_file_size=1024 * 1024)
    descripcion_intereses = models.TextField(max_length=500, blank=True, null=True)
    descripcion_habilidades = models.TextField(max_length=1000, blank=True, null=True)
    ultima_actualizacion_perfil = models.DateField(default=date.today)
    ultima_postulacion = models.DateField(null=True, blank=True)
    condicion_acreditacion = models.NullBooleanField(verbose_name='Está en condición de acreditación de práctica del plan de estudio?')
    expedicion_acreditacion = models.TextField(max_length=500, null=True, blank=True, verbose_name='Justificación de acreditación o su negativa')
    comentarios_comision_carrera = models.TextField(max_length=1000, null=True, blank=True)
    comentarios_carrera_visibles = models.BooleanField(default=False, verbose_name='Comentarios visibles para las empresas')
    comentarios_comision_pps = models.TextField(max_length=1000, null=True, blank=True)
    perfil = PrivateFileField(blank=True, null=True, content_types=('image/jpeg', 'image/png', 'image/jpg'),
                            upload_to=perfil_upload_path, max_file_size=1024 * 1024, verbose_name='Foto de perfil')
    progreso = models.SmallIntegerField(validators=[MinValueValidator(0),
                                       MaxValueValidator(100)], default=0, verbose_name='Progreso en %')
    telefono = PhoneNumberField(blank=True, null=True)
    user = models.OneToOneField(User, on_delete=models.CASCADE, related_name='alumno_user')
    carrera = models.ForeignKey('Carrera', on_delete=models.DO_NOTHING)

    class Meta:
        verbose_name = 'Alumno'
        verbose_name_plural = 'Alumnos'

    def __str__(self):
        return self.user.last_name.__str__() + ", " + self.user.first_name.__str__()


class Carrera(models.Model):
    departamento = models.ForeignKey('Departamento', on_delete=models.CASCADE)
    nombre = models.CharField(max_length=100)
    activa = models.BooleanField(default=True)

    class Meta:
        verbose_name = 'Carrera'
        verbose_name_plural = 'Carreras'
        unique_together = (("departamento", "nombre"),)

    def __str__(self):
        return self.nombre.__str__()

    def get_cantidad_de_alumnos(self):
        return Alumno.objects.filter(carrera=self).count()

    def get_cantidad_de_pasantias(self):
        return Pasantia.objects.filter(entrevista__alumno__carrera=self).count()

    def get_cantidad_de_docentes_en_subcomision(self):
        return SubcomisionCarrera.objects.annotate(total=Count('docentes')).get(carrera=self).total


class SubcomisionCarrera(models.Model):
    carrera = models.OneToOneField('Carrera', on_delete=models.CASCADE, related_name='carrera_comision')
    docentes = models.ManyToManyField('Docente', verbose_name='docentes', related_name='comision_docente')
    user = models.OneToOneField(User, on_delete=models.CASCADE, related_name='carrera_user')

    class Meta:
        verbose_name = 'SubcomisionCarrera'
        verbose_name_plural = 'SubcomisionesCarreras'

    def __str__(self):
        return "Subcomisión de Práctica - " + self.carrera.__str__()


class SubcomisionPasantiasPPS(models.Model):
    departamento = models.OneToOneField('Departamento', on_delete=models.CASCADE)
    docentes = models.ManyToManyField('Docente', verbose_name='docentes')
    user = models.OneToOneField(User, on_delete=models.CASCADE, related_name='pps_user')

    class Meta:
        verbose_name = 'SubcomisionPasantiasPPS'
        verbose_name_plural = 'SubcomisionesPasantiasPPS'

    def __str__(self):
        return "SubcomisionPasantias - " + self.departamento.__str__()


class Docente(models.Model):
    nombre = models.CharField(max_length=30)
    apellido = models.CharField(max_length=20)
    departamento = models.ForeignKey('Departamento', on_delete=models.DO_NOTHING, null=True)
    email = models.EmailField(primary_key=True)
    box_oficina = models.CharField(max_length=30)

    class Meta:
        verbose_name = 'Docente'
        verbose_name_plural = 'Docentes'

    def __str__(self):
        return self.apellido.__str__().upper() + " " + self.nombre


class Pasantia(models.Model):
    fecha_inicio = models.DateField()
    fecha_fin = models.DateField()
    tutor_docente = models.ForeignKey('Docente', on_delete=models.DO_NOTHING, null=True)
    tutor_empresa = models.ForeignKey('TutorEmpresa', on_delete=models.SET_NULL, null=True, blank=True)
    entrevista = models.OneToOneField('Entrevista', on_delete=models.DO_NOTHING, related_name='entrevista_pasantia')
    informe = models.FileField(upload_to='informes/', blank=True, null=True)
    numero_legajo = models.PositiveIntegerField(unique=True, blank=True, null=True)
    comentarios_empresa = models.TextField(max_length=1000, blank=True, null=True, verbose_name='Comentarios para la Comisión General de Pasantías')
    comentarios_comision_pps = models.TextField(max_length=1000, blank=True, null=True, verbose_name='Comentarios de la Comisión General de Pasantías')
    numero_de_expediente = models.PositiveIntegerField(unique=True, blank=True, null=True)
    practica_plan_de_estudio = models.BooleanField(default=False, verbose_name='Práctica del plan de estudio')
    STATUS_CHOICES = (
        ("FINALIZADA", "Finalizada"),
        ("DOCUMENTACION PENDIENTE", "Documentación pendiente"),
        ("EN CURSO", "En curso"),
        ("SIN INICIAR", "Sin iniciar")
    )
    status = models.CharField(max_length=23, choices=STATUS_CHOICES, default="SIN INICIAR")

    class Meta:
        verbose_name = 'Pasantia'
        verbose_name_plural = 'Pasantias'

    def __str__(self):
        return self.entrevista.__str__()


class TutorEmpresa(models.Model):
    empresa = models.ForeignKey('Empresa', on_delete=models.DO_NOTHING)
    nombre = models.CharField(max_length=30)
    apellido = models.CharField(max_length=20)
    cargo = models.CharField(max_length=30)
    mail = models.EmailField(primary_key=True)

    class Meta:
        verbose_name = 'Tutor de Empresa'
        verbose_name_plural = 'Tutores de Empresas'

    def __str__(self):
        return self.nombre + " " + self.apellido


class Entrevista(models.Model):
    alumno = models.ForeignKey('Alumno', on_delete=models.DO_NOTHING)
    empresa = models.ForeignKey('Empresa', on_delete=models.DO_NOTHING)
    fecha = models.DateTimeField()
    lugar = models.CharField(max_length=200, blank=False, null=False)
    resultado = models.TextField(max_length=1000, blank=True, null=True)
    pasantia_aceptada = models.BooleanField(blank=True, null=True)
    comentarios_empresa = models.TextField(max_length=1000, blank=True, null=True, verbose_name='Comentarios para la Comisión general de Pasantías')
    comentarios_comision_pps = models.TextField(max_length=1000, blank=True, null=True, verbose_name='Comentarios de la Comisión de Pasantías')
    NOA = 'NOA'
    COA = 'COA'
    CAE = 'CAE'
    CAA = 'CAA'
    REA = 'REA'
    NOC = 'NOC'
    STATUS_CHOICES = [
        (COA, 'Confirmada Alumno'),
        (NOC, 'No Confirmada Alumno'),
        (NOA, 'Notificada Alumno'),
        (CAA, 'Cancelada Alumno'),
        (REA, 'Realizada'),
        (CAE, 'Cancelada Empresa')
    ]
    status = models.CharField(max_length=3, choices=STATUS_CHOICES, default=NOA)

    class Meta:
        verbose_name = 'Entrevista'
        verbose_name_plural = 'Entrevistas'
        unique_together = (("alumno", "empresa", "fecha"),)

    def __str__(self):
        return self.empresa.__str__() + " a " + self.alumno.__str__()

    def is_past_due(self):
        if datetime.utcnow().replace(tzinfo=UTC) > self.fecha.replace(tzinfo=UTC):
            if not (self.status == self.REA or self.status == self.NOC):
                if self.status == self.COA:
                    self.status = self.REA
                else:
                    self.status = self.NOC
                self.entrevista_postulacion.fecha_desestimacion = datetime.now()
                self.entrevista_postulacion.activa = False
                self.entrevista_postulacion.save()
                self.save()
            return True
        return False


class Empresa(models.Model):
    def logo_upload_path(instance, filename):
        return 'logos/{0}-{1}-{2}'.format("logo", instance.user.username, filename)

    descripcion = models.TextField(max_length=1000, blank=True, null=True)
    url = models.URLField(max_length=200, default='', blank=True, null=True)
    logo = PrivateFileField(blank=True, null=True, content_types=('image/jpeg', 'image/png', 'image/jpg'),
                            upload_to=logo_upload_path, max_file_size=1024 * 1024)
    nombre_fantasia = models.CharField(max_length=200, blank=False, null=False, verbose_name="Nombre de Fantasía")
    departamento = models.ForeignKey('Departamento', on_delete=models.CASCADE)
    activa = models.BooleanField(default=True)
    user = models.OneToOneField(User, on_delete=models.CASCADE, related_name='empresa_user')

    class Meta:
        verbose_name = 'Empresa'
        verbose_name_plural = 'Empresas'
        unique_together = (("departamento", "nombre_fantasia"),)

    def get_cantidad_de_pasantes(self):
        return Pasantia.objects.filter(entrevista__empresa=self).count()

    def get_cantidad_de_postulados(self):
        return Postulacion.objects.filter(puesto__empresa=self, activa=True).count()

    def __str__(self):
        return self.nombre_fantasia.__str__()


class Puesto(models.Model):
    puesto_id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    empresa = models.ForeignKey('Empresa', on_delete=models.CASCADE)
    BE = 'BE'
    FE = 'FE'
    QA = 'QA'
    IOS = 'MB'
    AND = 'AND'
    IND = 'IND'
    OTR = 'OTR'
    AREA_CHOICES = [
        (BE, 'Back-end'),
        (FE, 'Front-end'),
        (QA, 'Quality Assurance'),
        (IOS, 'Mobile - iOS'),
        (AND, 'Mobile - Android'),
        (IND, 'Indistinto'),
        (OTR, 'Otro'),
    ]
    nombre = models.CharField(max_length=3, choices=AREA_CHOICES, default=IND, verbose_name='Área')
    descripcion_actividades = models.TextField(max_length=1000)
    conocimientos_requeridos = models.TextField(max_length=1000)
    horario = models.CharField(max_length=100)
    rentado = models.BooleanField(default=False, blank=False, null=False)
    fecha_inactivacion = models.DateField(default=datetime.today() + td(days=15))
    activo = models.BooleanField(default=True)

    class Meta:
        verbose_name = 'Puesto'
        verbose_name_plural = 'Puestos'
        unique_together = (("empresa", "nombre"),)

    def get_cantidad_alumnos(self):
        return Postulacion.objects.filter(puesto=self,activa=True).count()

    def __str__(self):
        return self.empresa.__str__() + ' ' + self.nombre.__str__()


class Postulacion(models.Model):
    puesto = models.ForeignKey('Puesto', on_delete=models.DO_NOTHING)
    alumno = models.ForeignKey('Alumno', on_delete=models.DO_NOTHING)
    entrevista = models.OneToOneField('Entrevista', on_delete=models.SET_NULL, null=True, blank=True, related_name='entrevista_postulacion')
    fecha = models.DateField(default=date.today)
    fecha_desestimacion = models.DateField(blank=True, null=True)
    activa = models.BooleanField(default=True)

    class Meta:
        verbose_name = 'Postulacion'
        verbose_name_plural = 'Postulaciones'
        unique_together = (("puesto", "alumno"),)

    def __str__(self):
        return self.puesto.empresa.__str__() + " - " + self.puesto.__str__() +" - " + self.alumno.__str__()


class Departamento(models.Model):
    nombre = models.CharField(max_length=50, unique=True)

    class Meta:
        verbose_name = 'Departamento'
        verbose_name_plural = 'Departamentos'

    def __str__(self):
        return self.nombre


class DirectorDepartamento(models.Model):
    departamento = models.OneToOneField('Departamento', on_delete=models.CASCADE)
    docente = models.OneToOneField('Docente', on_delete=models.CASCADE)

    class Meta:
        verbose_name = 'Director de Departamento'
        verbose_name_plural = 'Directores de Departamento'
        unique_together = (("departamento", "docente"),)

    def __str__(self):
        return "Director del " + self.departamento.__str__()