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
	path('alumno/index', login_required(permissions(views.IndexAlumnoView.as_view(), User.AL)), name='index-alumno'),
	path('alumno/detail', login_required(permissions(views.DetailAlumnoView.as_view(), User.AL)), name='detail-alumno'),
	path('alumno/edit', login_required(permissions(views.edit_alumno, User.AL)), name='edit-alumno'),
	path('alumno/entrevistas', login_required(permissions(views.ListEntrevistasAlumnoView.as_view(), User.AL)), name='entrevistas-alumno'),
	path('alumno/postulaciones', login_required(permissions(views.ListPostulacionesAlumnoView.as_view(), User.AL)), name='postulaciones-alumno'),
	path('alumno/puestos', login_required(permissions(views.ListPuestosAlumnoView.as_view(), User.AL)), name='puestos-alumno'),
	path('alumno/contacto', login_required(permissions(views.ListContactoAlumnoView.as_view(), User.AL)), name='contacto-alumno'),
	path('subcomision_carrera/detail', views.DetailSubcomisionCarreraView.as_view(), name='detail-subcomisionCarrera'),
]