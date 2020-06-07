from django.contrib.auth.views import redirect_to_login
from django.views import generic
from datetime import datetime, date, timedelta
from django import forms
from django.core import serializers
from django.core.exceptions import ObjectDoesNotExist
from django_registration.backends.activation.views import RegistrationView
from django.core.mail import EmailMessage
from django.template.loader import render_to_string
from smtplib import SMTPRecipientsRefused, SMTPSenderRefused
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from datetime import timedelta as td

from .forms import UserEditForm, AlumnoEditForm, AlumnoCreateForm, UserCreateForm
from .forms import EmpresaUserEditForm, EmpresaEditForm, SubcomisionCarreraEditForm, SubcomisionCarreraUserEditForm
from .forms import AlumnoDetailSubcomisionCarreraForm, EntrevistaDetailSubcomisionCarreraForm, \
    PasantiaDetailSubcomisionCarreraForm, SubcomisionCarreraCreateForm
from .forms import EntrevistaCreateForm, EntrevistaExistenteCreateForm, EntrevistaDetailEmpresaForm, \
    PasantiaDetailEmpresaForm, TutorEmpresaDetailEmpresaForm
from .forms import SubcomisionPasantiasForm, SubcomisionPasantiasUserEditForm, AlumnoDetailComisionPasantiasForm
from .forms import EntrevistaDetailComisionPasantiasForm, PasantiaDetailComisionPasantiasForm, PasantiaCreateForm
from .forms import EntrevistaDetailAlumnoForm, EmpresaDetailSubcomisionCarreraForm, CarreraCreateComisionPasantiasForm
from .forms import EmpresaCreateComisionPasantiasForm, UserWithoutNameCreateForm
from .models import Alumno, User, SubcomisionCarrera, Entrevista, Postulacion, Puesto, Docente
from .models import Empresa, DirectorDepartamento, SubcomisionPasantiasPPS, Pasantia, TutorEmpresa, Carrera
from django.urls import reverse
from django.shortcuts import HttpResponseRedirect, get_object_or_404, HttpResponse
from django.db import transaction
from django.contrib import messages
from django.shortcuts import redirect, render
from django.core.exceptions import PermissionDenied
from django.db.models import Q, F
from private_storage.views import PrivateStorageDetailView
from django.db.models import Case, When, Value, IntegerField


class CvDownloadView(PrivateStorageDetailView):
    model = Alumno
    model_file_field = 'curriculum'
    content_disposition = 'inline'

    def get_content_disposition_filename(self, private_file):
        return 'curriculum_' + str(self.request.user.first_name) + '_' + str(self.request.user.last_name)

    def get_queryset(self):
        # Make sure only certain objects can be accessed.
        if self.request.user.tipo == User.EM:
            postulaciones = Postulacion.objects.filter(puesto__empresa=self.request.user.empresa_user,
                                                       alumno__pk=self.kwargs["pk"])
            ids = set(postulacion.alumno.id for postulacion in postulaciones)
            return super().get_queryset().filter(pk__in=ids)
        if self.request.user.tipo == User.CC:
            postulaciones = Postulacion.objects.filter(alumno__carrera=self.request.user.carrera_user.carrera,
                                                       alumno__pk=self.kwargs["pk"])
            ids = set(postulacion.alumno.id for postulacion in postulaciones)
            return super().get_queryset().filter(pk__in=ids)
        return super().get_queryset().filter()

    def can_access_file(self, private_file):
        if self.request.user.tipo == User.AL and private_file.relative_name == self.request.user.alumno_user.curriculum.name:
            return True
        if self.request.user.is_superuser:
            return True
        if self.request.user.is_staff:
            return True
        if self.request.user.tipo == User.EM or self.request.user.tipo == User.CC or self.request.user.tipo == User.CP:
            return True
        return False


class LogoDownloadView(PrivateStorageDetailView):
    model = Empresa
    model_file_field = 'logo'
    content_disposition = 'inline'

    def get_content_disposition_filename(self, private_file):
        return 'logo_' + str(self.request.user.first_name) + '_' + str(self.request.user.last_name)

    def get_queryset(self):
        # Make sure only certain objects can be accessed.
        return super().get_queryset().filter()

    def can_access_file(self, private_file):
        return True


class PlanDeEstudioDownloadView(PrivateStorageDetailView):
    model = Alumno
    model_file_field = 'plan_de_estudio'
    content_disposition = 'inline'

    def get_content_disposition_filename(self, private_file):
        return 'plan_' + str(self.request.user.first_name) + '_' + str(self.request.user.last_name)

    def get_queryset(self):
        # Make sure only certain objects can be accessed.
        if self.request.user.tipo == User.EM:
            postulaciones = Postulacion.objects.filter(puesto__empresa=self.request.user.empresa_user,
                                                       alumno__pk=self.kwargs["pk"])
            ids = set(postulacion.alumno.id for postulacion in postulaciones)
            return super().get_queryset().filter(pk__in=ids)
        if self.request.user.tipo == User.CC:
            postulaciones = Postulacion.objects.filter(alumno__carrera=self.request.user.carrera_user.carrera,
                                                       alumno__pk=self.kwargs["pk"])
            ids = set(postulacion.alumno.id for postulacion in postulaciones)
            return super().get_queryset().filter(pk__in=ids)
        return super().get_queryset().filter()

    def can_access_file(self, private_file):
        if self.request.user.tipo == User.AL and private_file.relative_name == self.request.user.alumno_user.plan_de_estudio.name:
            return True
        if self.request.user.is_superuser:
            return True
        if self.request.user.is_staff:
            return True
        if (self.request.user.tipo == User.EM and Postulacion.objects.filter(
                puesto__empresa=self.request.user.empresa_user, alumno__pk=self.kwargs["pk"])) or self.request.user.tipo == User.CC or self.request.user.tipo == User.CP:
            return True
        return False


class PerfilDownloadView(PrivateStorageDetailView):
    model = Alumno
    model_file_field = 'perfil'
    content_disposition = 'inline'

    def get_content_disposition_filename(self, private_file):
        return 'perfil_' + str(self.request.user.first_name) + '_' + str(self.request.user.last_name)

    def get_queryset(self):
        # Make sure only certain objects can be accessed.
        if self.request.user.tipo == User.EM:
            postulaciones = Postulacion.objects.filter(puesto__empresa=self.request.user.empresa_user,
                                                       alumno__pk=self.kwargs["pk"])
            ids = set(postulacion.alumno.id for postulacion in postulaciones)
            return super().get_queryset().filter(pk__in=ids)
        if self.request.user.tipo == User.CC:
            postulaciones = Postulacion.objects.filter(alumno__carrera=self.request.user.carrera_user.carrera,
                                                       alumno__pk=self.kwargs["pk"])
            ids = set(postulacion.alumno.id for postulacion in postulaciones)
            return super().get_queryset().filter(pk__in=ids)
        return super().get_queryset().filter()

    def can_access_file(self, private_file):
        if self.request.user.tipo == User.AL and private_file.relative_name == self.request.user.alumno_user.perfil.name:
            return True
        if self.request.user.is_superuser:
            return True
        if self.request.user.is_staff:
            return True
        if (self.request.user.tipo == User.EM and Postulacion.objects.filter(
                puesto__empresa=self.request.user.empresa_user, alumno__pk=self.kwargs[
                    "pk"])) or self.request.user.tipo == User.CC or self.request.user.tipo == User.CP:
            return True
        return False


