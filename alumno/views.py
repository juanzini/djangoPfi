from django.shortcuts import get_object_or_404, render
from .models import Alumno

def index(request):
	alumnos = Alumno.objects.order_by('numero_registro')[:5]
	context = {
		'alumnos': alumnos,
	}
	return render(request, 'alumno/index.html', context)

def detail(request, num_reg):
	alumno = get_object_or_404(Alumno, pk=num_reg)
	return render(request, 'alumno/detail.html', {'alumno': alumno})