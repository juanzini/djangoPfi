from django.contrib.auth.views import redirect_to_login
from django.contrib.auth import login, authenticate
from django.views import generic
from datetime import datetime
from django.core.exceptions import ObjectDoesNotExist
from .forms import AlumnoUserEditForm, AlumnoEditForm, AlumnoCreateForm, UserCreateForm
from .forms import EmpresaUserEditForm, EmpresaEditForm, SubcomisionCarreraEditForm, SubcomisionCarreraUserEditForm
from .forms import AlumnoDetailSubcomisionCarreraForm, EntrevistaDetailSubcomisionCarreraForm, PasantiaDetailSubcomisionCarreraForm
from .models import Alumno, User, SubcomisionCarrera, Entrevista, Postulaciones, Puesto
from .models import Empresa, DirectorDepartamento, SubcomisionPasantiasPPS, Pasantia
from django.urls import reverse
from django.shortcuts import HttpResponseRedirect
from django.db import transaction
from django.contrib import messages
from django.shortcuts import redirect, render
from django.core.exceptions import PermissionDenied
from django.db.models import Q

def permissions(function, typeUser):
    def wrapper(request, *args, **kw):
        user=request.user
        if not (user.id and user.tipo == typeUser):
            raise PermissionDenied
        else:
            return function(request, *args, **kw)

    return wrapper

def redirect_view(request):
	if request.user.is_authenticated:
		if request.user.tipo == User.AL:
			return HttpResponseRedirect(reverse('edit-alumno'))
		if request.user.tipo == User.EM:
			return HttpResponseRedirect(reverse('index-empresa'))
		if request.user.tipo == User.CC:
			return HttpResponseRedirect(reverse('edit-subcomision-carrera'))
	return redirect_to_login(reverse('login'))

class IndexAlumnoView(generic.TemplateView):
	model = Alumno
	template_name = 'alumno/index.html'
	def get_object(self):
		return Alumno.objects.get(user=self.request.user.pk)

class CreateAlumnoView(generic.CreateView):
	model = Alumno
	fields = ['username', 'password', 'numero_registro', 'first_name', 'last_name', 'email', 'carrera', 'curriculum', 'descripcion_intereses', 'descripcion_habilidades']
	template_name = 'alumno/create.html'

@transaction.atomic
def create_alumno(request):
	if request.method == 'POST':
		user_form = UserCreateForm(request.POST)
		alumno_form = AlumnoCreateForm(request.POST)
		if user_form.is_valid() and alumno_form.is_valid():
			user = user_form.save()
			user.refresh_from_db()
			alumno_form = Alumno(request.POST, instance=user.alumno)
			alumno_form.full_clean()
			alumno_form.save()
			username = user_form.cleaned_data.get('username')
			raw_password = user_form.cleaned_data.get('password1')
			user = authenticate(username=username, password=raw_password)
			login(request, user)
			return redirect('redirect')
	else:
		user_form = UserCreateForm()
		alumno_form = AlumnoCreateForm()
	return render(request, 'alumno/create.html', {
			'user_form': user_form,
			'alumno_form': alumno_form,
		})

@transaction.atomic
def edit_alumno(request):
	if request.method == 'POST':
		user_form = AlumnoUserEditForm(request.POST, instance=request.user)
		alumno_form = AlumnoEditForm(request.POST, instance=Alumno.objects.get(user=request.user.pk))
		if user_form.is_valid() and alumno_form.is_valid():
			user_form.save()
			alumno_form.save()
			alumno = Alumno.objects.get(user=request.user.pk)
			alumno.ultima_actualizacion_perfil = datetime.now()
			alumno.save()
			messages.success(request, ('Su perfil fue correctamente actualizado!'))
			return redirect('edit-alumno')
		else:
			messages.error(request, ('El formulario contiene algunos errores'))
	else:
		user_form = AlumnoUserEditForm(instance=request.user)
		alumno_form = AlumnoEditForm(instance=Alumno.objects.get(user=request.user.pk))
	return render(request, 'alumno/edit.html', {
		'user_form': user_form,
		'alumno_form': alumno_form,
	})