class HistoriaAcademicaDownloadView(PrivateStorageDetailView):
    model = Alumno
    model_file_field = 'historia_academica'
    content_disposition = 'inline'

    def get_content_disposition_filename(self, private_file):
        return 'historia_' + str(self.request.user.first_name) + '_' + str(self.request.user.last_name)

    def get_queryset(self):
        # Make sure only certain objects can be accessed.
        if self.request.user.tipo == User.EM:
            postulaciones = Postulacion.objects.filter(puesto__empresa=self.request.user.empresa_user,
                                                       alumno__pk=self.kwargs["pk"])
            ids = set(postulacion.alumno.id for postulacion in postulaciones)
            return super().get_queryset().filter(pk__in=ids)
        return super().get_queryset().filter()

    def can_access_file(self, private_file):
        if self.request.user.tipo == User.AL and private_file.relative_name == self.request.user.alumno_user.perfil.name:
            return True
        if self.request.user.is_superuser:
            return True
        if self.request.user.is_staff:
            return True
        if (self.request.user.tipo == User.EM and Postulacion.objects.filter(
                puesto__empresa=self.request.user.empresa_user, alumno__pk=self.kwargs[
                    "pk"])) or self.request.user.tipo == User.CC or self.request.user.tipo == User.CP:
            return True
        return False


def permissions(function, typeUser):
    def wrapper(request, *args, **kw):
        user = request.user
        if not (user.id and user.tipo == typeUser):
            raise PermissionDenied
        else:
            return function(request, *args, **kw)

    return wrapper


def redirect_view(request):
    if request.user.is_authenticated:
        if request.user.is_superuser:
            return HttpResponseRedirect('/admin')
        if request.user.tipo == User.AL:
            return HttpResponseRedirect(reverse('edit-alumno'))
        if request.user.tipo == User.EM:
            return HttpResponseRedirect(reverse('postulaciones-empresa'))
        if request.user.tipo == User.CC:
            return HttpResponseRedirect(reverse('edit-subcomision-carrera'))
        if request.user.tipo == User.CP:
            return HttpResponseRedirect(reverse('edit-comision-pasantias'))
    return redirect_to_login(reverse('login'))


class IndexAlumnoView(generic.TemplateView):
    model = Alumno
    template_name = 'alumno/index.html'

    def get_object(self):
        return Alumno.objects.get(user=self.request.user.pk)


class CreateAlumnoView(generic.CreateView):
    model = Alumno
    fields = ['username', 'password', 'numero_registro', 'first_name', 'last_name', 'email', 'carrera', 'curriculum',
              'descripcion_intereses', 'descripcion_habilidades']
    template_name = 'alumno/create.html'


@transaction.atomic
def create_alumno(request):
    if request.method == 'POST':
        user_form = UserCreateForm(request.POST)
        alumno_form = AlumnoCreateForm(request.POST, request.FILES)
        if user_form.is_valid() and alumno_form.is_valid():
            try:
                success_redirect = RegistrationView.as_view(form_class=UserCreateForm)(request)
            except (SMTPRecipientsRefused, SMTPSenderRefused):
                success_redirect = reverse('django_registration_complete')
                pass
            alumno = alumno_form.save(commit=False)
            alumno.user = User.objects.get(username=user_form.instance.username)
            alumno.save()
            return success_redirect
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
        user_form = UserEditForm(request.POST, instance=request.user)
        alumno_form = AlumnoEditForm(request.POST, request.FILES, instance=Alumno.objects.get(user=request.user.pk))
        if user_form.is_valid() and alumno_form.is_valid():
            try:
                User.objects.get(Q(email=request.user.email) & (~Q(username=request.user.username)))
                user_form.add_error('email', forms.ValidationError("Ya hay un usuario registrado con este email."))
                user_form.has_error('email', forms.ValidationError("Ya hay un usuario registrado con este email."))
                return render(request, 'alumno/create.html', {
                    'user_form': user_form,
                    'alumno_form': alumno_form,
                })
            except ObjectDoesNotExist:
                user_form.save()
                alumno_form.save()
                alumno = Alumno.objects.get(user=request.user.pk)
                alumno.ultima_actualizacion_perfil = datetime.now()
                alumno.save()
                messages.success(request, ('Su perfil fue correctamente actualizado!'))
                return redirect('edit-alumno')
        else:
            messages.error(request, ('El formulario contiene algunos errores'))
    else:
        user_form = UserEditForm(instance=request.user)
        alumno_form = AlumnoEditForm(instance=Alumno.objects.get(user=request.user.pk))
    return render(request, 'alumno/edit.html', {
        'user_form': user_form,
        'alumno_form': alumno_form,
    })


@transaction.atomic
def edit_ultima_actualizacion(request, middleware):
    if request.method == 'POST' and not middleware:
        user_form = UserEditForm(request.POST, instance=request.user)
        alumno_form = AlumnoEditForm(request.POST, request.FILES, instance=Alumno.objects.get(user=request.user.pk))
        if user_form.is_valid() and alumno_form.is_valid():
            user_form.save()
            alumno_form.save()
            alumno = Alumno.objects.get(user=request.user.pk)
            alumno.ultima_actualizacion_perfil = datetime.now()
            alumno.save()
            messages.success(request, ('Su perfil fue correctamente actualizado!'))
            return redirect('edit-alumno')
        else:
            messages.error(request, ('El formulario contiene algunos errores'))
    else:
        if 'logout' not in request.build_absolute_uri():
            user_form = UserEditForm(instance=request.user)
            alumno_form = AlumnoEditForm(instance=Alumno.objects.get(user=request.user.pk))
        else:
            return None
    return render(request, 'alumno/edit_obligado.html', {
        'user_form': user_form,
        'alumno_form': alumno_form,
    })


class DetailAlumnoView(generic.DetailView):
    model = Alumno
    context_object_name = 'alumno'
    template_name = 'alumno/detail.html'

    def get_object(self):
        return Alumno.objects.get(user=self.request.user.pk)


class DetailPustoAlumnoView(generic.TemplateView):
    template_name = 'alumno/puesto_detail.html'
    context_object_name = 'puesto'

    def get_context_data(self, **kwargs):
        context = super(DetailPustoAlumnoView, self).get_context_data(**kwargs)
        context['puesto'] = Puesto.objects.get(pk=self.kwargs["pk"],empresa__departamento=self.request.user.alumno_user.carrera.departamento)
        try:
            context['postulacion'] = Postulacion.objects.get(puesto=context['puesto'],
                                                             alumno=self.request.user.alumno_user)
            context['is_available'] = context['postulacion'].fecha_desestimacion is None or context['postulacion'].fecha_desestimacion < (datetime.now().date() - timedelta(days=60))
            if not context['is_available']:
                context['next_day'] = context['postulacion'].fecha_desestimacion + timedelta(days=60)
            if not context['postulacion'].activa:
                context['postulacion'] = None
        except ObjectDoesNotExist:
            context['postulacion'] = None
            context['is_available'] = True
        return context


