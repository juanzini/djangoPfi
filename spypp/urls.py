from django.urls import path, include, reverse
from . import views
from .views import permissions
from .models import User
from django.contrib.auth.decorators import login_required

urlpatterns = [
    path('accounts/', include('django_registration.backends.activation.urls')),
    path('accounts/', include('django.contrib.auth.urls')),
    path('', login_required(views.redirect_view), name='redirect'),
    path('create', views.create_alumno, name='create-alumno'),

    # -------------------ALUMNO--------------------

    path('alumno/detail', login_required(permissions(views.DetailAlumnoView.as_view(), User.AL)), name='detail-alumno'),
    path('alumno/edit', login_required(permissions(views.edit_alumno, User.AL)), name='edit-alumno'),
    path('alumno/entrevistas', login_required(permissions(views.ListEntrevistasAlumnoView.as_view(), User.AL)),
         name='entrevistas-alumno'),
    path('alumno/entrevistas/<int:pk>/', login_required(permissions(views.DetailEntrevistaAlumnoView.as_view(), User.AL)),
         name='entrevista-detail-alumno'),
    path('alumno/entrevistas/cancel', login_required(permissions(views.cancel_entrevistas_alumno_view, User.AL)),
         name='alumno-entrevista-cancel'),
    path('alumno/entrevistas/confirm', login_required(permissions(views.confirm_entrevistas_alumno_view, User.AL)),
         name='alumno-entrevista-confirm'),
    path('alumno/postulaciones', login_required(permissions(views.ListPostulacionesAlumnoView.as_view(), User.AL)),
         name='postulaciones-alumno'),
    path('alumno/empresas', login_required(permissions(views.ListPuestosAlumnoView.as_view(), User.AL)),
         name='empresas-alumno'),
    path('alumno/contacto', login_required(permissions(views.ListContactoAlumnoView.as_view(), User.AL)),
         name='contacto-alumno'),
    path('alumno/empresas/puesto/<int:pk>', login_required(permissions(views.DetailPustoAlumnoView.as_view(), User.AL)),
         name='puesto-detail-alumno'),
    path('alumno/postulaciones/nueva', login_required(permissions(views.create_postulacion_alumno, User.AL)),
         name='postulaciones-create-alumno'),
    path('alumno/postulaciones/eliminar', login_required(permissions(views.delete_postulacion_alumno_view, User.AL)),
         name='postulaciones-delete-alumno'),
    path('alumno/curriculum/<int:pk>', login_required(views.CvDownloadView.as_view()),
         name='descarga-alumno-curriculum'),
    path('alumno/plan-de-estudio/<int:pk>', login_required(views.PlanDeEstudioDownloadView.as_view()),
         name='descarga-alumno-plan-de-estudio'),
    path('alumno/perfil/<int:pk>', login_required(views.PerfilDownloadView.as_view()),
         name='descarga-alumno-perfil'),
    path('alumno/historia-academica/<int:pk>', login_required(views.HistoriaAcademicaDownloadView.as_view()),
         name='descarga-alumno-historia-academica'),

    # -------------------EMPRESA--------------------

    path('empresa/detail', login_required(permissions(views.DetailEmpresaView.as_view(), User.EM)),
         name='detail-empresa'),
    path('empresa/edit', login_required(permissions(views.edit_empresa, User.EM)),
         name='edit-empresa'),
    path('empresa/entrevistas/cancel', login_required(permissions(views.cancel_entrevistas_empresa_view, User.EM)),
         name='empresa-entrevista-cancel'),
    path('empresa/postulaciones', login_required(permissions(views.ListPostulacionesEmpresaView.as_view(), User.EM)),
         name='postulaciones-empresa'),
    path('empresa/puestos', login_required(permissions(views.ListPuestosEmpresaView.as_view(), User.EM)),
         name='puestos-empresa'),
    path('empresa/contacto', login_required(permissions(views.ListContactoEmpresaView.as_view(), User.EM)),
         name='contacto-empresa'),
    path('empresa/postulacion/<int:pk>/', login_required(permissions(views.PostulacionDetailEmpresaView.as_view(), User.EM)),
         name='alumno-detail-empresa'),
    path('empresa/postulacion/desestimar', login_required(permissions(views.delete_postulacion_empresa, User.EM)),
         name='desestimar-postulacion-empresa'),
    path('empresa/entrevista/nueva', login_required(permissions(views.nuevaEntrevista, User.EM)),
         name='nueva-entrevista-empresa'),
    path('empresa/entrevista/regenerar', login_required(permissions(views.nuevaEntrevista, User.EM)),
         name='regenerar-entrevista-empresa'),
    path('empresa/entrevistas', login_required(permissions(views.ListEntrevistasEmpresaView.as_view(), User.EM)),
         name='entrevistas-empresa'),
    path('empresa/entrevistas/<int:pk>/', login_required(permissions(views.DetailEntrevistaEmpresaView.as_view(), User.EM)),
         name='entrevista-detail-empresa'),
    path('empresa/pasantias/', login_required(permissions(views.ListPasantiasEmpresaView.as_view(), User.EM)),
         name='pasantias-empresa'),
    path('empresa/pasantias/<int:pk>/', login_required(permissions(views.DetailPasantiaEmpresaView.as_view(), User.EM)),
         name='pasantias-detail-empresa'),
    path('empresa/tutores/', login_required(permissions(views.ListTutoresEmpresaView.as_view(), User.EM)),
         name='tutores-empresa'),
    path('empresa/tutores/<pk>/', login_required(permissions(views.DetailTutoresEmpresaView.as_view(), User.EM)),
         name='tutores-detail-empresa'),
    path('empresa/tutores/eliminar/<pk>', login_required(permissions(views.delete_tutor_empresa, User.EM)),
         name='eliminar-tutor-empresa'),
    path('empresa/tutores/nuevo', login_required(permissions(views.CreateTutorView.as_view(), User.EM)),
         name='nuevo-tutor-empresa'),
    path('empresa/logo/<int:pk>', login_required(views.LogoDownloadView.as_view()),
         name='descarga-empresa-logo'),
    path('empresa/puestos/nuevo', login_required(permissions(views.CreatePuestoView.as_view(), User.EM)),
         name='nuevo-puesto-empresa'),
    path('empresa/puestos/active/<int:pk>', login_required(permissions(views.active_puesto_empresa, User.EM)),
         name='active-puesto-empresa'),
    path('empresa/puestos/deactive/<int:pk>', login_required(permissions(views.delete_puesto_empresa, User.EM)),
         name='deactive-puesto-empresa'),
    path('empresa/puestos/eliminar/<int:pk>', login_required(permissions(views.delete_puesto_empresa, User.EM)),
         name='eliminar-puesto-empresa'),
    path('empresa/puestos/detalle/<int:pk>', login_required(permissions(views.DetailPuestoEmpresaView.as_view(), User.EM)),
         name='puesto-detail-empresa'),

    # -------------------SUBCOMISION CARRERA--------------------

    path('subcomision_carrera/index', login_required(permissions(views.IndexSubcomisionCarreraView.as_view(), User.CC)),
         name='index-subcomision-carrera'),
    path('subcomision_carrera/edit', login_required(permissions(views.edit_subcomision_carrera, User.CC)),
         name='edit-subcomision-carrera'),
    path('subcomision_carrera/entrevistas',
         login_required(permissions(views.ListEntrevistasSubcomisionCarreraView.as_view(), User.CC)),
         name='entrevistas-subcomision-carrera'),
    path('subcomision_carrera/postulaciones',
         login_required(permissions(views.ListPostulacionesSubcomisionCarreraView.as_view(), User.CC)),
         name='postulaciones-subcomision-carrera'),
    path('subcomision_carrera/alumnos',
         login_required(permissions(views.ListAlumnosSubcomisionCarreraView.as_view(), User.CC)),
         name='alumnos-subcomision-carrera'),
    path('subcomision_carrera/empresas',
         login_required(permissions(views.ListEmpresasSubcomisionCarreraView.as_view(), User.CC)),
         name='empresas-subcomision-carrera'),
    path('subcomision_carrera/puestos',
         login_required(permissions(views.ListPuestosSubcomisionCarreraView.as_view(), User.CC)),
         name='puestos-subcomision-carrera'),
    path('subcomision_carrera/pasantias',
         login_required(permissions(views.ListPasantiasSubcomisionCarreraView.as_view(), User.CC)),
         name='pasantias-subcomision-carrera'),
    path('subcomision_carrera/alumno/<int:numero_registro>/',
         login_required(permissions(views.AlumnoDetailSubcomisionCarreraView.as_view(), User.CC)),
         name='alumno-detail-subcomision-carrera'),
    path('subcomision_carrera/entrevista/<int:pk>/',
         login_required(permissions(views.EntrevistaDetailSubcomisionCarreraView.as_view(), User.CC)),
         name='entrevista-detail-subcomision-carrera'),
    path('subcomision_carrera/pasantia/<int:pk>/',
         login_required(permissions(views.PasantiaDetailSubcomisionCarreraView.as_view(), User.CC)),
         name='pasantia-detail-subcomision-carrera'),
    path('subcomision_carrera/empresas/puesto/<int:pk>', login_required(permissions(views.DetailPustoSubcomisionCarreraView.as_view(), User.CC)),
         name='puesto-detail-subcomision-carrera'),
    path('subcomision_carrera/empresas/<int:pk>', login_required(permissions(views.EmpresaDetailSubcomisionCarreraView.as_view(), User.CC)),
         name='empresa-detail-subcomision-carrera'),

    # -------------------COMISION PASANTIA--------------------

    path('comision_pasantias/edit', login_required(permissions(views.edit_comision_pasantias, User.CP)),
         name='edit-comision-pasantias'),
    path('comision_pasantias/entrevistas',
         login_required(permissions(views.ListEntrevistasComisionPasantiasView.as_view(), User.CP)),
         name='entrevistas-comision-pasantias'),
    path('comision_pasantias/postulaciones',
         login_required(permissions(views.ListPostulacionesComisionPasantiasView.as_view(), User.CP)),
         name='postulaciones-comision-pasantias'),
    path('comision_pasantias/alumnos',
         login_required(permissions(views.ListAlumnosComisionPasantiasView.as_view(), User.CP)),
         name='alumnos-comision-pasantias'),
    path('comision_pasantias/empresas',
         login_required(permissions(views.ListEmpresasComisionPasantiasView.as_view(), User.CP)),
         name='empresas-comision-pasantias'),
    path('comision_pasantias/empresas/nueva',
         login_required(permissions(views.create_empresa, User.CP)),
         name='nueva-empresa-comision-pasantias'),
    path('comision_pasantias/puestos',
         login_required(permissions(views.ListPuestosComisionPasantiasView.as_view(), User.CP)),
         name='puestos-comision-pasantias'),
    path('comision_pasantias/pasantias',
         login_required(permissions(views.ListPasantiasComisionPasantiasView.as_view(), User.CP)),
         name='pasantias-comision-pasantias'),
    path('comision_pasantias/alumno/<int:numero_registro>/',
         login_required(permissions(views.AlumnoDetailComisionPasantiasView.as_view(), User.CP)),
         name='alumno-detail-comision-pasantias'),
    path('comision_pasantias/entrevista/<int:pk>/',
         login_required(permissions(views.EntrevistaDetailComisionPasantiasView.as_view(), User.CP)),
         name='entrevista-detail-comision-pasantias'),
    path('comision_pasantias/pasantias/<int:pk>/',
         login_required(permissions(views.PasantiaDetailComisionPasantiasView.as_view(), User.CP)),
         name='pasantia-detail-comision-pasantias'),
    path('comision_pasantias/pasantias/nueva',
         login_required(permissions(views.CreatePasantiaView.as_view(), User.CP)),
         name='nueva-pasantia-comision-pasantias'),
    path('comision_pasantias/pasantias/eliminar/<int:pk>',
         login_required(permissions(views.delete_pasantia, User.CP)),
         name='eliminar-pasantia-comision-pasantias'),
    path('comision_pasantias/carreras',
         login_required(permissions(views.ListCarrerasComisionPasantiasView.as_view(), User.CP)),
         name='carreras-comision-pasantias'),
    path('comision_pasantias/carreras/<int:pk>/',
         login_required(permissions(views.edit_carrera, User.CP)),
         name='carrera-detail-comision-pasantias'),
    path('comision_pasantias/carreras/nueva/',
         login_required(permissions(views.create_carrera, User.CP)),
         name='nueva-carrera-comision-pasantias'),
    path('comision_pasantias/carreras/eliminar/<int:pk>',
         login_required(permissions(views.delete_carrera, User.CP)),
         name='eliminar-carrera-comision-pasantias'),
    path('comision_pasantias/pasantias/nueva/tutores',
         login_required(permissions(views.AjaxField2View.as_view(), User.CP)),
         name='ajax-get-tutor-empresa'),
    path('comision_pasantias/puestos/<int:pk>', login_required(permissions(views.DetailPustoAlumnoView.as_view(), User.AL)),
         name='puesto-detail-alumno'),

]
