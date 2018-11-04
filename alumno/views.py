from django.contrib.auth.views import redirect_to_login
from django.contrib.auth import login, authenticate
from django.views import generic
from django.shortcuts import get_object_or_404
from .forms import AlumnoUserEditForm, AlumnoEditForm, AlumnoCreateForm, UserCreateForm
from .models import Alumno, User, SubcomisionCarrera, Docente
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
			return HttpResponseRedirect(reverse('index-alumno', args=(), kwargs={'num_reg': (Alumno.objects.get(user=request.user)).numero_registro}))
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
			alumno_form = Alumno(request.POST, instance=user.Alumno)
			alumno_form.full_clean()
			alumno_form.save()
			email = user_form.cleaned_data.get('email')
			raw_password = user_form.cleaned_data.get('password1')
			user = authenticate(email=email, password=raw_password)
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
	template_name = 'alumno/list.html'
	context_object_name = 'alumno_list'

	def get_queryset(self):
		return Alumno.objects.all()

class ListPostulacionesAlumnoView(generic.ListView):
	template_name = 'alumno/list.html'
	context_object_name = 'alumno_list'

	def get_queryset(self):
		return Alumno.objects.all()

class ListPuestosAlumnoView(generic.ListView):
	template_name = 'alumno/list.html'
	context_object_name = 'alumno_list'

	def get_queryset(self):
		return Alumno.objects.all()

class ListContactoAlumnoView(generic.ListView):
	template_name = 'alumno/contacto.html'
	context_object_name = 'docente_list'

	def get_queryset(self):
		carrera = Alumno.objects.get(user=self.request.user.pk).carrera
		return SubcomisionCarrera.objects.get(carrera=carrera).docente.all()