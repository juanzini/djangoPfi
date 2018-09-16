# Generated by Django 2.1 on 2018-09-16 16:14

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('alumno', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='alumno',
            name='comentarios_carrera_visibles',
            field=models.BooleanField(default=False),
        ),
        migrations.AlterField(
            model_name='alumno',
            name='comentarios_comision_carrera',
            field=models.TextField(max_length=1000, null=True),
        ),
        migrations.AlterField(
            model_name='alumno',
            name='comentarios_comision_pps',
            field=models.TextField(max_length=1000, null=True),
        ),
        migrations.AlterField(
            model_name='alumno',
            name='curriculum',
            field=models.FileField(null=True, upload_to='curriculums/'),
        ),
        migrations.AlterField(
            model_name='alumno',
            name='descripcion_habilidades',
            field=models.TextField(max_length=1000, null=True),
        ),
        migrations.AlterField(
            model_name='alumno',
            name='descripcion_intereses',
            field=models.TextField(max_length=500, null=True),
        ),
        migrations.AlterField(
            model_name='alumno',
            name='expedicion_acreditacion',
            field=models.TextField(max_length=500, null=True),
        ),
        migrations.AlterField(
            model_name='alumno',
            name='primer_ingreso',
            field=models.DateField(auto_now_add=True),
        ),
        migrations.AlterField(
            model_name='alumno',
            name='ultima_actualizacion_perfil',
            field=models.DateField(default=datetime.date.today),
        ),
        migrations.AlterField(
            model_name='alumno',
            name='ultima_postulacion',
            field=models.DateField(null=True),
        ),
        migrations.AlterField(
            model_name='alumno',
            name='ultimo_ingreso',
            field=models.DateField(default=datetime.date.today),
        ),
    ]
