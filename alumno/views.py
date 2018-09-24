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