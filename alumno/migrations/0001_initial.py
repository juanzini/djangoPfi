# Generated by Django 2.2.3 on 2019-08-21 02:49

import alumno.models
import datetime
from django.conf import settings
import django.contrib.auth.models
import django.contrib.auth.validators
import django.core.validators
from django.db import migrations, models
import django.db.models.deletion
import django.utils.timezone
import private_storage.fields
import private_storage.storage.files


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('auth', '0011_update_proxy_permissions'),
    ]

    operations = [
        migrations.CreateModel(
            name='User',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('password', models.CharField(max_length=128, verbose_name='password')),
                ('last_login', models.DateTimeField(blank=True, null=True, verbose_name='last login')),
                ('is_superuser', models.BooleanField(default=False, help_text='Designates that this user has all permissions without explicitly assigning them.', verbose_name='superuser status')),
                ('username', models.CharField(error_messages={'unique': 'A user with that username already exists.'}, help_text='Required. 150 characters or fewer. Letters, digits and @/./+/-/_ only.', max_length=150, unique=True, validators=[django.contrib.auth.validators.UnicodeUsernameValidator()], verbose_name='username')),
                ('first_name', models.CharField(blank=True, max_length=30, verbose_name='first name')),
                ('last_name', models.CharField(blank=True, max_length=150, verbose_name='last name')),
                ('email', models.EmailField(max_length=254, unique=True, verbose_name='email address')),
                ('is_staff', models.BooleanField(default=False, help_text='Designates whether the user can log into this admin site.', verbose_name='staff status')),
                ('is_active', models.BooleanField(default=True, help_text='Designates whether this user should be treated as active. Unselect this instead of deleting accounts.', verbose_name='active')),
                ('date_joined', models.DateTimeField(default=django.utils.timezone.now, verbose_name='date joined')),
                ('tipo', models.CharField(choices=[('AL', 'Alumno'), ('CC', 'Comision Carrera'), ('CP', 'Comision PPS'), ('EM', 'Empresa')], default='AL', max_length=2)),
                ('groups', models.ManyToManyField(blank=True, help_text='The groups this user belongs to. A user will get all permissions granted to each of their groups.', related_name='user_set', related_query_name='user', to='auth.Group', verbose_name='groups')),
                ('user_permissions', models.ManyToManyField(blank=True, help_text='Specific permissions for this user.', related_name='user_set', related_query_name='user', to='auth.Permission', verbose_name='user permissions')),
            ],
            options={
                'verbose_name': 'user',
                'verbose_name_plural': 'users',
                'abstract': False,
            },
            managers=[
                ('objects', django.contrib.auth.models.UserManager()),
            ],
        ),
        migrations.CreateModel(
            name='Alumno',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('numero_registro', models.PositiveIntegerField(unique=True, validators=[alumno.models.Alumno.validate_hash])),
                ('curriculum', private_storage.fields.PrivateFileField(storage=private_storage.storage.files.PrivateFileSystemStorage(), upload_to=alumno.models.Alumno.curriculum_upload_path, verbose_name='Curriculum (.pdf)')),
                ('plan_de_estudio', private_storage.fields.PrivateFileField(storage=private_storage.storage.files.PrivateFileSystemStorage(), upload_to=alumno.models.Alumno.plan_upload_path, verbose_name='Plan de Estudio (.pdf)')),
                ('historia_academica', private_storage.fields.PrivateFileField(storage=private_storage.storage.files.PrivateFileSystemStorage(), upload_to=alumno.models.Alumno.historia_upload_path, verbose_name='Historia Académica (.pdf)')),
                ('descripcion_intereses', models.TextField(blank=True, max_length=500, null=True)),
                ('descripcion_habilidades', models.TextField(blank=True, max_length=1000, null=True)),
                ('ultima_actualizacion_perfil', models.DateField(default=datetime.date.today)),
                ('ultima_postulacion', models.DateField(blank=True, null=True)),
                ('condicion_acreditacion', models.NullBooleanField(verbose_name='Está en condición de acreditación')),
                ('expedicion_acreditacion', models.TextField(blank=True, max_length=500, null=True)),
                ('comentarios_comision_carrera', models.TextField(blank=True, max_length=1000, null=True)),
                ('comentarios_carrera_visibles', models.BooleanField(default=False, verbose_name='Comentarios visibles para las empresas')),
                ('comentarios_comision_pps', models.TextField(blank=True, max_length=1000, null=True)),
                ('perfil', private_storage.fields.PrivateFileField(blank=True, null=True, storage=private_storage.storage.files.PrivateFileSystemStorage(), upload_to=alumno.models.Alumno.perfil_upload_path)),
                ('progreso', models.SmallIntegerField(default=0, validators=[django.core.validators.MinValueValidator(0), django.core.validators.MaxValueValidator(100)], verbose_name='Progreso en %')),
            ],
            options={
                'verbose_name': 'Alumno',
                'verbose_name_plural': 'Alumnos',
            },
        ),
        migrations.CreateModel(
            name='Carrera',
            fields=[
                ('nombre', models.CharField(max_length=100, primary_key=True, serialize=False)),
            ],
            options={
                'verbose_name': 'Carrera',
                'verbose_name_plural': 'Carreras',
            },
        ),
        migrations.CreateModel(
            name='Departamento',
            fields=[
                ('nombre', models.CharField(max_length=50, primary_key=True, serialize=False)),
            ],
            options={
                'verbose_name': 'Departamento',
                'verbose_name_plural': 'Departamentos',
            },
        ),
        migrations.CreateModel(
            name='Docente',
            fields=[
                ('nombre', models.CharField(max_length=30)),
                ('apellido', models.CharField(max_length=20)),
                ('email', models.EmailField(max_length=254, primary_key=True, serialize=False)),
                ('box_oficina', models.CharField(max_length=30)),
                ('departamento', models.ForeignKey(null=True, on_delete=django.db.models.deletion.DO_NOTHING, to='alumno.Departamento')),
            ],
            options={
                'verbose_name': 'Docente',
                'verbose_name_plural': 'Docentes',
            },
        ),
        migrations.CreateModel(
            name='Empresa',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('descripcion', models.TextField(blank=True, max_length=1000, null=True)),
                ('url', models.URLField(blank=True, default='', null=True)),
                ('logo', private_storage.fields.PrivateFileField(blank=True, null=True, storage=private_storage.storage.files.PrivateFileSystemStorage(), upload_to=alumno.models.Empresa.logo_upload_path)),
                ('nombre_fantasia', models.CharField(max_length=200)),
                ('departamento', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='alumno.Departamento')),
                ('user', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, related_name='empresa_user', to=settings.AUTH_USER_MODEL)),
            ],
            options={
                'verbose_name': 'Empresa',
                'verbose_name_plural': 'Empresas',
                'unique_together': {('departamento', 'nombre_fantasia')},
            },
        ),
        migrations.CreateModel(
            name='Entrevista',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('fecha', models.DateTimeField()),
                ('lugar', models.CharField(max_length=200)),
                ('resultado', models.TextField(blank=True, max_length=1000, null=True)),
                ('pasantia_aceptada', models.BooleanField(blank=True, null=True)),
                ('comentarios_empresa', models.TextField(blank=True, max_length=1000, null=True, verbose_name='Comentarios para la Comisión de Pasantías')),
                ('comentarios_comision_pps', models.TextField(blank=True, max_length=1000, null=True, verbose_name='Comentarios de la Comisión de Pasantías')),
                ('status', models.CharField(choices=[('COA', 'Confirmada Alumno'), ('NOC', 'No Confirmada Alumno'), ('NOA', 'Notificada Alumno'), ('CAA', 'Cancelada Alumno'), ('REA', 'Realizada'), ('CAE', 'Cancelada Empresa')], default='NOA', max_length=3)),
                ('alumno', models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, to='alumno.Alumno')),
                ('empresa', models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, to='alumno.Empresa')),
            ],
            options={
                'verbose_name': 'Entrevista',
                'verbose_name_plural': 'Entrevistas',
                'unique_together': {('alumno', 'empresa', 'fecha')},
            },
        ),
        migrations.CreateModel(
            name='TutorEmpresa',
            fields=[
                ('nombre', models.CharField(max_length=30)),
                ('apellido', models.CharField(max_length=20)),
                ('cargo', models.CharField(max_length=30)),
                ('mail', models.EmailField(max_length=254, primary_key=True, serialize=False)),
                ('empresa', models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, to='alumno.Empresa')),
            ],
            options={
                'verbose_name': 'Tutor de Empresa',
                'verbose_name_plural': 'Tutores de Empresas',
            },
        ),
        migrations.CreateModel(
            name='SubcomisionPasantiasPPS',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('departamento', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, to='alumno.Departamento')),
                ('docentes', models.ManyToManyField(to='alumno.Docente', verbose_name='docentes')),
                ('user', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, related_name='pps_user', to=settings.AUTH_USER_MODEL)),
            ],
            options={
                'verbose_name': 'SubcomisionPasantiasPPS',
                'verbose_name_plural': 'SubcomisionesPasantiasPPS',
            },
        ),
        migrations.CreateModel(
            name='SubcomisionCarrera',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('carrera', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, related_name='carrera_comision', to='alumno.Carrera')),
                ('docentes', models.ManyToManyField(related_name='comision_docente', to='alumno.Docente', verbose_name='docentes')),
                ('user', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, related_name='carrera_user', to=settings.AUTH_USER_MODEL)),
            ],
            options={
                'verbose_name': 'SubcomisionCarrera',
                'verbose_name_plural': 'SubcomisionesCarreras',
            },
        ),
        migrations.CreateModel(
            name='Puesto',
            fields=[
                ('puesto_id', models.AutoField(primary_key=True, serialize=False)),
                ('nombre', models.CharField(choices=[('BE', 'Back-end'), ('FE', 'Front-end'), ('QA', 'Quality Assurance'), ('MB', 'Mobile - iOS'), ('AND', 'Mobile - Android'), ('IND', 'Indistinto'), ('OTR', 'Otro')], default='IND', max_length=3, verbose_name='Área')),
                ('descripcion_actividades', models.TextField(max_length=1000)),
                ('conocimientos_requeridos', models.TextField(max_length=1000)),
                ('horario', models.CharField(max_length=100)),
                ('rentado', models.BooleanField(default=False)),
                ('activo', models.BooleanField(default=True)),
                ('empresa', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='alumno.Empresa')),
            ],
            options={
                'verbose_name': 'Puesto',
                'verbose_name_plural': 'Puestos',
                'unique_together': {('empresa', 'nombre')},
            },
        ),
        migrations.CreateModel(
            name='Pasantia',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('fecha_inicio', models.DateField()),
                ('fecha_fin', models.DateField()),
                ('informe', models.FileField(blank=True, null=True, upload_to='informes/')),
                ('numero_legajo', models.PositiveIntegerField(blank=True, null=True, unique=True)),
                ('comentarios_empresa', models.TextField(blank=True, max_length=1000, null=True, verbose_name='Comentarios para la Comisión de Pasantías')),
                ('comentarios_comision_pps', models.TextField(blank=True, max_length=1000, null=True, verbose_name='Comentarios de la Comisión de Pasantías')),
                ('numero_de_expediente', models.PositiveIntegerField(blank=True, null=True, unique=True)),
                ('entrevista', models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, related_name='entrevista_pasantia', to='alumno.Entrevista')),
                ('tutor_docente', models.ForeignKey(null=True, on_delete=django.db.models.deletion.DO_NOTHING, to='alumno.Docente')),
                ('tutor_empresa', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.DO_NOTHING, to='alumno.TutorEmpresa')),
            ],
            options={
                'verbose_name': 'Pasantia',
                'verbose_name_plural': 'Pasantias',
            },
        ),
        migrations.AddField(
            model_name='carrera',
            name='departamento',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='alumno.Departamento'),
        ),
        migrations.AddField(
            model_name='carrera',
            name='subcomision_carrera',
            field=models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, related_name='carrera_comision', to='alumno.SubcomisionCarrera'),
        ),
        migrations.AddField(
            model_name='alumno',
            name='carrera',
            field=models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, to='alumno.Carrera'),
        ),
        migrations.AddField(
            model_name='alumno',
            name='user',
            field=models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, related_name='alumno_user', to=settings.AUTH_USER_MODEL),
        ),
        migrations.CreateModel(
            name='Postulacion',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('fecha', models.DateField(default=datetime.date.today)),
                ('fecha_desestimacion', models.DateField(blank=True, null=True)),
                ('activa', models.BooleanField(default=True)),
                ('alumno', models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, to='alumno.Alumno')),
                ('entrevista', models.OneToOneField(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='entrevista_postulacion', to='alumno.Entrevista')),
                ('puesto', models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, to='alumno.Puesto')),
            ],
            options={
                'verbose_name': 'Postulacion',
                'verbose_name_plural': 'Postulaciones',
                'unique_together': {('puesto', 'alumno')},
            },
        ),
        migrations.CreateModel(
            name='DirectorDepartamento',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('departamento', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, to='alumno.Departamento')),
                ('docente', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, to='alumno.Docente')),
            ],
            options={
                'verbose_name': 'Director de Departamento',
                'verbose_name_plural': 'Directores de Departamento',
                'unique_together': {('departamento', 'docente')},
            },
        ),
        migrations.AlterUniqueTogether(
            name='carrera',
            unique_together={('departamento', 'nombre')},
        ),
    ]
