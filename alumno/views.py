from django.contrib.auth.views import redirect_to_login
from django.views import generic
from django.shortcuts import get_object_or_404
from .forms import AlumnoUserEditForm, AlumnoEditForm
from .models import Alumno, User, SubcomisionCarrera, Docente
from django.urls import reverse
from django.shortcuts import HttpResponseRedirect
from django.contrib.auth.decorators import login_required
from django.db import transaction
from django.contrib.messages import constants as messages
from django.shortcuts import redirect, render


def redirect_view(request):
	if request.user.is_authenticated:
		if request.user.tipo == User.AL:
			return HttpResponseRedirect('/list')
		if request.user.tipo == User.EM:
			return HttpResponseRedirect(reverse('index-alumno', args=(), kwargs={'num_reg': (Alumno.objects.get(user=request.user)).numero_registro}))
	return redirect_to_login()

class IndexAlumnoView(generic.TemplateView):
	model = Alumno
	context_object_name = 'alumno'
	template_name = 'alumno/index.html'
	def get_object(self):
		return Alumno.objects.get(numero_registro=self.kwargs['num_reg'])

class CreateAlumnoView(generic.CreateView):
	model = Alumno
	fields = ['username', 'password', 'numero_registro', 'first_name', 'last_name', 'email', 'carrera', 'curriculum', 'descripcion_intereses', 'descripcion_habilidades', 'prioridad']
	template_name = 'alumno/create.html'


@login_required
@transaction.atomic
def edit_alumno(request):
	if request.method == 'POST':
		user_form = User(request.POST, instance=request.user)
		alumno_form = Alumno(request.POST, instance=Alumno.objects.get(user=request.user.pk))
		if user_form.is_valid() and alumno_form.is_valid():
			user_form.save()
			alumno_form.save()
			messages.success(request, _('Your profile was successfully updated!'))
			return redirect('settings:profile')
		else:
			messages.error(request, _('Please correct the error below.'))
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
		return Alumno.objects.get(numero_registro=self.kwargs['num_reg'])

class DetailSubcomisionCarreraView(generic.DetailView):
	model = SubcomisionCarrera
	context_object_name = 'subcomisionCarrera'
	template_name = 'subcomisionCarrera/detail.html'
	def get_object(self):
		return SubcomisionCarrera.objects.get(username=self.kwargs['carrera'])

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

	def get_context_data(self, **kwargs):
		context = super(ListContactoAlumnoView, self).get_context_data(**kwargs)
		context['activate'] = "contacto"
		return context

	def get_queryset(self):
		carrera = Alumno.objects.get(numero_registro=self.kwargs['num_reg']).carrera
		return SubcomisionCarrera.objects.get(carrera=carrera).docente.all()