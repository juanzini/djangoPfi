from django.urls import path, include
from . import views

urlpatterns = [
	path('', views.CreateAlumnoView.as_view(), name='login-prueba'),
    path('accounts/', include('django_registration.backends.activation.urls')),
	path('accounts/', include('django.contrib.auth.urls')),
	path('redirect', views.IndexAlumnoView.as_view(), name='redirect'),
	path('index', views.IndexAlumnoView.as_view(), name='index-alumno'),
	path('create', views.CreateAlumnoView.as_view(), name='create-alumno'),
	path('list', views.ListAlumnoView.as_view(), name='list-alumno'),
	path('detail/<int:num_reg>', views.DetailAlumnoView.as_view(), name='detail-alumno'),
	path('edit/<int:num_reg>', views.EditAlumnoView.as_view(), name='edit-alumno'),
	path('entrevistas/<int:num_reg>', views.ListEntrevistasAlumnoView.as_view(), name='entrevistas-alumno'),
	path('postulaciones/<int:num_reg>', views.ListPostulacionesAlumnoView.as_view(), name='postulaciones-alumno'),
	path('puestos/<int:num_reg>', views.ListPuestosAlumnoView.as_view(), name='puestos-alumno'),
	path('contacto/<int:num_reg>', views.ListContactoAlumnoView.as_view(), name='contacto-alumno'),
	path('subcomision_carrera/detail/<carrera>', views.DetailSubcomisionCarreraView.as_view(), name='detail-subcomisionCarrera'),
]