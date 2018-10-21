# Generated by Django 2.1 on 2018-10-21 15:05

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('alumno', '0001_initial'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='user',
            name='es_alumno',
        ),
        migrations.RemoveField(
            model_name='user',
            name='es_comision_carrera',
        ),
        migrations.RemoveField(
            model_name='user',
            name='es_comision_pasantias',
        ),
        migrations.RemoveField(
            model_name='user',
            name='es_empresa',
        ),
        migrations.AddField(
            model_name='user',
            name='type',
            field=models.CharField(choices=[('AL', 'Alumno'), ('CC', 'Comision Carrera'), ('CP', 'Comision PPS'), ('EM', 'Empresa')], default='AL', max_length=2),
        ),
    ]
