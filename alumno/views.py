from django.views import generic
from django.shortcuts import get_object_or_404
from .models import Alumno, User, SubcomisionCarrera, Docente



class IndexAlumnoView(generic.TemplateView):
	template_name = 'alumno/index.html'

class CreateAlumnoView(generic.CreateView):
	model = Alumno
	fields = ['username', 'password', 'numero_registro', 'first_name', 'last_name', 'email', 'carrera', 'curriculum', 'descripcion_intereses', 'descripcion_habilidades', 'prioridad']
	template_name = 'alumno/create.html'


class EditAlumnoView(generic.UpdateView):
	model = Alumno
	fields = ['email', 'curriculum', 'descripcion_intereses', 'descripcion_habilidades', 'prioridad']
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