@transaction.atomic
def create_postulacion_alumno(request):
    if request.method == 'POST':
        try:
            nuevaPostulacion = False
            postulacion = Postulacion.objects.get(puesto=request.POST.get('puesto_id'), alumno=request.user.alumno_user)
            if postulacion.fecha_desestimacion is None or postulacion.fecha_desestimacion < (datetime.now().date() - timedelta(days=60)):
                postulacion.activa = True
                postulacion.save()
                nuevaPostulacion = True
        except ObjectDoesNotExist:
            puesto = Puesto.objects.get(pk=request.POST.get('puesto_id'))
            if not puesto.empresa.activa :
                postulacion = Postulacion.objects.create(puesto=Puesto.objects.get(pk=puesto),
                                           alumno=request.user.alumno_user)
                nuevaPostulacion = True
        if nuevaPostulacion :
            context = {
                'user': postulacion.alumno.user,
                'postulacion': postulacion
            }
            message = render_to_string(
                template_name='emails/nueva_postulacion_empresa.txt',
                context=context
            )
            docentes = Docente.objects.filter(comision_docente=postulacion.alumno.carrera.carrera_comision)
            email = EmailMessage(postulacion.puesto.empresa.nombre_fantasia + " tienes una nueva postulacion a tu empresa.", message,
                                 to=[postulacion.puesto.empresa.user.email] + list(docente.email for docente in docentes))
            try:
                email.send()
            except (SMTPRecipientsRefused, SMTPSenderRefused):
                None
        return HttpResponseRedirect(request.META['HTTP_REFERER'])

@transaction.atomic
def delete_postulacion_alumno_view(request):
    if request.method == 'POST':
        try:
            postulacion = Postulacion.objects.get(pk=request.POST.get('postulacion_id'),
                                                  alumno=request.user.alumno_user,
                                                  activa=True)
            delete_postulacion_alumno(postulacion, HttpResponseRedirect(request.META['HTTP_REFERER']))
        except ObjectDoesNotExist:
            return HttpResponseRedirect(request.META['HTTP_REFERER'])

def delete_postulacion_alumno(postulacion, placeReturn):
    if postulacion.entrevista:
        cancel_entrevistas_alumno(postulacion.entrevista, None)
    postulacion.activa = False
    postulacion.fecha_desestimacion = datetime.now()
    postulacion.save()
    return placeReturn


class ListEntrevistasAlumnoView(generic.ListView):
    template_name = 'alumno/entrevistas.html'
    context_object_name = 'entrevista_list'

    def get_queryset(self):
        entrevistas = Entrevista.objects.filter(
            Q(alumno=self.request.user.alumno_user) & (~Q(alumno__condicion_acreditacion=None))).annotate(
            pasantia_aceptada_undefined=Case(
                When(status='REA', pasantia_aceptada=None, then=Value(0)),
                default=Value(1),
                output_field=IntegerField()))
        if len(entrevistas) == 0:
            entrevistas = []
        order = ['COA', 'NOA', 'CAA', 'NOC', 'CAE', 'REA']
        entrevistas_sortered = sorted(entrevistas, key=lambda x: (x.pasantia_aceptada_undefined, order.index(x.status), x.fecha))

        return getPage(self.request, entrevistas_sortered, 20)


class ListPostulacionesAlumnoView(generic.ListView):
    template_name = 'alumno/postulaciones.html'
    context_object_name = 'postulacion_list'

    def get_queryset(self):
        postulaciones = Postulacion.objects.filter(Q(alumno=self.request.user.alumno_user) & (Q(entrevista__isnull=False) | (Q(entrevista__isnull=True) & Q(activa=True))))
        return getPage(self.request, postulaciones, 20)


class ListPuestosAlumnoView(generic.ListView):
    template_name = 'alumno/empresas.html'
    context_object_name = 'puesto_list'

    def get_queryset(self):
        to_be_deleted = []
        puestos = Puesto.objects.filter(empresa__activa=True, empresa__departamento=self.request.user.alumno_user.carrera.departamento)
        for puesto in puestos:
            try:
                if puesto.fecha_inactivacion < datetime.now().date():
                    puesto.activo = False
                    puesto.save()
                puesto.postulacion = Postulacion.objects.get(puesto=puesto, alumno=self.request.user.alumno_user, activa=True)
            except ObjectDoesNotExist:
                if puesto.activo:
                    puesto.postulacion = None
                else:
                    to_be_deleted.append(puesto.pk)
        return getPage(self.request, puestos.filter(~Q(pk__in=to_be_deleted)), 20)


class ListContactoAlumnoView(generic.ListView):
    template_name = 'alumno/contacto.html'
    context_object_name = 'docente_list'

    def get_queryset(self):
        carrera = Alumno.objects.get(user=self.request.user.pk).carrera
        try:
            subcomision = SubcomisionCarrera.objects.get(carrera=carrera)
        except ObjectDoesNotExist:
            return None
        return getPage(self.request, subcomision.docentes.all(), 20)

class DetailEntrevistaAlumnoView(generic.UpdateView):
    model = Entrevista
    template_name = 'alumno/entrevista_detail.html'
    context_object_name = 'entrevista'
    form_class = EntrevistaDetailAlumnoForm
    success_url = '../../entrevistas'

    def form_valid(self, form):
        return super(DetailEntrevistaAlumnoView, self).form_valid(form)

@transaction.atomic
def cancel_entrevistas_alumno_view(request):
    entrevista = Entrevista.objects.get(pk=request.GET.get('entrevista_id'), alumno=request.user.alumno_user)
    return cancel_entrevistas_alumno(entrevista, HttpResponseRedirect(request.META['HTTP_REFERER']))

def cancel_entrevistas_alumno(entrevista, placeReturn):
    if entrevista.status not in ['COA', 'NOA', ]:
        return placeReturn
    try:
        Pasantia.objects.get(entrevista=entrevista)
    except ObjectDoesNotExist:
        entrevista.status = 'CAA'
        entrevista.save()
        context = {
            'entrevista': entrevista
        }
        message = render_to_string(
            template_name='emails/cancelacion_entrevista_empresa.txt',
            context=context
        )
        docentes = Docente.objects.filter(comision_docente=entrevista.alumno.carrera.carrera_comision)
        email = EmailMessage(entrevista.empresa.nombre_fantasia + " cancelaron una entrevista.", message,
                             to=[entrevista.empresa.nombre_fantasia] + list(docente.email for docente in docentes))
        try:
            email.send()
        except (SMTPRecipientsRefused, SMTPSenderRefused):
            None
        return placeReturn

