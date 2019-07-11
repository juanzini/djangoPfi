# Generated by Django 2.1 on 2019-03-10 23:43

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('alumno', '0001_initial'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='entrevista',
            name='cancelada_alumno',
        ),
        migrations.RemoveField(
            model_name='entrevista',
            name='cancelada_empresa',
        ),
        migrations.RemoveField(
            model_name='entrevista',
            name='confirmada_alumno',
        ),
        migrations.RemoveField(
            model_name='entrevista',
            name='notificado_alumno',
        ),
        migrations.AddField(
            model_name='entrevista',
            name='pasantia_aceptada',
            field=models.BooleanField(blank=True, null=True),
        ),
        migrations.AddField(
            model_name='entrevista',
            name='status',
            field=models.CharField(choices=[('COA', 'Confirmada Alumno'), ('NOA', 'Notificada Alumno'), ('CAA', 'Cancelada Alumno'), ('REA', 'Realizada'), ('CAE', 'Cancelada Empresa')], default='NOA', max_length=3),
        ),
        migrations.AlterField(
            model_name='entrevista',
            name='lugar',
            field=models.CharField(max_length=200),
        ),
    ]