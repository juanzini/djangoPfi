from django.contrib import admin

from .models import Carrera
from .models import SubcomisionCarrera
from .models import SubcomisionPasantiasPPS
from .models import Docente
from .models import Pasantia
from .models import TutorEmpresa
from .models import Entrevista
from .models import Empresa
from .models import Puesto
from .models import Postulacion
from .models import Departamento
from .models import DirectorDepartamento
from .models import Alumno
from .models import User


from .admin_forms import AlumnoFormAdmin
from .admin_forms import MyUserCreateAdmin

# Register your models here.
admin.site.register(Carrera)
admin.site.register(Docente)
admin.site.register(Pasantia)
admin.site.register(TutorEmpresa)
admin.site.register(Entrevista)
admin.site.register(Puesto)
admin.site.register(Postulacion)
admin.site.register(Departamento)
admin.site.register(DirectorDepartamento)
admin.site.register(User, MyUserCreateAdmin)
admin.site.register(Alumno, AlumnoFormAdmin)
admin.site.register(SubcomisionCarrera)
admin.site.register(SubcomisionPasantiasPPS)
admin.site.register(Empresa)