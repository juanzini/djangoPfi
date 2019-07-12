import os
import dj_database_url
from decouple import config

BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

ALLOWED_HOSTS = ['*']

LAST_ACTIVITY_INTERVAL_SECS = config('LAST_ACTIVITY_INTERVAL_SECS', default=300, cast=int)

EMAIL_HOST = config('EMAIL_HOST', default='smtp.gmail.com')
EMAIL_PORT = config('EMAIL_PORT', default=465, cast=int)
EMAIL_HOST_USER = config('EMAIL_HOST_USER')
EMAIL_HOST_PASSWORD = config('EMAIL_HOST_PASSWORD')

CELERY_RESULT_BACKEND = config('DATABASE_URL')

DEBUG = config('DJANGO_DEBUG', default=True, cast=bool)

SECRET_KEY = config('SECRET_KEY', default='#lfqpze2(dodh-(p&boxq6)$1%$vs2qstkvbie0t$x8figm(w*')

STATIC_ROOT = os.path.join(BASE_DIR, 'staticfiles')

PRIVATE_STORAGE_CLASS = 'private_storage.storage.s3boto3.PrivateS3BotoStorage'
AWS_ACCESS_KEY_ID = config('AWS_ACCESS_KEY_ID')
AWS_SECRET_ACCESS_KEY = config('AWS_SECRET_ACCESS_KEY')
AWS_PRIVATE_STORAGE_BUCKET_NAME = config('AWS_STORAGE_BUCKET_NAME')

AWS_PRIVATE_S3_CUSTOM_DOMAIN = '%s.s3.amazonaws.com' % AWS_PRIVATE_STORAGE_BUCKET_NAME
AWS_PRIVATE_S3_OBJECT_PARAMETERS = {
    'CacheControl': 'max-age=86400',
}

AWS_LOCATION = 'static'

STATICFILES_DIRS = [
    os.path.join(BASE_DIR, 'spypp/media'),
]
STATIC_URL = 'https://%s/%s/' % (AWS_PRIVATE_S3_CUSTOM_DOMAIN, AWS_LOCATION)
STATICFILES_STORAGE = 'storages.backends.s3boto3.S3Boto3Storage'

DATABASES = {
    'default': dj_database_url.config(
        default=config('DATABASE_URL')
    )
}