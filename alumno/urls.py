from django.urls import path, include, reverse
from . import views
from .views import permissions
from .models import User
from django.contrib.auth.decorators import login_required
from django.shortcuts import redirect

urlpatterns = [
    path('accounts/', include('django_registration.backends.activation.urls')),
	path('accounts/', include('django.contrib.auth.urls')),
	path('redirect', login_required(views.redirect_view), name='redirect'),
	path('create', views.create_alumno, name='create-alumno'),
	path('list', views.ListAlumnoView.as_view(), name='list-alumno'),

	# -------------------ALUMNO--------------------

	path('alumno/index', login_required(permissions(views.IndexAlumnoView.as_view(), User.AL)), name='index-alumno'),
	path('alumno/detail', login_required(permissions(views.DetailAlumnoView.as_view(), User.AL)), name='detail-alumno'),
	path('alumno/edit', login_required(permissions(views.edit_alumno, User.AL)), name='edit-alumno'),
	path('alumno/entrevistas', login_required(permissions(views.ListEntrevistasAlumnoView.as_view(), User.AL)),
		 name='entrevistas-alumno'),
	path('alumno/postulaciones', login_required(permissions(views.ListPostulacionesAlumnoView.as_view(), User.AL)),
		 name='postulaciones-alumno'),
	path('alumno/puestos', login_required(permissions(views.ListPuestosAlumnoView.as_view(), User.AL)),
		 name='puestos-alumno'),
	path('alumno/contacto', login_required(permissions(views.ListContactoAlumnoView.as_view(), User.AL)),
		 name='contacto-alumno'),

	# -------------------EMPRESA--------------------

	path('empresa/index', login_required(permissions(views.IndexEmpresaView.as_view(), User.EM)), name='index-empresa'),
	path('empresa/detail', login_required(permissions(views.DetailEmpresaView.as_view(), User.EM)),
		 name='detail-empresa'),
	path('empresa/edit', login_required(permissions(views.edit_empresa, User.EM)), name='edit-empresa'),
	path('empresa/entrevistas', login_required(permissions(views.ListEntrevistasEmpresaView.as_view(), User.EM)),
		 name='entrevistas-empresa'),
	path('empresa/postulaciones', login_required(permissions(views.ListPostulacionesEmpresaView.as_view(), User.EM)),
		 name='postulaciones-empresa'),
	path('empresa/alumnos', login_required(permissions(views.ListAlumnosEmpresaView.as_view(), User.EM)),
		 name='alumnos-empresa'),
	path('empresa/puestos', login_required(permissions(views.ListPuestosEmpresaView.as_view(), User.EM)),
		 name='puestos-empresa'),
	path('empresa/contacto', login_required(permissions(views.ListContactoEmpresaView.as_view(), User.EM)),
		 name='contacto-empresa'),
	path('empresa/alumno/<int:numero_registro>/',
		 login_required(permissions(views.AlumnoDetailEmpresaView.as_view(), User.EM)), name='alumno-detail-empresa'),

	# -------------------SUBCOMISION CARRERA--------------------

	path('subcomision_carrera/index', login_required(permissions(views.IndexSubcomisionCarreraView.as_view(), User.CC)), name='index-subcomision-carrera'),
	path('subcomision_carrera/detail', login_required(permissions(views.DetailSubcomisionCarreraView.as_view(), User.CC)),
		 name='detail-subcomision-carrera'),
	path('subcomision_carrera/edit', login_required(permissions(views.edit_subcomision_carrera, User.CC)), name='edit-subcomision-carrera'),
	path('subcomision_carrera/entrevistas', login_required(permissions(views.ListEntrevistasSubcomisionCarreraView.as_view(), User.CC)),
		 name='entrevistas-subcomision-carrera'),
	path('subcomision_carrera/postulaciones', login_required(permissions(views.ListPostulacionesSubcomisionCarreraView.as_view(), User.CC)),
		 name='postulaciones-subcomision-carrera'),
	path('subcomision_carrera/alumnos', login_required(permissions(views.ListAlumnosSubcomisionCarreraView.as_view(), User.CC)),
		 name='alumnos-subcomision-carrera'),
	path('subcomision_carrera/empresas', login_required(permissions(views.ListEmpresasSubcomisionCarreraView.as_view(), User.CC)),
		 name='empresas-subcomision-carrera'),
	path('subcomision_carrera/puestos', login_required(permissions(views.ListPuestosSubcomisionCarreraView.as_view(), User.CC)),
		 name='puestos-subcomision-carrera'),
	path('subcomision_carrera/alumno/<int:numero_registro>/',
		 login_required(permissions(views.AlumnoDetailSubcomisionCarreraView.as_view(), User.CC)), name='alumno-detail-subcomision-carrera'),
]