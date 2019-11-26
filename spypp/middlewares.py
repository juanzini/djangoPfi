from datetime import timedelta as td
from datetime import datetime
from django.conf import settings
from .models import User
from .views import edit_ultima_actualizacion, edit_alumno
from django.contrib.auth import logout
from django.utils import translation
from django.core.exceptions import ObjectDoesNotExist


class LastUserActivityMiddleware:
    KEY = "last-activity"

    def __init__(self, get_response):
        self.get_response = get_response

    def __call__(self, request):
        response = self.process_request(request)
        if response is None:
            response = self.get_response(request)
        response = self.process_response(request, response)
        return response

    def process_request(self, request):
        if request.user.is_authenticated:
            if not request.session.get(self.KEY):
                last_activity = datetime.now()
            else:
                last_activity = datetime.strptime(request.session.get(self.KEY), "%Y-%m-%dT%H:%M:%S.%f")
            if settings.DEBUG:
                too_old_time = datetime.now() - td(seconds=settings.LAST_ACTIVITY_INTERVAL_SECS_DEBUG)
            else:
                too_old_time = datetime.now() - td(seconds=settings.LAST_ACTIVITY_INTERVAL_SECS)
            if last_activity < too_old_time:
                logout(request)
                return None

            request.session[self.KEY] = datetime.now().strftime("%Y-%m-%dT%H:%M:%S.%f")

        return None

    def process_response(self, request, response):
        return response


class LastUserUpdateProfile(object):
    def __init__(self, get_response):
        self.get_response = get_response

    def __call__(self, request):
        response = self.process_request(request)
        if response is None:
            response = self.get_response(request)
        response = self.process_response(request, response)
        return response

    def process_request(self, request):
        if request.user.is_authenticated and request.user.tipo == User.AL and not request.user.is_superuser and not request.user.is_staff:
            try:
                last_update = request.user.alumno_user.ultima_actualizacion_perfil
            except ObjectDoesNotExist:
                last_update = datetime.now().date()

            too_old_time = datetime.now() - td(days=365)
            if 'guardar' in request.POST:
                return edit_alumno(request)
            if not last_update or last_update < too_old_time.date():
                return edit_ultima_actualizacion(request, True)
        return None

    def process_response(self, request, response):
        return response


class LocaleMiddleware(object):
    def __init__(self, get_response):
        self.get_response = get_response

    def __call__(self, request):
        return self.get_response(request)

    def process_request(self, request):
        language = translation.get_language_from_request(request)
        translation.activate(language)
        request.LANGUAGE_CODE = translation.get_language()

    def process_response(self, request, response):
        return response