@transaction.atomic
def confirm_entrevistas_alumno_view(request):
    entrevista = Entrevista.objects.get(pk=request.GET.get('entrevista_id'), alumno=request.user.alumno_user)
    entrevista.status = 'COA'
    entrevista.save()
    context = {
        'entrevista': entrevista
    }
    message = render_to_string(
        template_name='emails/confirmacion_entrevista_empresa.txt',
        context=context
    )
    docentes = Docente.objects.filter(comision_docente=entrevista.alumno.carrera.carrera_comision)
    email = EmailMessage(entrevista.empresa.nombre_fantasia + " confirmaron una entrevista!!.", message,
                         to=[entrevista.empresa.nombre_fantasia] + list(docente.email for docente in docentes))
    try:
        email.send()
    except (SMTPRecipientsRefused, SMTPSenderRefused):
        None
    return HttpResponseRedirect(request.META['HTTP_REFERER'])

# ------------------------------------------------------------------------------------------------------------
# --------------------------EMPRESA---------------------------------------------------------------------------
# ------------------------------------------------------------------------------------------------------------


class DetailEmpresaView(generic.DetailView):
    model = Empresa
    context_object_name = 'empresa'
    template_name = 'empresa/detail.html'

    def get_object(self):
        return Empresa.objects.get(user=self.request.user.pk)


@transaction.atomic
def edit_empresa(request):
    if request.method == 'POST':
        user_form = EmpresaUserEditForm(request.POST, instance=request.user)
        empresa_form = EmpresaEditForm(request.POST, request.FILES, instance=Empresa.objects.get(user=request.user.pk))
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
        entrevistas = Entrevista.objects.filter(
            Q(empresa=self.request.user.empresa_user) & ~Q(alumno__condicion_acreditacion=None)).annotate(
            pasantia_aceptada_undefined=Case(
                When(status='REA', pasantia_aceptada=None, then=Value(0)),
                default=Value(1),
                output_field=IntegerField()))
        if len(entrevistas) == 0:
            entrevistas = []
        order = ['COA', 'NOA', 'CAA', 'NOC', 'CAE', 'REA']
        entrevistas_sortered = sorted(entrevistas, key=lambda x: (x.pasantia_aceptada_undefined, order.index(x.status), x.fecha))
        return getPage(self.request, entrevistas_sortered, 20)


class ListPasantiasEmpresaView(generic.ListView):
    template_name = 'empresa/pasantias.html'
    context_object_name = 'pasantia_list'

    def get_queryset(self):
        pasantias = Pasantia.objects.filter(Q(entrevista__empresa=self.request.user.empresa_user)).order_by(
            F('tutor_empresa').asc(), 'fecha_inicio')
        return getPage(self.request, pasantias, 20)

class ListTutoresEmpresaView(generic.ListView):
    template_name = 'empresa/tutores.html'
    context_object_name = 'tutores_list'

    def get_queryset(self):
        tutores = TutorEmpresa.objects.filter(Q(empresa=self.request.user.empresa_user))
        return getPage(self.request, tutores, 20)


class DetailEntrevistaEmpresaView(generic.UpdateView):
    model = Entrevista
    template_name = 'empresa/entrevista_detail.html'
    context_object_name = 'entrevista'
    form_class = EntrevistaDetailEmpresaForm
    success_url = '../../entrevistas'

    def form_valid(self, form):
        entrevistaNueva = self.object
        entrevistaVieja = Entrevista.objects.get(pk=entrevistaNueva.pk)
        if entrevistaVieja.pasantia_aceptada == entrevistaNueva.pasantia_aceptada:
            return super(DetailEntrevistaEmpresaView, self).form_valid(form)
        context = {
            'entrevista': self.object
        }
        docentes = Docente.objects.filter(comision_docente=self.object.alumno.carrera.carrera_comision)
        if self.object.pasantia_aceptada == True:
            message = render_to_string(
                template_name='emails/aceptacion_pasantia_alumno.txt',
                context=context
            )
            email = EmailMessage("La empresa " + self.object.empresa.nombre_fantasia + " ACEPTÓ una pasantía",
                                 message, to=list(docente.email for docente in docentes))
            try:
                email.send()
            except (SMTPRecipientsRefused, SMTPSenderRefused):
                None
        elif self.object.pasantia_aceptada == False:
            message = render_to_string(
                template_name='emails/reachazo_pasantia_alumno.txt',
                context=context
            )
            email = EmailMessage("La empresa " + self.object.empresa.nombre_fantasia + " RECHAZÓ una pasantía",
                                 message, to=[self.object.alumno.user.email] + list(docente.email for docente in docentes))
            try:
                email.send()
            except (SMTPRecipientsRefused, SMTPSenderRefused):
                None
        return super(DetailEntrevistaEmpresaView, self).form_valid(form)


class DetailPasantiaEmpresaView(generic.UpdateView):
    model = Pasantia
    template_name = 'empresa/pasantia_detail.html'
    context_object_name = 'pasantia'
    form_class = PasantiaDetailEmpresaForm

    def form_valid(self, form):
        form.instance.empresa = self.request.user.empresa_user
        return super(DetailPasantiaEmpresaView, self).form_valid(form)


class CreateTutorView(generic.CreateView):
    model = TutorEmpresa
    context_object_name = 'puesto'
    fields = ['apellido', 'nombre', 'cargo', 'mail']
    template_name = 'empresa/tutores_create.html'

    def form_valid(self, form):
        tutor = form.save(commit=False)
        try:
            TutorEmpresa.objects.get(pk=tutor.mail, empresa=self.request.user.empresa_user)
            form.add_error('mail', forms.ValidationError("Ya existe un tutor con este mail."))
            return super(CreateTutorView, self).form_invalid(form)
        except ObjectDoesNotExist:
            tutor.empresa = self.request.user.empresa_user
            tutor.save()
        return redirect('tutores-empresa')


class DetailTutoresEmpresaView(generic.UpdateView):
    model = TutorEmpresa
    template_name = 'empresa/tutores_detail.html'
    context_object_name = 'tutor'
    form_class = TutorEmpresaDetailEmpresaForm
    success_url = '../../tutores'


@transaction.atomic
def cancel_entrevistas_empresa_view(request):
    entrevista = Entrevista.objects.get(pk=request.GET.get('entrevista_id'), empresa=request.user.empresa_user)
    entrevista.status = 'CAE'
    entrevista.save()
    context = {
        'user': entrevista.alumno.user,
        'entrevista': entrevista
    }
    message = render_to_string(
        template_name='emails/cancelacion_entrevista_alumno.txt',
        context=context
    )
    docentes = Docente.objects.filter(comision_docente=entrevista.alumno.carrera.carrera_comision)
    email = EmailMessage(entrevista.alumno.user.first_name + " cancelaron tu entrevista.", message,
                         to=[entrevista.alumno.user.email] + list(docente.email for docente in docentes))
    try:
        email.send()
    except (SMTPRecipientsRefused, SMTPSenderRefused):
        None
    return HttpResponseRedirect(request.META['HTTP_REFERER'])


class ListPostulacionesEmpresaView(generic.ListView):
    template_name = 'empresa/postulaciones.html'
    context_object_name = 'postulacion_list'

    def get_queryset(self):
        postulaciones = Postulacion.objects.filter(
            Q(puesto__empresa=self.request.user.empresa_user) & (~Q(alumno__condicion_acreditacion=None))).order_by('-activa',
            F('entrevista').asc(), 'puesto', 'fecha', 'alumno__user__last_name', 'alumno__user__first_name')
        return getPage(self.request, postulaciones, 20)