@transaction.atomic
def edit_ultima_actualizacion(request, middleware):
	if request.method == 'POST' and not middleware:
		user_form = AlumnoUserEditForm(request.POST, instance=request.user)
		alumno_form = AlumnoEditForm(request.POST, instance=Alumno.objects.get(user=request.user.pk))
		if user_form.is_valid() and alumno_form.is_valid():
			user_form.save()
			alumno_form.save()
			alumno = Alumno.objects.get(user=request.user.pk)
			alumno.ultima_actualizacion_perfil = datetime.now()
			alumno.save()
			messages.success(request, ('Su perfil fue correctamente actualizado!'))
			return redirect('edit-alumno')
		else:
			messages.error(request, ('El formulario contiene algunos errores'))
	else:
		if 'logout' not in request.build_absolute_uri():
			user_form = AlumnoUserEditForm(instance=request.user)
			alumno_form = AlumnoEditForm(instance=Alumno.objects.get(user=request.user.pk))
		else:
			return None
	return render(request, 'alumno/edit_obligado.html', {
		'user_form': user_form,
		'alumno_form': alumno_form,
	})


class ListAlumnoView(generic.ListView):
	template_name = 'alumno/list.html'
	context_object_name = 'alumno_list'

	def get_queryset(self):
		return Alumno.objects.all()


class DetailAlumnoView(generic.DetailView):
	model = Alumno
	context_object_name = 'alumno'
	template_name = 'alumno/detail.html'
	def get_object(self):
		return Alumno.objects.get(user=self.request.user.pk)

class ListEntrevistasAlumnoView(generic.ListView):
	template_name = 'alumno/entrevistas.html'
	context_object_name = 'entrevista_list'

	def get_queryset(self):
		return Entrevista.objects.filter(Q(alumno=self.request.user.alumno_user) & (~Q(alumno__condicion_acreditacion=None)))

class ListPostulacionesAlumnoView(generic.ListView):
	template_name = 'alumno/postulaciones.html'
	context_object_name = 'postulaciones_list'

	def get_queryset(self):
		return Postulaciones.objects.filter(alumno=self.request.user.alumno_user)

class ListPuestosAlumnoView(generic.ListView):
	template_name = 'alumno/puestos.html'
	context_object_name = 'puesto_list'

	def get_queryset(self):
		return Puesto.objects.all()

class ListContactoAlumnoView(generic.ListView):
	template_name = 'alumno/contacto.html'
	context_object_name = 'docente_list'

	def get_queryset(self):
		carrera = Alumno.objects.get(user=self.request.user.pk).carrera
		try:
			subcomision = SubcomisionCarrera.objects.get(carrera=carrera)
		except ObjectDoesNotExist:
			return None
		return subcomision.docente.all()

# ------------------------------------------------------------------------------------------------------------
# --------------------------EMPRESA---------------------------------------------------------------------------
# ------------------------------------------------------------------------------------------------------------


class IndexEmpresaView(generic.TemplateView):
	model = Empresa
	template_name = 'empresa/index.html'
	def get_object(self):
		return Empresa.objects.get(user=self.request.user.pk)

class DetailEmpresaView(generic.DetailView):
	model = Empresa
	context_object_name = 'empresa'
	template_name = 'empresa/detail.html'
	def get_object(self):
		return Empresa.objects.get(user=self.request.user.pk)

@transaction.atomic
def edit_empresa(request):
	if request.method == 'POST':
		user_form = EmpresaUserEditForm(request.POST, instance=request.user)
		empresa_form = EmpresaEditForm(request.POST, instance=Empresa.objects.get(user=request.user.pk))
		if user_form.is_valid() and empresa_form.is_valid():
			user_form.save()
			empresa_form.save()
			messages.success(request, ('Su perfil fue correctamente actualizado!'))
			return redirect('edit-empresa')
		else:
			messages.error(request, ('El formulario contiene algunos errores'))
	else:
		user_form = EmpresaUserEditForm(instance=request.user)
		empresa_form = EmpresaEditForm(instance=Empresa.objects.get(user=request.user.pk))
	return render(request, 'empresa/edit.html', {
		'user_form': user_form,
		'empresa_form': empresa_form,
	})

