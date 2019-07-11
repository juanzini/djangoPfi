# Generated by Django 2.1 on 2019-03-24 17:23

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('alumno', '0002_auto_20190310_2043'),
    ]

    operations = [
        migrations.AddField(
            model_name='entrevista',
            name='aceptado_para_pasantia',
            field=models.BooleanField(blank=True, null=True),
        ),
        migrations.AlterField(
            model_name='postulacion',
            name='entrevista',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.DO_NOTHING, to='alumno.Entrevista'),
        ),
    ]