class ListPuestosEmpresaView(generic.ListView):
    template_name = 'empresa/puestos.html'
    context_object_name = 'puesto_list'

    def get_queryset(self):
        puestos = Puesto.objects.filter(empresa=self.request.user.empresa_user)
        return getPage(self.request, puestos, 20)


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
        return getPage(self.request, contactos, 20)


class PostulacionDetailEmpresaView(generic.DetailView):
    model = Postulacion
    context_object_name = 'postulacion'
    template_name = 'empresa/alumno_detail.html'

    def get_object(self):
        try:
            return Postulacion.objects.get(pk=self.kwargs["pk"], puesto__empresa=self.request.user.empresa_user)
        except ObjectDoesNotExist:
            try:
                return Postulacion.objects.get(alumno__pk=self.kwargs["pk"],
                                               puesto__empresa=self.request.user.empresa_user, activa=True)
            except ObjectDoesNotExist:
                return None


@transaction.atomic
def delete_postulacion_empresa(request):
    if request.method == 'POST':
        try:
            postulacion = Postulacion.objects.get(pk=request.POST.get('postulacion'),puesto__empresa=request.user.empresa_user, activa=True)
            if postulacion.entrevista:
                if postulacion.entrevista.status in ['COA', 'NOA']:
                    request.GET['entrevista_id'] = postulacion.entrevista.pk
                    cancel_entrevistas_empresa_view(request)
            postulacion.activa = False
            postulacion.fecha_desestimacion = datetime.now().date()
            postulacion.save()
            context = {
                'user': postulacion.alumno.user,
                'postulacion': postulacion
            }
            message = render_to_string(
                template_name='emails/desestimacion_postulacion_alumno.txt',
                context=context
            )
            docentes = Docente.objects.filter(comision_docente=postulacion.alumno.carrera.carrera_comision)
            email = EmailMessage(postulacion.alumno.user.first_name + " desestimaron tu postulacion.", message,
                                 to=[postulacion.alumno.user.email] + list(docente.email for docente in docentes))
            try:
                email.send()
            except (SMTPRecipientsRefused, SMTPSenderRefused):
                None
        except ObjectDoesNotExist:
            None
        return HttpResponseRedirect('../postulaciones')

@transaction.atomic
def nuevaEntrevista(request):
    postulacion = Postulacion.objects.get(pk=request.POST.get('postulacion'),
                                          puesto__empresa=request.user.empresa_user, activa=True)
    alumno = postulacion.alumno
    empresa = postulacion.puesto.empresa
    entrevista = Entrevista.objects.filter(Q(entrevista_postulacion=postulacion)).first()
    if entrevista == None or entrevista.status in ['NOC','CAA','CAE']:
        if request.POST:
            form = EntrevistaCreateForm(request.POST)
            if form.is_valid():
                if entrevista == None:
                    entrevista = Entrevista.objects.create(
                        alumno=alumno,
                        empresa=empresa,
                        fecha=datetime.strptime(request.POST.get('fecha'), "%d/%m/%Y %H:%M"),
                        lugar=request.POST.get('lugar')
                    )
                else:
                    entrevista.status = 'NOA'
                    entrevista.fecha = datetime.strptime(request.POST.get('fecha'), "%d/%m/%Y %H:%M")
                    entrevista.lugar = request.POST.get('lugar')
                entrevista.save()
                postulacion.entrevista = entrevista
                postulacion.save()
                context={
                    'user':alumno.user,
                    'entrevista':entrevista
                }
                message = render_to_string(
                    template_name='emails/nueva_entrevista_alumno.txt',
                    context=context
                )
                docentes = Docente.objects.filter(comision_docente=alumno.carrera.carrera_comision)
                email = EmailMessage('Felicitaciones ' + alumno.user.first_name + "!!", message, to=[alumno.user.email] + list(docente.email for docente in docentes))
                try:
                    email.send()
                except (SMTPRecipientsRefused, SMTPSenderRefused):
                    None
                return redirect('/empresa/postulaciones')
        return render(request, 'empresa/entrevista_nueva.html', {
            'form': EntrevistaCreateForm,
        })
    if request.POST:
        form = EntrevistaExistenteCreateForm(request.POST)
        if form.is_valid():
            postulacion.entrevista = entrevista
            postulacion.save()
            return redirect('/empresa/postulaciones')
    return render(request, 'empresa/entrevista_nueva_existente.html', {
        'form': EntrevistaExistenteCreateForm(instance=entrevista),
    })


class CreatePuestoView(generic.CreateView):
    model = Puesto
    context_object_name = 'puesto'
    fields = ['nombre', 'descripcion_actividades', 'conocimientos_requeridos', 'horario', 'rentado']
    template_name = 'empresa/puesto_create.html'

    def form_valid(self, form):
        puesto = form.save(commit=False)
        try:
            Puesto.objects.get(nombre=puesto.nombre, empresa=self.request.user.empresa_user, activo=True)
            form.add_error('nombre', forms.ValidationError("Ya se encuentra ofreciéndo una pasantía para esta área."))
            return super(CreatePuestoView, self).form_invalid(form)
        except ObjectDoesNotExist:
            try:
                puestoDb = Puesto.objects.get(nombre=puesto.nombre, empresa=self.request.user.empresa_user, activo=False)
                puestoDb.descripcion_actividades = puesto.descripcion_actividades
                puestoDb.conocimientos_requeridos = puesto.conocimientos_requeridos
                puestoDb.horario = puesto.horario
                puestoDb.rentado = puesto.rentado
                puestoDb.activo = True
                puestoDb.save()
                return redirect('puestos-empresa')
            except ObjectDoesNotExist:
                None
            puesto.empresa = self.request.user.empresa_user
            puesto.save()
        return redirect('puestos-empresa')


@transaction.atomic
def active_puesto_empresa(request, *args, **kwargs):
    puesto = get_object_or_404(Puesto, pk=kwargs.get('pk'), empresa=request.user.empresa_user)
    puesto.activo = True
    puesto.fecha_inactivacion = datetime.today() + td(days=15)
    puesto.save()
    return redirect('puestos-empresa')

@transaction.atomic
def delete_puesto_empresa(request, *args, **kwargs):
    puesto = get_object_or_404(Puesto, pk=kwargs.get('pk'), empresa=request.user.empresa_user)
    puesto.activo = False
    puesto.save()
    return redirect('puestos-empresa')

@transaction.atomic
def delete_tutor_empresa(request, *args, **kwargs):
    puesto = get_object_or_404(TutorEmpresa, pk=kwargs.get('pk'), empresa=request.user.empresa_user)
    puesto.delete()
    return redirect('tutores-empresa')


class DetailPuestoEmpresaView(generic.UpdateView):
    model = Puesto
    template_name = 'empresa/puesto_detail.html'
    context_object_name = 'puesto'
    fields = ['nombre', 'descripcion_actividades', 'conocimientos_requeridos', 'horario', 'rentado', 'activo']
    success_url = '../../puestos'

    def get_object(self):
        return get_object_or_404(Puesto, pk=self.kwargs["pk"])


