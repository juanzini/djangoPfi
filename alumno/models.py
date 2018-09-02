from django.db import models

class Alumno(models.Model):
	numero_registro
	carrera
	mail
	curriculum
	descripcion_intereses
	descripcion_habilidades
	ultima_actualizacion_perfil
	ultima_postulacion
	ultimo_ingreso
	nombre
	apellido
	prioridad
	condicion_acreditacion
	expedicion_acreditacion
	comentarios_comision_carrera
	comentarios_carrera_visibles
	comentarios_comision_pps

class Carrera(models.Model):
    departamento
    nombre
    duracion
    super_usuario

class SubcomisionCarrera(models.Model):
	carrera
	docente

class SubcomisionPasantiasPPS(models.Model):
	departamento
	docente

class Docente(models.Model):
	numero_registro
	nombre
	apellido
	departamento
	mail
	telefono
	box_oficina

class Pasantia(models.Model):
	fecha_inicio
	fecha_fin
	empresa
	alumno
	tutor_docente
	tutor_empresa
	entrevista
	informe
	numero_legajo
	comentarios_empresa
	comentarios_comision_pps

class Entrevista(models.Model):
	alumno
	empresa
	fecha
	resultado
	comentarios_empresa
	comentarios_comision_pps

class Empresa(models.Model):
	nombre
	password
	descripcion
	departamento

class Puesto(models.Model):
	empresa
	nombre
	descripcion
	dedicacion
	horario
	remuneracion

class Postulaciones(models.Model):
	empresa
	alumno
	fecha

class Departamento(models.Model):
	nombre
	super_usuario
	director
	facutlad

class Facultad(model.Model):
	nombre
	decano
	vice_decano