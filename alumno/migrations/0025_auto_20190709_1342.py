# Generated by Django 2.1 on 2019-07-09 16:42

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('alumno', '0024_alumno_progreso'),
    ]

    operations = [
        migrations.RenameField(
            model_name='subcomisioncarrera',
            old_name='docente',
            new_name='docentes',
        ),
    ]
