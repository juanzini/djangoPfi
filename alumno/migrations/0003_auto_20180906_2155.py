# Generated by Django 2.1 on 2018-09-07 00:55

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('alumno', '0002_auto_20180904_2146'),
    ]

    operations = [
        migrations.CreateModel(
            name='DirectorDepartamento',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
            ],
        ),
        migrations.RemoveField(
            model_name='carrera',
            name='super_usuario',
        ),
        migrations.RemoveField(
            model_name='departamento',
            name='super_usuario',
        ),
        migrations.AlterField(
            model_name='alumno',
            name='carrera',
            field=models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, to='alumno.Carrera'),
        ),
        migrations.AlterField(
            model_name='docente',
            name='departamento',
            field=models.OneToOneField(null=True, on_delete=django.db.models.deletion.DO_NOTHING, to='alumno.Departamento'),
        ),
        migrations.AlterField(
            model_name='entrevista',
            name='alumno',
            field=models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, to='alumno.Alumno'),
        ),
        migrations.AlterField(
            model_name='entrevista',
            name='empresa',
            field=models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, to='alumno.Empresa'),
        ),
        migrations.AlterField(
            model_name='pasantia',
            name='entrevista',
            field=models.OneToOneField(on_delete=django.db.models.deletion.DO_NOTHING, primary_key=True, serialize=False, to='alumno.Entrevista'),
        ),
        migrations.AlterField(
            model_name='pasantia',
            name='tutor_docente',
            field=models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, to='alumno.Docente'),
        ),
        migrations.AlterField(
            model_name='pasantia',
            name='tutor_empresa',
            field=models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, to='alumno.TutorEmpresa'),
        ),
        migrations.AlterField(
            model_name='tutorempresa',
            name='empresa',
            field=models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, to='alumno.Empresa'),
        ),
        migrations.DeleteModel(
            name='SuperUsuario',
        ),
        migrations.AddField(
            model_name='directordepartamento',
            name='departamento',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='alumno.Departamento'),
        ),
        migrations.AddField(
            model_name='directordepartamento',
            name='docente',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='alumno.Docente'),
        ),
        migrations.AlterUniqueTogether(
            name='directordepartamento',
            unique_together={('departamento', 'docente')},
        ),
    ]