# ------------------------------------------------------------------------------------------------------------
# --------------------------SUBCOMISION-CARRERA---------------------------------------------------------------
# ------------------------------------------------------------------------------------------------------------


class IndexSubcomisionCarreraView(generic.TemplateView):
    model = SubcomisionCarrera
    template_name = 'subcomision_carrera/index.html'

    def get_object(self):
        return SubcomisionCarrera.objects.get(user=self.request.user.pk)


@transaction.atomic
def edit_subcomision_carrera(request):
    if request.method == 'POST':
        user_form = SubcomisionCarreraUserEditForm(request.POST, instance=request.user)
        subcomision_carrera_form = SubcomisionCarreraEditForm(request.POST, instance=SubcomisionCarrera.objects.get(
            user=request.user.pk))
        if user_form.is_valid() and subcomision_carrera_form.is_valid():
            user_form.save()
            subcomision_carrera_form.save()
            messages.success(request, ('Su perfil fue correctamente actualizado!'))
            return redirect('edit-subcomision-carrera')
        else:
            messages.error(request, ('El formulario contiene algunos errores'))
    else:
        user_form = SubcomisionCarreraUserEditForm(instance=request.user)
        subcomision_carrera_form = SubcomisionCarreraEditForm(
            instance=SubcomisionCarrera.objects.get(user=request.user.pk))
    return render(request, 'subcomision_carrera/edit.html', {
        'user_form': user_form,
        'subcomision_carrera_form': subcomision_carrera_form,
    })


class ListEntrevistasSubcomisionCarreraView(generic.ListView):
    def get_queryset(self):
        try:
            entrevistas = Entrevista.objects.filter(alumno__carrera=self.request.user.carrera_user.carrera).annotate(
            pasantia_aceptada_undefined=Case(
                When(status='REA', pasantia_aceptada=None, then=Value(0)),
                default=Value(1),
                output_field=IntegerField()))
            if len(entrevistas) == 0:
                entrevistas = []
            order = ['COA', 'NOA', 'CAA', 'NOC', 'CAE', 'REA']
            entrevistas = sorted(entrevistas, key=lambda x: (x.pasantia_aceptada_undefined, order.index(x.status), x.fecha))
        except ObjectDoesNotExist:
            return None
        for entrevista in entrevistas:
            try:
                pasantia = Pasantia.objects.get(entrevista=entrevista)
            except ObjectDoesNotExist:
                continue
            entrevista.pasantia = pasantia
        return getPage(self.request, entrevistas, 20)

    def get_pasantia(self):
        try:
            pasantias = Pasantia.objects.get(entrevista__in=self.get_queryset)
        except ObjectDoesNotExist:
            return None
        return pasantias

    template_name = 'subcomision_carrera/entrevistas.html'
    context_object_name = 'entrevista_list'
    extra_context = {'pasantias': get_pasantia}


class ListPostulacionesSubcomisionCarreraView(generic.ListView):
    template_name = 'subcomision_carrera/postulaciones.html'
    context_object_name = 'postulacion_list'

    def get_queryset(self):
        postulaciones = Postulacion.objects.filter(alumno__carrera=self.request.user.carrera_user.carrera)
        return getPage(self.request, postulaciones, 20)


class ListAlumnosSubcomisionCarreraView(generic.ListView):
    template_name = 'subcomision_carrera/alumnos.html'
    context_object_name = 'alumno_list'

    def get_queryset(self):
        alumnos = Alumno.objects.filter(carrera=self.request.user.carrera_user.carrera)
        return getPage(self.request, alumnos, 20)


class ListEmpresasSubcomisionCarreraView(generic.ListView):
    template_name = 'subcomision_carrera/empresas.html'
    context_object_name = 'empresa_list'

    def get_queryset(self):
        empresas = Empresa.objects.filter(departamento=(self.request.user.carrera_user.carrera).departamento)
        return getPage(self.request, empresas, 20)


class ListPuestosSubcomisionCarreraView(generic.ListView):
    template_name = 'subcomision_carrera/puestos.html'
    context_object_name = 'puesto_list'

    def get_queryset(self):
        puestos = Puesto.objects.filter(empresa__activa=True, empresa__departamento=(self.request.user.carrera_user.carrera).departamento)
        return getPage(self.request, puestos, 20)


class ListPasantiasSubcomisionCarreraView(generic.ListView):
    template_name = 'subcomision_carrera/pasantias.html'
    context_object_name = 'pasantia_list'

    def get_queryset(self):
        pasantias = Pasantia.objects.filter(entrevista__alumno__carrera=(self.request.user.carrera_user.carrera))
        return getPage(self.request, pasantias, 20)


class AlumnoDetailSubcomisionCarreraView(generic.UpdateView):
    model = Alumno
    template_name = 'subcomision_carrera/alumno_detail.html'
    form_class = AlumnoDetailSubcomisionCarreraForm

    def get_success_url(self):
        return self.request.POST.get('next', '/')

    def get_object(self):
        return Alumno.objects.get(numero_registro=self.kwargs["numero_registro"])


class EntrevistaDetailSubcomisionCarreraView(generic.UpdateView):
    model = Entrevista
    template_name = 'subcomision_carrera/entrevista_detail.html'
    form_class = EntrevistaDetailSubcomisionCarreraForm
    success_url = '../../entrevistas'


class PasantiaDetailSubcomisionCarreraView(generic.UpdateView):
    model = Pasantia
    template_name = 'subcomision_carrera/pasantia_detail.html'
    form_class = PasantiaDetailSubcomisionCarreraForm

    def get_object(self):
        return Pasantia.objects.get(pk=self.kwargs["pk"])

    def get_success_url(self):
        return self.request.GET.get('next', '../../pasantias')

class DetailPustoSubcomisionCarreraView(generic.TemplateView):
    template_name = 'subcomision_carrera/puesto_detail.html'
    context_object_name = 'puesto'

    def get_context_data(self, **kwargs):
        context = super(DetailPustoSubcomisionCarreraView, self).get_context_data(**kwargs)
        context['puesto'] = Puesto.objects.get(pk=self.kwargs["pk"],empresa__departamento=self.request.user.carrera_user.carrera.departamento)
        context['numero_alumnos_postulados'] = Postulacion.objects.filter(puesto=context['puesto'], activa=True).count()
        return context

class EmpresaDetailSubcomisionCarreraView(generic.UpdateView):
    model = Empresa
    template_name = 'subcomision_carrera/empresa_detail.html'
    form_class = EmpresaDetailSubcomisionCarreraForm
    success_url = '../../alumnos'

    def get_object(self):
        return Empresa.objects.get(pk=self.kwargs["pk"])

# ------------------------------------------------------------------------------------------------------------
# ---------------------------COMISION-PASANTIAS---------------------------------------------------------------
# ------------------------------------------------------------------------------------------------------------

