from django.db import models
from django.contrib.auth.models import AbstractUser
from datetime import date
from datetime import datetime
from pytz import UTC
from django.core.exceptions import ValidationError
import re


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

    numero_registro = models.PositiveIntegerField(validators=[validate_hash], unique=True)
    carrera = models.ForeignKey('Carrera', on_delete=models.DO_NOTHING)
    curriculum = models.FileField(upload_to='curriculums/', blank=True, null=True)
    descripcion_intereses = models.TextField(max_length=500, blank=True, null=True)
    descripcion_habilidades = models.TextField(max_length=1000, blank=True, null=True)
    ultima_actualizacion_perfil = models.DateField(default=date.today)
    ultima_postulacion = models.DateField(null=True, blank=True)
    condicion_acreditacion = models.NullBooleanField(verbose_name='Está en condición de acreditación')
    expedicion_acreditacion = models.TextField(max_length=500, null=True, blank=True)
    comentarios_comision_carrera = models.TextField(max_length=1000, null=True, blank=True)
    comentarios_carrera_visibles = models.BooleanField(default=False, verbose_name='Comentarios visibles para las empresas')
    comentarios_comision_pps = models.TextField(max_length=1000, null=True, blank=True)
    user = models.OneToOneField(User, on_delete=models.CASCADE, related_name='alumno_user')

    class Meta:
        verbose_name = 'Alumno'
        verbose_name_plural = 'Alumnos'

    def __str__(self):
        return str(self.user.__str__())


class Carrera(models.Model):
    departamento = models.ForeignKey('Departamento', on_delete=models.CASCADE)
    nombre = models.CharField(max_length=100, primary_key=True)
    duracion = models.PositiveSmallIntegerField()

    class Meta:
        verbose_name = 'Carrera'
        verbose_name_plural = 'Carreras'
        unique_together = (("departamento", "nombre"),)

    def __str__(self):
        return self.nombre


class SubcomisionCarrera(models.Model):
    carrera = models.OneToOneField('Carrera', on_delete=models.CASCADE)
    docente = models.ManyToManyField('Docente', verbose_name='docentes')
    user = models.OneToOneField(User, on_delete=models.CASCADE, related_name='carrera_user')

    class Meta:
        verbose_name = 'SubcomisionCarrera'
        verbose_name_plural = 'SubcomisionesCarreras'

    def __str__(self):
        return "SubcomisionCarrera " + self.carrera.__str__()


class SubcomisionPasantiasPPS(models.Model):
    departamento = models.OneToOneField('Departamento', on_delete=models.CASCADE)
    docente = models.ManyToManyField('Docente', verbose_name='docentes')
    user = models.OneToOneField(User, on_delete=models.CASCADE, related_name='pps_user')

    class Meta:
        verbose_name = 'SubcomisionPasantiasPPS'
        verbose_name_plural = 'SubcomisionesPasantiasPPS'

    def __str__(self):
        return "SubcomisionPasantias " + self.departamento.__str__()


class Docente(models.Model):
    numero_registro = models.PositiveIntegerField(primary_key=True)
    nombre = models.CharField(max_length=30)
    apellido = models.CharField(max_length=20)
    departamento = models.ForeignKey('Departamento', on_delete=models.DO_NOTHING, null=True)
    mail = models.EmailField(unique=True)
    box_oficina = models.CharField(max_length=30)

    class Meta:
        verbose_name = 'Docente'
        verbose_name_plural = 'Docentes'

    def __str__(self):
        return self.nombre + " " + self.apellido


class Pasantia(models.Model):
    fecha_inicio = models.DateTimeField()
    fecha_fin = models.DateTimeField()
    tutor_docente = models.ForeignKey('Docente', on_delete=models.DO_NOTHING, null=True)
    tutor_empresa = models.ForeignKey('TutorEmpresa', on_delete=models.DO_NOTHING, null=True, blank=True)
    entrevista = models.ForeignKey('Entrevista', on_delete=models.DO_NOTHING)
    informe = models.FileField(upload_to='informes/', blank=True, null=True)
    numero_legajo = models.PositiveIntegerField(unique=True, blank=True, null=True)
    comentarios_empresa = models.TextField(max_length=1000, blank=True, null=True)
    comentarios_comision_pps = models.TextField(max_length=1000, blank=True, null=True)

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
    resultado = models.TextField(max_length=1000, blank=True, null=True)
    comentarios_empresa = models.TextField(max_length=1000, blank=True, null=True)
    comentarios_comision_pps = models.TextField(max_length=1000, blank=True, null=True)
    notificado_alumno = models.BooleanField(default=False)
    confirmada_alumno = models.BooleanField(default=False)
    cancelada_empresa = models.BooleanField(default=False)
    cancelada_alumno = models.BooleanField(default=False)

    class Meta:
        verbose_name = 'Entrevista'
        verbose_name_plural = 'Entrevistas'
        unique_together = (("alumno", "empresa", "fecha"),)

    def __str__(self):
        return self.empresa.__str__() + " a " + self.alumno.__str__()

    def is_past_due(self):
        return datetime.utcnow().replace(tzinfo=UTC) > self.fecha.replace(tzinfo=UTC)


class Empresa(models.Model):
    descripcion = models.TextField(max_length=500)
    departamento = models.ForeignKey('Departamento', on_delete=models.CASCADE)
    user = models.OneToOneField(User, on_delete=models.CASCADE, related_name='empresa_user')

    class Meta:
        verbose_name = 'Empresa'
        verbose_name_plural = 'Empresas'

    def get_cantidad_de_pasantes(self):
        return Pasantia.objects.filter(tutor_empresa__empresa=self).count()

    def __str__(self):
        return self.user.__str__()


class Puesto(models.Model):
    puesto_id = models.AutoField(primary_key=True)
    empresa = models.ForeignKey('Empresa', on_delete=models.CASCADE)
    nombre = models.CharField(max_length=50)
    descripcion = models.TextField(max_length=1000)
    dedicacion = models.PositiveSmallIntegerField()
    horario = models.CharField(max_length=20)
    remuneracion = models.DecimalField(max_digits=8, decimal_places=2, default=0, blank=True, null=True)

    class Meta:
        verbose_name = 'Puesto'
        verbose_name_plural = 'Puestos'

    def get_cantidad_alumnos(self):
        return Postulaciones.objects.filter(puesto=self).count()

    def __str__(self):
        return self.nombre


class Postulaciones(models.Model):
    puesto = models.ForeignKey('Puesto', on_delete=models.CASCADE)
    alumno = models.ForeignKey('Alumno', on_delete=models.CASCADE)
    entrevista = models.ForeignKey('Entrevista', on_delete=models.CASCADE, null=True, blank=True)
    fecha = models.DateTimeField()

    class Meta:
        verbose_name = 'Postulacion'
        verbose_name_plural = 'Postulaciones'
        unique_together = (("puesto", "alumno"),)

    def __str__(self):
        return self.puesto.empresa.__str__() + " - " + self.puesto.__str__() +" - " + self.alumno.__str__()


class Departamento(models.Model):
    nombre = models.CharField(max_length=50, primary_key=True)

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