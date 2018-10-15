from django.views import generic
from .models import Alumno, User


class IndexView(generic.ListView):
	template_name = 'alumno/index.html'
	context_object_name = 'alumnos'

	def get_queryset(self):
		"""Return the last five published questions."""
		return Alumno.objects.order_by('numero_registro')[:5]


class BaseView(generic.TemplateView):
	template_name = 'base.html'


class CreateAlumnoView(generic.CreateView):
	model = Alumno
	fields = ['username', 'password', 'numero_registro', 'first_name', 'last_name', 'email', 'carrera', 'curriculum', 'descripcion_intereses', 'descripcion_habilidades', 'prioridad']
	template_name = 'alumno/alumno_create.html'


class EditAlumnoView(generic.UpdateView):
	model = Alumno
	fields = ['email', 'curriculum', 'descripcion_intereses', 'descripcion_habilidades', 'prioridad']
	template_name = 'alumno/alumno_edit.html'
	def get_object(self):
		return Alumno.objects.get(numero_registro=self.kwargs['num_reg'])


class ListAlumnoView(generic.ListView):
	template_name = 'alumno/alumno_list.html'
	context_object_name = 'alumno_list'

	def get_queryset(self):
		return Alumno.objects.all()


class DetailAlumnoView(generic.DetailView):
	model = Alumno
	template_name = 'alumno/alumno_detail.html'
	def get_object(self):
		return Alumno.objects.get(numero_registro=self.kwargs['num_reg'])