@transaction.atomic
def edit_comision_pasantias(request):
    if request.method == 'POST':
        user_form = SubcomisionPasantiasUserEditForm(request.POST, instance=request.user)
        comision_pasantias_form = SubcomisionPasantiasForm(request.POST,
                                                           instance=SubcomisionPasantiasPPS.objects.get(
                                                                   user=request.user.pk))
        if user_form.is_valid() and comision_pasantias_form.is_valid():
            user_form.save()
            comision_pasantias_form.save()
            messages.success(request, ('Su perfil fue correctamente actualizado!'))
            return redirect('edit-comision-pasantias')
        else:
            messages.error(request, ('El formulario contiene algunos errores'))
    else:
        user_form = SubcomisionPasantiasUserEditForm(instance=request.user)
        comision_pasantias_form = SubcomisionPasantiasForm(
            instance=SubcomisionPasantiasPPS.objects.get(user=request.user.pk))
    return render(request, 'comision_pasantias/edit.html', {
        'user_form': user_form,
        'comision_pasantias_form': comision_pasantias_form,
    })


class ListEntrevistasComisionPasantiasView(generic.ListView):
    def get_queryset(self):
        try:
            entrevistas = Entrevista.objects.filter(
                alumno__carrera__departamento=self.request.user.pps_user.departamento)
        except ObjectDoesNotExist:
            return None
        for entrevista in entrevistas:
            try:
                pasantia = Pasantia.objects.get(entrevista=entrevista)
            except ObjectDoesNotExist:
                continue
            entrevista.pasantia = pasantia
        return getPage(self.request, entrevistas, 20)

    def get_pasantia(self):
        try:
            pasantias = Pasantia.objects.get(entrevista__in=self.get_queryset)
        except ObjectDoesNotExist:
            return None
        return pasantias

    template_name = 'comision_pasantias/entrevistas.html'
    context_object_name = 'entrevista_list'
    extra_context = {'pasantias': get_pasantia}


class ListPostulacionesComisionPasantiasView(generic.ListView):
    template_name = 'comision_pasantias/postulaciones.html'
    context_object_name = 'postulacion_list'

    def get_queryset(self):
        postulaciones = Postulacion.objects.filter(alumno__carrera__departamento=self.request.user.pps_user.departamento, activa=True)
        return getPage(self.request, postulaciones, 20)


class ListAlumnosComisionPasantiasView(generic.ListView):
    template_name = 'comision_pasantias/alumnos.html'
    context_object_name = 'alumno_list'

    def get_queryset(self):
        alumnos = Alumno.objects.filter(carrera__departamento=self.request.user.pps_user.departamento)
        return getPage(self.request, alumnos, 20)


class ListEmpresasComisionPasantiasView(generic.ListView):
    template_name = 'comision_pasantias/empresas.html'
    context_object_name = 'empresa_list'

    def get_queryset(self):
        empresas = Empresa.objects.filter(departamento=self.request.user.pps_user.departamento, activa=True)
        return getPage(self.request, empresas, 20)
    
    
@transaction.atomic
def create_empresa(request):
    if request.method == 'POST':
        empresa_form = EmpresaCreateComisionPasantiasForm(request.POST)
        user_form = UserWithoutNameCreateForm(request.POST)
        if user_form.is_valid() and empresa_form.is_valid():
            try:
                empresa = Empresa.objects.get(nombre_fantasia=empresa_form.cleaned_data.get('nombre_fantasia'), departamento=request.user.pps_user.departamento)
                empresa.activa = True
                empresa.save()
                new_user_form = UserWithoutNameCreateForm(user_form.cleaned_data, instance=User.objects.get(pk=empresa.user.pk))
                new_user = new_user_form.save(commit=False)
                new_user.is_active = True
                new_user.save()
            except ObjectDoesNotExist:
                empresa = empresa_form.save(commit=False)
                empresa.departamento = request.user.pps_user.departamento
                user = user_form.save(commit=False)
                user.tipo = User.EM
                user.save()
                empresa.user = user
                empresa.save()
            return redirect('empresas-comision-pasantias')
    else:
        empresa_form = EmpresaCreateComisionPasantiasForm()
        user_form = UserWithoutNameCreateForm()
    return render(request, 'comision_pasantias/empresa_create.html', {
        'empresa_form': empresa_form,
        'user_form': user_form,
    })


class ListPuestosComisionPasantiasView(generic.ListView):
    template_name = 'comision_pasantias/puestos.html'
    context_object_name = 'puesto_list'

    def get_queryset(self):
        puestos = Puesto.objects.filter(empresa__activa=True, empresa__departamento=self.request.user.pps_user.departamento)
        return getPage(self.request, puestos, 20)


class DetailPustoComisionPasantiasView(generic.TemplateView):
    template_name = 'comision_pasantias/puesto_detail.html'
    context_object_name = 'puesto'

    def get_context_data(self, **kwargs):
        context = super(DetailPustoComisionPasantiasView, self).get_context_data(**kwargs)
        context['puesto'] = Puesto.objects.get(pk=self.kwargs["pk"], empresa__departamento=self.request.user.pps_user.departamento)
        return context


class ListPasantiasComisionPasantiasView(generic.ListView):
    template_name = 'comision_pasantias/pasantias.html'
    context_object_name = 'pasantia_list'

    def get_queryset(self):
        pasantias = Pasantia.objects.filter(
            entrevista__alumno__carrera__departamento=self.request.user.pps_user.departamento)
        return getPage(self.request, pasantias, 20)


class AlumnoDetailComisionPasantiasView(generic.UpdateView):
    model = Alumno
    template_name = 'comision_pasantias/alumno_detail.html'
    form_class = AlumnoDetailComisionPasantiasForm
    success_url = '../../alumnos'

    def get_object(self):
        return Alumno.objects.get(numero_registro=self.kwargs["numero_registro"])


class EntrevistaDetailComisionPasantiasView(generic.UpdateView):
    model = Entrevista
    template_name = 'comision_pasantias/entrevista_detail.html'
    form_class = EntrevistaDetailComisionPasantiasForm
    success_url = '../../entrevistas'


class PasantiaDetailComisionPasantiasView(generic.UpdateView):
    model = Entrevista
    template_name = 'comision_pasantias/pasantia_detail.html'
    form_class = PasantiaDetailComisionPasantiasForm

    def get_object(self):
        return Pasantia.objects.get(pk=self.kwargs["pk"])

    def get_form_kwargs(self):
        kwargs = super(PasantiaDetailComisionPasantiasView, self).get_form_kwargs()
        kwargs['user'] = self.request.user  # pass the 'user' in kwargs
        return kwargs

    def get_success_url(self):
        return self.request.GET.get('next', '../../pasantias')


