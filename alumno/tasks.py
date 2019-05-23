from __future__ import absolute_import, unicode_literals
from celery import shared_task
from datetime import datetime, timedelta
from django.template.loader import render_to_string
from django.core.mail import EmailMessage
from django.core.serializers import serialize
from smtplib import SMTPRecipientsRefused

from alumno.models import Postulacion, Docente

TIMEOUTDAYS = 60

@shared_task
def postulationResponseTimeOutInTwoDays():
    postulaciones = Postulacion.objects.filter(fecha__lte=datetime.combine(datetime.now(), datetime.max.time()) - timedelta(days=TIMEOUTDAYS - 2), activa=True)
    for postulacion in postulaciones:
        context = {
            'postulacion': postulacion,
            'dias': abs((postulacion.fecha - (datetime.now() - timedelta(days=TIMEOUTDAYS)).date()).days)
        }
        message = render_to_string(
            template_name='emails/postulacion_por_vencer.txt',
            context=context
        )
        docentes = Docente.objects.filter(comision_docente=postulacion.alumno.carrera.carrera_comision)
        email = EmailMessage('Pronto se vence la postulacion de ' + postulacion.alumno.user.first_name + ' ' + postulacion.alumno.user.last_name + '!!',
                             message,
                             to=[postulacion.puesto.empresa.user.email] + list(docente.email for docente in docentes))
        try:
            email.send()
        except SMTPRecipientsRefused:
            None
    return serialize('json', postulaciones)


@shared_task
def postulationResponseTimeOut():
    postulaciones = Postulacion.objects.filter(fecha__lte=datetime.combine(datetime.now(), datetime.max.time()) - timedelta(days=TIMEOUTDAYS), activa=True)
    for postulacion in postulaciones:
        context = {
            'postulacion': postulacion
        }
        message = render_to_string(
            template_name='emails/desestimacion_postulacion_alumno.txt',
            context=context
        )
        docentes = Docente.objects.filter(comision_docente=postulacion.alumno.carrera.carrera_comision)
        email = EmailMessage(
            postulacion.alumno.user.first_name + " desestimaron tu postulacion de pasantía.",
            message,
            to=[postulacion.alumno.user.email] + list(docente.email for docente in docentes))
        try:
            email.send()
        except SMTPRecipientsRefused:
            None
    return serialize('json', postulaciones)
