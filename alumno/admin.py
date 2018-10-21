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
from .models import Postulaciones
from .models import Departamento
from .models import DirectorDepartamento
from .models import Alumno
from .models import User
from django.contrib.auth.admin import UserAdmin
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.forms import UserChangeForm
from .forms import AlumnoFormAdmin

class MyUserChangeForm(UserChangeForm):
    class Meta:
        model = User
        fields = ('username', 'first_name' , 'last_name', )

class MyUserCreateForm(UserCreationForm):
    class Meta:
        model = User
        fields = ('username', 'first_name' , 'last_name', )
    def __init__(self, *args, **kwargs):
        super(MyUserCreateForm, self).__init__(*args, **kwargs)
        self.fields['email'].required = True
        self.fields['first_name'].required = True
        self.fields['last_name'].required = True


class MyUserAdmin(UserAdmin):
    add_form = MyUserCreateForm
    form = MyUserChangeForm
    prepopulated_fields = {'username': ('first_name' , 'last_name', )}

    add_fieldsets = (
        (None, {
            'classes': ('wide',),
            'fields': ('first_name', 'last_name', 'username', 'email', 'password1', 'password2', 'es_alumno', ),
        }),
    )

# Register your models here.
admin.site.register(Carrera)
admin.site.register(Docente)
admin.site.register(Pasantia)
admin.site.register(TutorEmpresa)
admin.site.register(Entrevista)
admin.site.register(Puesto)
admin.site.register(Postulaciones)
admin.site.register(Departamento)
admin.site.register(DirectorDepartamento)
admin.site.register(User, MyUserAdmin)
admin.site.register(Alumno, AlumnoFormAdmin)
admin.site.register(SubcomisionCarrera)
admin.site.register(SubcomisionPasantiasPPS)
admin.site.register(Empresa)