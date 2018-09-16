from django.db import models
from django.contrib.auth.models import AbstractUser
from datetime import date

 
class Alumno(models.Model):
	numero_registro = models.PositiveIntegerField(primary_key = True)
	carrera = models.OneToOneField('Carrera', on_delete = models.DO_NOTHING)
	mail = models.EmailField(unique = True)
	curriculum = models.FileField(upload_to='curriculums/', blank=True, null = True)
	descripcion_intereses = models.TextField(max_length = 500, blank=True, null = True)
	descripcion_habilidades = models.TextField(max_length = 1000, blank=True, null = True)
	ultima_actualizacion_perfil = models.DateField(default = date.today)
	ultima_postulacion = models.DateField(null = True, blank=True)
	ultimo_ingreso = models.DateField(default = date.today)
	primer_ingreso = models.DateField(auto_now_add = True)
	nombre = models.CharField(max_length = 30)
	apellido = models.CharField(max_length = 20)
	prioridad = models.PositiveSmallIntegerField()
	condicion_acreditacion = models.NullBooleanField()
	expedicion_acreditacion = models.TextField(max_length = 500, null = True, blank=True)
	comentarios_comision_carrera = models.TextField(max_length = 1000, null = True, blank=True)
	comentarios_carrera_visibles = models.BooleanField(default = False)
	comentarios_comision_pps = models.TextField(max_length = 1000, null = True, blank=True)
	user = models.OneToOneField('User', on_delete=models.CASCADE, unique = True)
	def __str__(self):
		return str(self.numero_registro)
 
class Carrera(models.Model):
	departamento = models.OneToOneField('Departamento', on_delete = models.CASCADE)
	nombre = models.CharField(max_length = 100,  primary_key = True)
	duracion = models.PositiveSmallIntegerField()
	user = models.OneToOneField('User', on_delete=models.CASCADE, unique = True)
	class Meta:
		unique_together = (("departamento", "nombre"),)
	def __str__(self):
		return self.nombre

class SubcomisionCarrera(models.Model):
	carrera = models.OneToOneField('Carrera', on_delete = models.CASCADE)
	docente = models.OneToOneField('Docente', on_delete = models.CASCADE)
	class Meta:
		unique_together = (("carrera", "docente"),)
	def __str__(self):
		return self.carrera + " - " + self.docente
 
class SubcomisionPasantiasPPS(models.Model):
	departamento = models.OneToOneField('Departamento', on_delete = models.CASCADE)
	docente = models.OneToOneField('Docente', on_delete = models.CASCADE)
	class Meta:
		unique_together = (("departamento", "docente"),)
	def __str__(self):
		return self.departamento + " - " + self.docente
 
class Docente(models.Model):
	numero_registro = models.PositiveIntegerField(primary_key = True)
	nombre = models.CharField(max_length = 30)
	apellido = models.CharField(max_length = 20)
	departamento = models.OneToOneField('Departamento', on_delete = models.DO_NOTHING, null = True)
	mail = models.EmailField(unique = True)
	box_oficina = models.CharField(max_length = 30)
	user = models.OneToOneField('User', on_delete=models.CASCADE, unique = True)
	def __str__(self):
		return self.nombre
 
class Pasantia(models.Model):
	fecha_inicio = models.DateTimeField(auto_now_add = True)
	fecha_fin = models.DateTimeField()
	tutor_docente = models.OneToOneField('Docente', on_delete = models.DO_NOTHING)
	tutor_empresa = models.OneToOneField('TutorEmpresa', on_delete = models.DO_NOTHING)
	entrevista = models.OneToOneField('Entrevista', on_delete = models.DO_NOTHING, primary_key = True)
	informe = models.FileField(upload_to='informes/')
	numero_legajo = models.PositiveIntegerField(unique = True, null=True)
	comentarios_empresa = models.TextField(max_length = 1000)
	comentarios_comision_pps = models.TextField(max_length = 1000)
	def __str__(self):
		return self.entrevista
 
class TutorEmpresa(models.Model):
	empresa = models.OneToOneField('Empresa', on_delete = models.DO_NOTHING)
	nombre = models.CharField(max_length = 30)
	apellido = models.CharField(max_length = 20)
	cargo = models.CharField(max_length = 30)
	mail = models.EmailField(primary_key = True)
	def __str__(self):
		return self.nombre
 
 
class Entrevista(models.Model):
	alumno = models.OneToOneField('Alumno', on_delete = models.DO_NOTHING)
	empresa = models.OneToOneField('Empresa', on_delete = models.DO_NOTHING)
	fecha = models.DateTimeField()
	resultado = models.TextField(max_length = 1000)
	comentarios_empresa = models.TextField(max_length = 1000)
	comentarios_comision_pps = models.TextField(max_length = 1000)
	class Meta:
		unique_together = (("alumno", "empresa"),)
	def __str__(self):
		return self.empresa + " - " + self.alumno
 
class Empresa(models.Model):
	nombre = models.CharField(max_length = 50)
	descripcion = models.TextField(max_length = 500)
	departamento = models.OneToOneField('Departamento', on_delete = models.CASCADE)
	user = models.OneToOneField('User', on_delete=models.CASCADE, unique = True)
	class Meta:
		unique_together = (("nombre", "departamento"),)
	def __str__(self):
		return self.nombre

 
class Puesto(models.Model):
	puesto_id = models.AutoField(primary_key = True)
	empresa = models.OneToOneField('Empresa', on_delete = models.CASCADE)
	nombre = models.CharField(max_length = 50)
	descripcion = models.TextField(max_length = 1000)
	dedicacion = models.PositiveSmallIntegerField()
	horario = models.CharField(max_length = 20)
	remuneracion = models.DecimalField(max_digits=8, decimal_places=2, default = 0)
	def __str__(self):
		return self.nombre
 
class Postulaciones(models.Model):
	empresa = models.OneToOneField('Empresa', on_delete = models.CASCADE)
	alumno = models.OneToOneField('Alumno', on_delete = models.CASCADE)
	fecha = models.DateTimeField()
	class Meta:
		unique_together = (("empresa", "alumno"),)
	def __str__(self):
		return self.carrera + " - " + self.docente

class Departamento(models.Model):
	nombre = models.CharField(max_length = 50, primary_key = True)
	user = models.OneToOneField('User', on_delete=models.CASCADE, unique = True)
	def __str__(self):
		return self.nombre

class DirectorDepartamento(models.Model):
	departamento = models.OneToOneField('Departamento', on_delete = models.CASCADE)
	docente = models.OneToOneField('Docente', on_delete = models.CASCADE)
	class Meta:
		unique_together = (("departamento", "docente"),)
	def __str__(self):
		return self.departamento + " - " + self.docente

class User(AbstractUser):
	es_alumno = models.BooleanField(default=False)
	es_docente = models.BooleanField(default=False)
	es_comision_carrera = models.BooleanField(default=False)
	es_comision_pasantias = models.BooleanField(default=False)
	es_empresa = models.BooleanField(default=False)