class ListEntrevistasEmpresaView(generic.ListView):
	template_name = 'empresa/entrevistas.html'
	context_object_name = 'entrevista_list'

	def get_queryset(self):
		return Entrevista.objects.filter(Q(empresa=self.request.user.empresa_user) & (~Q(alumno__condicion_acreditacion=None)))

def cancelEntrevistasEmpresaView(request):
	entrevista = Entrevista.objects.get(pk=request.GET.get('entrevista_id'),empresa=request.user.empresa_user)
	entrevista.cancelada_empresa=True
	entrevista.save()
	return HttpResponseRedirect(request.META['HTTP_REFERER'])

class ListPostulacionesEmpresaView(generic.ListView):
	template_name = 'empresa/postulaciones.html'
	context_object_name = 'postulacion_list'

	def get_queryset(self):
		return Postulaciones.objects.filter(Q(puesto__empresa=self.request.user.empresa_user) & (~Q(alumno__condicion_acreditacion=None)))

class ListAlumnosEmpresaView(generic.ListView):
	template_name = 'empresa/alumnos.html'
	context_object_name = 'alumno_list'

	def get_queryset(self):
		pasantias = Pasantia.objects.all()
		if not pasantias:
			return Alumno.objects.all()
		return Alumno.objects.all().exclude(pk__in=pasantias.alumno)

class ListPuestosEmpresaView(generic.ListView):
	template_name = 'empresa/puestos.html'
	context_object_name = 'puesto_list'

	def get_queryset(self):
		return Puesto.objects.filter(empresa=self.request.user.empresa_user)

class ListContactoEmpresaView(generic.ListView):
	template_name = 'empresa/contacto.html'
	context_object_name = 'contactos'

	def get_queryset(self):
		contactos = []
		empresa = Empresa.objects.get(user=self.request.user.pk)
		try:
			director = DirectorDepartamento.objects.get(departamento=empresa.departamento)
			contactos.append(director.docente)
		except ObjectDoesNotExist:
			None
		try:
			comisionesCarrera = SubcomisionCarrera.objects.filter(carrera__departamento=(empresa.departamento))
			contactos = contactos.__add__(list(comisionesCarrera))
		except ObjectDoesNotExist:
			None
		try:
			comisionPasantias = SubcomisionPasantiasPPS.objects.filter(departamento=(empresa.departamento))
			contactos = contactos.__add__(list(comisionPasantias))
		except ObjectDoesNotExist:
			None
		if not contactos:
			return None
		return contactos


class AlumnoDetailEmpresaView(generic.DetailView):
	model = Alumno
	context_object_name = 'alumno'
	template_name = 'empresa/alumno_detail.html'
	def get_object(self):
		return Alumno.objects.get(numero_registro=self.kwargs["numero_registro"])



# ------------------------------------------------------------------------------------------------------------
# --------------------------SUBCOMISION-CARRERA---------------------------------------------------------------
# ------------------------------------------------------------------------------------------------------------



class IndexSubcomisionCarreraView(generic.TemplateView):
	model = SubcomisionCarrera
	template_name = 'subcomision_carrera/index.html'
	def get_object(self):
		return SubcomisionCarrera.objects.get(user=self.request.user.pk)

