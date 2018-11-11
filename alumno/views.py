from django.contrib.auth.views import redirect_to_login
from django.contrib.auth import login, authenticate
from django.views import generic
from django.core.exceptions import ObjectDoesNotExist
from django.shortcuts import get_object_or_404
from .forms import AlumnoUserEditForm, AlumnoEditForm, AlumnoCreateForm, UserCreateForm
from .forms import EmpresaUserEditForm, EmpresaEditForm
from .models import Alumno, User, SubcomisionCarrera, Entrevista, Postulaciones, Puesto
from .models import Empresa, DirectorDepartamento, SubcomisionPasantiasPPS, Pasantia
from django.urls import reverse
from django.shortcuts import HttpResponseRedirect
from django.db import transaction
from django.contrib import messages
from django.shortcuts import redirect, render
from django.core.exceptions import PermissionDenied


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
			return HttpResponseRedirect(reverse('index-alumno'))
		if request.user.tipo == User.EM:
			return HttpResponseRedirect(reverse('index-empresa'))
		if request.user.tipo == User.CC:
			return HttpResponseRedirect(reverse('detail-subcomisionCarrera'))
	return redirect_to_login(reverse('login'))

class IndexAlumnoView(generic.TemplateView):
	model = Alumno
	template_name = 'alumno/index.html'
	def get_object(self):
		return Alumno.objects.get(user=self.request.user.pk)

class CreateAlumnoView(generic.CreateView):
	model = Alumno
	fields = ['username', 'password', 'numero_registro', 'first_name', 'last_name', 'email', 'carrera', 'curriculum', 'descripcion_intereses', 'descripcion_habilidades', 'prioridad']
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

class EditAlumnoView(generic.UpdateView):
	model = Alumno
	fields = ['user', 'curriculum', 'descripcion_intereses', 'descripcion_habilidades', 'prioridad']
	template_name = 'alumno/edit.html'
	def get_object(self):
		return Alumno.objects.get(numero_registro=self.kwargs['num_reg'])


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

class DetailSubcomisionCarreraView(generic.DetailView):
	model = SubcomisionCarrera
	context_object_name = 'subcomisionCarrera'
	template_name = 'subcomisionCarrera/detail.html'
	def get_object(self):
		return SubcomisionCarrera.objects.get(user=self.request.user.pk)

class ListEntrevistasAlumnoView(generic.ListView):
	template_name = 'alumno/entrevistas.html'
	context_object_name = 'entrevista_list'

	def get_queryset(self):
		return Entrevista.objects.filter(alumno=self.request.user.alumno_user)

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
# --------------------------EMPRESAS--------------------------------------------------------------------------
# ------------------------------------------------------------------------------------------------------------


class IndexEmpresaView(generic.TemplateView):
	model = Empresa
	template_name = 'empresa/index.html'
	def get_object(self):
		return Empresa.objects.get(user=self.request.user.pk)

class DetailEmpresaView(generic.DetailView):
	model = Alumno
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
		return Entrevista.objects.filter(empresa=self.request.user.empresa_user)

class ListPostulacionesEmpresaView(generic.ListView):
	template_name = 'empresa/postulaciones.html'
	context_object_name = 'postulaciones_list'

	def get_queryset(self):
		return Postulaciones.objects.filter(puesto__empresa=self.request.user.empresa_user)

class ListAlumnosEmpresaView(generic.ListView):
	template_name = 'empresa/alumnos.html'
	context_object_name = 'alumnos_list'

	def get_queryset(self):
		pasantias = Pasantia.objects.all()
		if not pasantias:
			return Alumno.objects.all()
		return Alumno.objects.all().exclude(pk__in=pasantias.alumno)

class ListPuestosEmpresaView(generic.ListView):
	template_name = 'empresa/puestos.html'
	context_object_name = 'puestos_list'

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