class CreatePasantiaView(generic.CreateView):
    model = Pasantia
    context_object_name = 'pasantia'
    template_name = 'comision_pasantias/pasantia_create.html'
    success_url = '../pasantias'

    def get_form_kwargs(self):
        kwargs = super(CreatePasantiaView, self).get_form_kwargs()
        kwargs['user'] = self.request.user  # pass the 'user' in kwargs
        return kwargs

    def get_form(self):
        form = super(CreatePasantiaView, self).get_form(PasantiaCreateForm)
        return form

    def get_success_url(self):
        return self.request.GET.get('next', '')

    def form_valid(self, form):
        context = {
            'user': form.instance.entrevista.alumno.user,
            'entrevista': form.instance.entrevista
        }
        message = render_to_string(
            template_name='emails/nueva_pasantia_alumno.txt',
            context=context
        )
        docentes = Docente.objects.filter(comision_docente=form.instance.entrevista.alumno.carrera.carrera_comision)
        email = EmailMessage('Felicitaciones ' + form.instance.entrevista.alumno.user.first_name + "!!", message,
                             to=[form.instance.entrevista.alumno.user.email] + list(docente.email for docente in docentes))
        try:
            email.send()
        except (SMTPRecipientsRefused, SMTPSenderRefused):
            None
        postulaciones = Postulacion.objects.filter(alumno=form.instance.entrevista.alumno, activa=True)
        for postulacion in postulaciones:
            delete_postulacion_alumno(postulacion, None)
        entrevistas = Entrevista.objects.filter(alumno=form.instance.entrevista.alumno, status__in=['COA', 'NOA'])
        for entrevista in entrevistas:
            cancel_entrevistas_alumno(entrevista, None)
        form.instance.entrevista.pasantia_aceptada = True
        form.instance.entrevista.save()
        return super().form_valid(form)

@transaction.atomic
def delete_pasantia(request, *args, **kwargs):
    get_object_or_404(Pasantia, pk=kwargs.get('pk'), entrevista__alumno__carrera__departamento=request.user.pps_user.departamento)
    Pasantia.objects.get(pk=kwargs.get('pk')).delete()
    return HttpResponseRedirect(request.GET.get('next', ''))


class ListCarrerasComisionPasantiasView(generic.ListView):
    template_name = 'comision_pasantias/carreras.html'
    context_object_name = 'carrera_list'

    def get_queryset(self):
        carreras = Carrera.objects.filter(departamento=self.request.user.pps_user.departamento,activa=True)
        return getPage(self.request, carreras, 20)

class CarreraDetailComisionPasantiasView(generic.UpdateView):
    model = Carrera
    template_name = 'comision_pasantias/carrera_detail.html'
    form_class = EntrevistaDetailComisionPasantiasForm
    success_url = '../../carreras'

    def get_object(self):
        return Carrera.objects.get(pk=self.kwargs["pk"])

@transaction.atomic
def create_carrera(request):
    if request.method == 'POST':
        carrera_form = CarreraCreateComisionPasantiasForm(request.POST)
        user_form = UserWithoutNameCreateForm(request.POST)
        subcomision_carrera_form = SubcomisionCarreraCreateForm(request.user, request.POST)
        if user_form.is_valid() and subcomision_carrera_form.is_valid() and carrera_form.is_valid():
            try:
                carrera = Carrera.objects.get(nombre=carrera_form.cleaned_data.get('nombre'), departamento=request.user.pps_user.departamento)
                carrera.activa = True
                carrera.save()
                new_user_form = UserWithoutNameCreateForm(user_form.cleaned_data, instance=User.objects.get(pk=carrera.carrera_comision.user.pk))
                new_user = new_user_form.save(commit=False)
                new_user.is_active = True
                new_user.save()
                new_subcomision_form = SubcomisionCarreraCreateForm(request.user, subcomision_carrera_form.cleaned_data,
                                               instance=SubcomisionCarrera.objects.get(pk=carrera.carrera_comision.pk))
                new_subcomision_form.save()
            except ObjectDoesNotExist:
                try:
                    RegistrationView.as_view(form_class=UserWithoutNameCreateForm)(request)
                except (SMTPRecipientsRefused, SMTPSenderRefused):
                    pass
                subcomision_carrera = subcomision_carrera_form.save(commit=False)
                subcomision_carrera.user = User.objects.get(username=user_form.instance.username)
                carrera = carrera_form.save(commit=False)
                carrera.departamento = request.user.pps_user.departamento
                carrera.save()
                subcomision_carrera.carrera = carrera
                subcomision_carrera.save(commit=True)
            return redirect('carreras-comision-pasantias')
    else:
        carrera_form = CarreraCreateComisionPasantiasForm()
        user_form = UserWithoutNameCreateForm()
        subcomision_carrera_form = SubcomisionCarreraCreateForm(request.user)
    return render(request, 'comision_pasantias/carrera_create.html', {
        'carrera_form': carrera_form,
        'user_form': user_form,
        'subcomision_carrera_form': subcomision_carrera_form,
    })

@transaction.atomic
def edit_carrera(request, pk):
    if request.method == 'POST':
        carrera_form = CarreraCreateComisionPasantiasForm(request.POST, instance=Carrera.objects.get(pk=pk))
        subcomision_carrera_form = SubcomisionCarreraEditForm(request.POST, instance=SubcomisionCarrera.objects.get(
            carrera=carrera_form.instance))
        user_form = UserEditForm(request.POST, instance=User.objects.get(pk=subcomision_carrera_form.instance.user.pk))
        if user_form.is_valid() and subcomision_carrera_form.is_valid() and carrera_form.is_valid():
            carrera_form.save()
            subcomision_carrera_form.save()
            user_form.save()
            messages.success(request, ('Carrera editada!'))
            return redirect('carreras-comision-pasantias')
        else:
            messages.error(request, ('El formulario contiene algunos errores'))
    else:
        carrera_form = CarreraCreateComisionPasantiasForm(instance=Carrera.objects.get(pk=pk))
        subcomision_carrera_form = SubcomisionCarreraEditForm(instance=SubcomisionCarrera.objects.get(
            carrera=carrera_form.instance))
        user_form = UserEditForm(instance=subcomision_carrera_form.instance.user)
    return render(request, 'comision_pasantias/carrera_detail.html', {
        'user_form': user_form,
        'subcomision_carrera_form': subcomision_carrera_form,
        'carrera_form': carrera_form
    })

@transaction.atomic
def delete_carrera(request, *args, **kwargs):
    carrera = get_object_or_404(Carrera, pk=kwargs.get('pk'))
    subcomision_carrera = SubcomisionCarrera.objects.get(carrera=carrera)
    user = User.objects.get(pk=subcomision_carrera.user.pk)
    user.is_active = False
    user.save()
    carrera.activa = False
    carrera.save()
    return redirect('carreras-comision-pasantias')

class AjaxField2View(generic.View):

    def get(self, request, *args, **kwargs):
        entrevista = get_object_or_404(Entrevista, pk=request.GET.get('entrevista_id'))
        tutores = TutorEmpresa.objects.filter(empresa=entrevista.empresa)
        data = serializers.serialize('json', tutores)
        return HttpResponse(data, content_type="application/json")

def getPage(request, list, size):
    paginator = Paginator(list, size)

    page = request.GET.get('page')
    try:
        list_page = paginator.page(page)
    except PageNotAnInteger:
        # If page is not an integer, deliver first page.
        list_page = paginator.page(1)
    except EmptyPage:
        # If page is out of range (e.g. 9999), deliver last page of results.
        list_page = paginator.page(paginator.num_pages)
    return list_page