@transaction.atomic
def edit_subcomision_carrera(request):
	if request.method == 'POST':
		user_form = SubcomisionCarreraUserEditForm(request.POST, instance=request.user)
		subcomision_carrera_form = SubcomisionCarreraEditForm(request.POST, instance=SubcomisionCarrera.objects.get(user=request.user.pk))
		if user_form.is_valid() and subcomision_carrera_form.is_valid():
			user_form.save()
			subcomision_carrera_form.save()
			messages.success(request, ('Su perfil fue correctamente actualizado!'))
			return redirect('edit-subcomision-carrera')
		else:
			messages.error(request, ('El formulario contiene algunos errores'))
	else:
		user_form = SubcomisionCarreraUserEditForm(instance=request.user)
		subcomision_carrera_form = SubcomisionCarreraEditForm(instance=SubcomisionCarrera.objects.get(user=request.user.pk))
	return render(request, 'subcomision_carrera/edit.html', {
		'user_form': user_form,
		'subcomision_carrera_form': subcomision_carrera_form,
	})

class ListEntrevistasSubcomisionCarreraView(generic.ListView):
	def get_queryset(self):
		try:
			entrevistas = Entrevista.objects.filter(alumno__carrera=self.request.user.carrera_user.carrera)
		except ObjectDoesNotExist:
			return None
		for entrevista in entrevistas:
			try:
				pasantia = Pasantia.objects.get(entrevista=entrevista)
			except ObjectDoesNotExist:
				return None
			entrevista.pasantia = pasantia
		return entrevistas

	def get_pasantia(self):
		try:
			pasantias = Pasantia.objects.get(entrevista__in=self.get_queryset)
		except ObjectDoesNotExist:
			return None
		return pasantias

	template_name = 'subcomision_carrera/entrevistas.html'
	context_object_name = 'entrevista_list'
	extra_context = {'pasantias': get_pasantia}

class ListPostulacionesSubcomisionCarreraView(generic.ListView):
	template_name = 'subcomision_carrera/postulaciones.html'
	context_object_name = 'postulacion_list'

	def get_queryset(self):
		return Postulaciones.objects.filter(alumno__carrera=self.request.user.carrera_user.carrera)

class ListAlumnosSubcomisionCarreraView(generic.ListView):
	template_name = 'subcomision_carrera/alumnos.html'
	context_object_name = 'alumno_list'

	def get_queryset(self):
		return Alumno.objects.filter(carrera=self.request.user.carrera_user.carrera)

class ListEmpresasSubcomisionCarreraView(generic.ListView):
	template_name = 'subcomision_carrera/empresas.html'
	context_object_name = 'empresa_list'

	def get_queryset(self):
		return Empresa.objects.filter(departamento=(self.request.user.carrera_user.carrera).departamento)

class ListPuestosSubcomisionCarreraView(generic.ListView):
	template_name = 'subcomision_carrera/puestos.html'
	context_object_name = 'puesto_list'

	def get_queryset(self):
		return Puesto.objects.filter(empresa__departamento=(self.request.user.carrera_user.carrera).departamento)

class ListPasantiasSubcomisionCarreraView(generic.ListView):
	template_name = 'subcomision_carrera/pasantias.html'
	context_object_name = 'pasantia_list'

	def get_queryset(self):
		return Pasantia.objects.filter(entrevista__alumno__carrera=(self.request.user.carrera_user.carrera))


class AlumnoDetailSubcomisionCarreraView(generic.UpdateView):
	model = Alumno
	template_name = 'subcomision_carrera/alumno_detail.html'
	form_class = AlumnoDetailSubcomisionCarreraForm
	success_url = '../../alumnos'

	def get_object(self):
		return Alumno.objects.get(numero_registro=self.kwargs["numero_registro"])


class EntrevistaDetailSubcomisionCarreraView(generic.UpdateView):
	model = Entrevista
	template_name = 'subcomision_carrera/entrevista_detail.html'
	form_class = EntrevistaDetailSubcomisionCarreraForm
	success_url = '../../entrevistas'

class PasantiaDetailSubcomisionCarreraView(generic.UpdateView):
	model = Entrevista
	template_name = 'subcomision_carrera/pasantia_detail.html'
	form_class = PasantiaDetailSubcomisionCarreraForm

	def get_object(self):
		return Pasantia.objects.get(pk=self.kwargs["pk"])

	def get_success_url(self):
		return self.request.GET.get('next', '../../pasantias')