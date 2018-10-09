from django.views import generic
from .models import Alumno


class IndexView(generic.ListView):
	template_name = 'alumno/index.html'
	context_object_name = 'alumnos'

	def get_queryset(self):
		"""Return the last five published questions."""
		return Alumno.objects.order_by('numero_registro')[:5]


class DetailView(generic.DetailView):
	model = Alumno
	template_name = 'alumno/alumno_detail.html'


class BaseView(generic.TemplateView):
	template_name = 'base.html'


class CreateAlumnoView(generic.CreateView):
	model = Alumno
	fields = ['carrera', 'mail', 'curriculum', 'descripcion_intereses', 'descripcion_habilidades', 'nombre', 'apellido', 'prioridad']
	template_name = 'alumno/alumno_create.html'


class ListAlumnoView(generic.ListView):
	template_name = 'alumno/alumno_list.html'
	context_object_name = 'alumno_list'

	def get_queryset(self):
		return Alumno.objects.all()


class DetailAlumnoView(generic.DetailView):
	model = Alumno
	template_name = 'alumno/alumno_detail.html'