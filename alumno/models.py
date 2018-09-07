from django.db import models
from django.conf import settings
 
class Alumno(models.Model):
    numero_registro = models.PositiveIntegerField(primary_key = True)
    carrera = models.ForeignKey('Carrera', on_delete = models.DO_NOTHING)
    mail = models.EmailField(unique = True)
    curriculum = models.FileField(upload_to='curriculums/')
    descripcion_intereses = models.TextField(max_length = 500)
    descripcion_habilidades = models.TextField(max_length = 1000)
    ultima_actualizacion_perfil = models.DateTimeField()
    ultima_postulacion = models.DateTimeField()
    ultimo_ingreso = models.DateTimeField()
    primer_ingreso = models.DateTimeField(auto_now_add = True)
    nombre = models.CharField(max_length = 30)
    apellido = models.CharField(max_length = 20)
    prioridad = models.PositiveSmallIntegerField()
    condicion_acreditacion = models.NullBooleanField()
    expedicion_acreditacion = models.TextField(max_length = 500)
    comentarios_comision_carrera = models.TextField(max_length = 1000)
    comentarios_carrera_visibles = models.BooleanField()
    comentarios_comision_pps = models.TextField(max_length = 1000)
 
class Carrera(models.Model):
    departamento = models.ForeignKey('Departamento', on_delete = models.CASCADE)
    nombre = models.CharField(max_length = 100)
    duracion = models.PositiveSmallIntegerField()
    super_usuario = settings.AUTH_USER_MODEL
    class Meta:
    	unique_together = (("departamento", "nombre"),)

class SubcomisionCarrera(models.Model):
    carrera = models.ForeignKey('Carrera', on_delete = models.CASCADE)
    docente = models.ForeignKey('Docente', on_delete = models.CASCADE)
    class Meta:
    	unique_together = (("carrera", "docente"),)
 
class SubcomisionPasantiasPPS(models.Model):
    departamento = models.ForeignKey('Departamento', on_delete = models.CASCADE)
    docente = models.ForeignKey('Docente', on_delete = models.CASCADE)
    class Meta:
    	unique_together = (("departamento", "docente"),)
 
class Docente(models.Model):
    numero_registro = models.PositiveIntegerField(primary_key = True)
    nombre = models.CharField(max_length = 30)
    apellido = models.CharField(max_length = 20)
    departamento = models.OneToOneField('Departamento', on_delete = models.DO_NOTHING, null = True)
    mail = models.EmailField(unique = True)
    box_oficina = models.CharField(max_length = 30)
 
class Pasantia(models.Model):
    fecha_inicio = models.DateTimeField(auto_now_add = True)
    fecha_fin = models.DateTimeField()
    tutor_docente = models.ForeignKey('Docente', on_delete = models.DO_NOTHING)
    tutor_empresa = models.ForeignKey('TutorEmpresa', on_delete = models.DO_NOTHING)
    entrevista = models.OneToOneField('Entrevista', on_delete = models.DO_NOTHING, primary_key = True)
    informe = models.FileField(upload_to='informes/')
    numero_legajo = models.PositiveIntegerField(unique = True, null=True)
    comentarios_empresa = models.TextField(max_length = 1000)
    comentarios_comision_pps = models.TextField(max_length = 1000)
 
class TutorEmpresa(models.Model):
    empresa = models.ForeignKey('Empresa', on_delete = models.DO_NOTHING)
    nombre = models.CharField(max_length = 30)
    apellido = models.CharField(max_length = 20)
    cargo = models.CharField(max_length = 30)
    mail = models.EmailField(primary_key = True)
 
class Entrevista(models.Model):
    alumno = models.ForeignKey('Alumno', on_delete = models.DO_NOTHING)
    empresa = models.ForeignKey('Empresa', on_delete = models.DO_NOTHING)
    fecha = models.DateTimeField()
    resultado = models.TextField(max_length = 1000)
    comentarios_empresa = models.TextField(max_length = 1000)
    comentarios_comision_pps = models.TextField(max_length = 1000)
    class Meta:
    	unique_together = (("alumno", "empresa"),)
 
class Empresa(models.Model):
    nombre = models.CharField(max_length = 50)
    password = models.CharField(max_length = 20)
    descripcion = models.TextField(max_length = 500)
    departamento = models.ForeignKey('Departamento', on_delete = models.CASCADE)
    class Meta:
    	unique_together = (("nombre", "departamento"),)
 
class Puesto(models.Model):
	puesto_id = models.AutoField(primary_key = True)
	empresa = models.ForeignKey('Empresa', on_delete = models.CASCADE)
	nombre = models.CharField(max_length = 50)
	descripcion = models.TextField(max_length = 1000)
	dedicacion = models.PositiveSmallIntegerField()
	horario = models.CharField(max_length = 20)
	remuneracion = models.DecimalField(max_digits=8, decimal_places=2, default = 0)
 
class Postulaciones(models.Model):
    empresa = models.ForeignKey('Empresa', on_delete = models.CASCADE)
    alumno = models.ForeignKey('Alumno', on_delete = models.CASCADE)
    fecha = models.DateTimeField()
    class Meta:
    	unique_together = (("empresa", "alumno"),)

class Departamento(models.Model):
    nombre = models.CharField(max_length = 50, primary_key = True)
    super_usuario = settings.AUTH_USER_MODEL

class DirectorDepartamento(models.Model):
	departamento = models.ForeignKey('Departamento', on_delete = models.CASCADE)
	docente = models.ForeignKey('Docente', on_delete = models.CASCADE)
	class Meta:
		unique_together = (("departamento", "docente"),)
