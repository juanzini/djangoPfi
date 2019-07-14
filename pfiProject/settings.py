"""
Django settings for pfiProject project.

Generated by 'django-admin startproject' using Django 2.1.

For more information on this file, see
https://docs.djangoproject.com/en/2.1/topics/settings/

For the full list of settings and their values, see
https://docs.djangoproject.com/en/2.1/ref/settings/
"""

import os
from decouple import config

# Build paths inside the project like this: os.path.join(BASE_DIR, ...)
BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/2.1/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = '#lfqpze2(dodh-(p&boxq6)$1%$vs2qstkvbie0t$x8figm(w*'

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True

ALLOWED_HOSTS = ['localhost', '127.0.0.1', 'www.mysite.com']

PRIVATE_STORAGE_AUTH_FUNCTION = 'private_storage.permissions.allow_staff'

# Application definition

INSTALLED_APPS = [
    'alumno.apps.AlumnoConfig',
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'bootstrap4',
    'django_celery_results',
    'django_registration',
    'bootstrap_datepicker_plus',
    'django_cleanup.apps.CleanupConfig',
    'private_storage',
    'django_celery_beat',
    'storages',
    'sendgrid',
]

MIDDLEWARE = [
    'django.middleware.security.SecurityMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
    'alumno.middlewares.LocaleMiddleware',
    'alumno.middlewares.LastUserActivityMiddleware',
    'alumno.middlewares.LastUserUpdateProfile'
]

LAST_ACTIVITY_INTERVAL_SECS = 300
LAST_ACTIVITY_INTERVAL_SECS_DEBUG = 30000

ROOT_URLCONF = 'pfiProject.urls'

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
            ],
        },
    },
]

WSGI_APPLICATION = 'pfiProject.wsgi.application'


# Database
# https://docs.djangoproject.com/en/2.1/ref/settings/#databases

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.sqlite3',
        'NAME': os.path.join(BASE_DIR, 'db.sqlite3'),
    }
}


# Password validation
# https://docs.djangoproject.com/en/2.1/ref/settings/#auth-password-validators

AUTH_PASSWORD_VALIDATORS = [
    {
        'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator',
    },
]
AUTH_USER_MODEL = 'alumno.User'
REGISTRATION_OPEN  =  True                 # Si es True, los usuarios pueden registrar
ACCOUNT_ACTIVATION_DAYS  =  1      # Ventana de activación de un día; usted puede, por supuesto, usar un valor diferente.
REGISTRATION_AUTO_LOGIN  =  True   # Si es True, el usuario iniciará sesión automáticamente.
LOGIN_REDIRECT_URL  =  '/'   # La página a la que desea que lleguen los usuarios después de iniciar sesión correctamente
LOGIN_URL  =  '/accounts/login'   # Los usuarios de la página están dirigidas a si no están conectadas

# Internationalization
# https://docs.djangoproject.com/en/2.1/topics/i18n/

LANGUAGE_CODE = 'es'

TIME_ZONE = 'America/Buenos_Aires'

USE_I18N = True

USE_L10N = True

USE_TZ = True

# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/2.1/howto/static-files/
STATIC_URL = '/static/'

EMAIL_USE_SSL = True
EMAIL_HOST = 'smtp.gmail.com'
EMAIL_PORT = 465
EMAIL_HOST_USER = 'dirinfo.spypp@gmail.com'
EMAIL_HOST_PASSWORD = ''

BOOTSTRAP4 = {
    'include_jquery': True,
}

# Celery settings
CELERY_BROKER_URL = 'redis://localhost:6379'
CELERY_RESULT_BACKEND = config('DATABASE_URL', default='django-db')
CELERY_ACCEPT_CONTENT = ['application/json']
CELERY_RESULT_SERIALIZER = 'json'
CELERY_TASK_SERIALIZER = 'json'

if config('DJANGO_PRODUCTION_ENV', default=False, cast=bool):
    from .settings_production import *
    MIDDLEWARE += ['whitenoise.middleware.WhiteNoiseMiddleware']
else:
    ADMIN_MEDIA_PREFIX = '/media/'
    PRIVATE_STORAGE_ROOT = os.path.join(BASE_DIR, 'media/')
