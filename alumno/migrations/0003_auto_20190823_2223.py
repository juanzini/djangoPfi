# Generated by Django 2.2.1 on 2019-08-24 01:23

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('alumno', '0002_carrera_activa'),
    ]

    operations = [
        migrations.AlterField(
            model_name='alumno',
            name='carrera',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.DO_NOTHING, to='alumno.Carrera'),
        ),
    ]
