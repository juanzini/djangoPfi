import os
import dj_database_url
from decouple import config

BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

ALLOWED_HOSTS = ['0.0.0.0','localhost','127.0.0.1']

LAST_ACTIVITY_INTERVAL_SECS = config('LAST_ACTIVITY_INTERVAL_SECS', default=300, cast=int)

EMAIL_HOST = 'smtp.sendgrid.net'
EMAIL_HOST_USER = 'apikey'
EMAIL_HOST_PASSWORD = config('SENDGRID_API_KEY')
EMAIL_PORT = 587
EMAIL_USE_TLS = True
DEFAULT_FROM_EMAIL = 'SPyPP - Departamento de Informática - UNSL'

CELERY_RESULT_BACKEND = config('DATABASE_URL')

DEBUG = config('DJANGO_DEBUG', default=True, cast=bool)

SECRET_KEY = config('SECRET_KEY', default='#lfqpze2(dodh-(p&boxq6)$1%$vs2qstkvbie0t$x8figm(w*')
STATICFILES_STORAGE = 'whitenoise.storage.CompressedManifestStaticFilesStorage'
STATIC_ROOT = os.path.join(BASE_DIR, 'staticfiles')
STATICFILES_DIRS = (
    os.path.join(BASE_DIR, 'static'),
)

PRIVATE_STORAGE_CLASS = 'private_storage.storage.s3boto3.PrivateS3BotoStorage'
AWS_ACCESS_KEY_ID = config('AWS_ACCESS_KEY_ID')
AWS_SECRET_ACCESS_KEY = config('AWS_SECRET_ACCESS_KEY')
AWS_PRIVATE_STORAGE_BUCKET_NAME = config('AWS_STORAGE_BUCKET_NAME')
AWS_PRIVATE_S3_CUSTOM_DOMAIN = '%s.s3.amazonaws.com' % AWS_PRIVATE_STORAGE_BUCKET_NAME
AWS_DEFAULT_ACL = None
PRIVATE_STORAGE_S3_REVERSE_PROXY = True
DEFAULT_FILE_STORAGE = 'storages.backends.s3boto3.S3Boto3Storage'

MEDIA_DIRECTORY = '/media/'
MEDIA_URL = 'https://%s/%s/' % (AWS_PRIVATE_S3_CUSTOM_DOMAIN, MEDIA_DIRECTORY)

AUTO_MIGRATE = True
DATABASES = {
    'default': dj_database_url.config(
        default=config('DATABASE_URL')
    )
}
