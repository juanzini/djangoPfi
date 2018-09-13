# Generated by Django 2.1 on 2018-09-12 23:59

from django.conf import settings
import django.contrib.auth.models
import django.contrib.auth.validators
from django.db import migrations, models
import django.db.models.deletion
import django.utils.timezone


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('auth', '0009_alter_user_last_name_max_length'),
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
                ('email', models.EmailField(blank=True, max_length=254, verbose_name='email address')),
                ('is_staff', models.BooleanField(default=False, help_text='Designates whether the user can log into this admin site.', verbose_name='staff status')),
                ('is_active', models.BooleanField(default=True, help_text='Designates whether this user should be treated as active. Unselect this instead of deleting accounts.', verbose_name='active')),
                ('date_joined', models.DateTimeField(default=django.utils.timezone.now, verbose_name='date joined')),
                ('es_alumno', models.BooleanField(default=False)),
                ('es_docente', models.BooleanField(default=False)),
                ('es_comision_carrera', models.BooleanField(default=False)),
                ('es_comision_pasantias', models.BooleanField(default=False)),
                ('es_empresa', models.BooleanField(default=False)),
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
            name='Departamento',
            fields=[
                ('nombre', models.CharField(max_length=50, primary_key=True, serialize=False)),
            ],
        ),
        migrations.CreateModel(
            name='DirectorDepartamento',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('departamento', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, to='alumno.Departamento')),
            ],
        ),
        migrations.CreateModel(
            name='Docente',
            fields=[
                ('numero_registro', models.PositiveIntegerField(primary_key=True, serialize=False)),
                ('nombre', models.CharField(max_length=30)),
                ('apellido', models.CharField(max_length=20)),
                ('mail', models.EmailField(max_length=254, unique=True)),
                ('box_oficina', models.CharField(max_length=30)),
                ('departamento', models.OneToOneField(null=True, on_delete=django.db.models.deletion.DO_NOTHING, to='alumno.Departamento')),
            ],
        ),
        migrations.CreateModel(
            name='Empresa',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(max_length=50)),
                ('descripcion', models.TextField(max_length=500)),
                ('departamento', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, to='alumno.Departamento')),
            ],
        ),
        migrations.CreateModel(
            name='Entrevista',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('fecha', models.DateTimeField()),
                ('resultado', models.TextField(max_length=1000)),
                ('comentarios_empresa', models.TextField(max_length=1000)),
                ('comentarios_comision_pps', models.TextField(max_length=1000)),
            ],
        ),
        migrations.CreateModel(
            name='Postulaciones',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('fecha', models.DateTimeField()),
                ('empresa', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, to='alumno.Empresa')),
            ],
        ),
        migrations.CreateModel(
            name='Puesto',
            fields=[
                ('puesto_id', models.AutoField(primary_key=True, serialize=False)),
                ('nombre', models.CharField(max_length=50)),
                ('descripcion', models.TextField(max_length=1000)),
                ('dedicacion', models.PositiveSmallIntegerField()),
                ('horario', models.CharField(max_length=20)),
                ('remuneracion', models.DecimalField(decimal_places=2, default=0, max_digits=8)),
                ('empresa', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, to='alumno.Empresa')),
            ],
        ),
        migrations.CreateModel(
            name='SubcomisionCarrera',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('docente', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, to='alumno.Docente')),
            ],
        ),
        migrations.CreateModel(
            name='SubcomisionPasantiasPPS',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('departamento', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, to='alumno.Departamento')),
                ('docente', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, to='alumno.Docente')),
            ],
        ),
        migrations.CreateModel(
            name='TutorEmpresa',
            fields=[
                ('nombre', models.CharField(max_length=30)),
                ('apellido', models.CharField(max_length=20)),
                ('cargo', models.CharField(max_length=30)),
                ('mail', models.EmailField(max_length=254, primary_key=True, serialize=False)),
                ('empresa', models.OneToOneField(on_delete=django.db.models.deletion.DO_NOTHING, to='alumno.Empresa')),
            ],
        ),
        migrations.CreateModel(
            name='Alumno',
            fields=[
                ('numero_registro', models.PositiveIntegerField(unique=True)),
                ('mail', models.EmailField(max_length=254, unique=True)),
                ('curriculum', models.FileField(upload_to='curriculums/')),
                ('descripcion_intereses', models.TextField(max_length=500)),
                ('descripcion_habilidades', models.TextField(max_length=1000)),
                ('ultima_actualizacion_perfil', models.DateTimeField()),
                ('ultima_postulacion', models.DateTimeField()),
                ('ultimo_ingreso', models.DateTimeField()),
                ('primer_ingreso', models.DateTimeField(auto_now_add=True)),
                ('nombre', models.CharField(max_length=30)),
                ('apellido', models.CharField(max_length=20)),
                ('prioridad', models.PositiveSmallIntegerField()),
                ('condicion_acreditacion', models.NullBooleanField()),
                ('expedicion_acreditacion', models.TextField(max_length=500)),
                ('comentarios_comision_carrera', models.TextField(max_length=1000)),
                ('comentarios_carrera_visibles', models.BooleanField()),
                ('comentarios_comision_pps', models.TextField(max_length=1000)),
                ('user', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, primary_key=True, serialize=False, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='Carrera',
            fields=[
                ('nombre', models.CharField(max_length=100)),
                ('duracion', models.PositiveSmallIntegerField()),
                ('user', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, primary_key=True, serialize=False, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='Pasantia',
            fields=[
                ('fecha_inicio', models.DateTimeField(auto_now_add=True)),
                ('fecha_fin', models.DateTimeField()),
                ('entrevista', models.OneToOneField(on_delete=django.db.models.deletion.DO_NOTHING, primary_key=True, serialize=False, to='alumno.Entrevista')),
                ('informe', models.FileField(upload_to='informes/')),
                ('numero_legajo', models.PositiveIntegerField(null=True, unique=True)),
                ('comentarios_empresa', models.TextField(max_length=1000)),
                ('comentarios_comision_pps', models.TextField(max_length=1000)),
            ],
        ),
        migrations.AddField(
            model_name='entrevista',
            name='empresa',
            field=models.OneToOneField(on_delete=django.db.models.deletion.DO_NOTHING, to='alumno.Empresa'),
        ),
        migrations.AddField(
            model_name='empresa',
            name='user',
            field=models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL),
        ),
        migrations.AddField(
            model_name='docente',
            name='user',
            field=models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL),
        ),
        migrations.AddField(
            model_name='directordepartamento',
            name='docente',
            field=models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, to='alumno.Docente'),
        ),
        migrations.AddField(
            model_name='departamento',
            name='user',
            field=models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL),
        ),
        migrations.AddField(
            model_name='user',
            name='groups',
            field=models.ManyToManyField(blank=True, help_text='The groups this user belongs to. A user will get all permissions granted to each of their groups.', related_name='user_set', related_query_name='user', to='auth.Group', verbose_name='groups'),
        ),
        migrations.AddField(
            model_name='user',
            name='user_permissions',
            field=models.ManyToManyField(blank=True, help_text='Specific permissions for this user.', related_name='user_set', related_query_name='user', to='auth.Permission', verbose_name='user permissions'),
        ),
        migrations.AlterUniqueTogether(
            name='subcomisionpasantiaspps',
            unique_together={('departamento', 'docente')},
        ),
        migrations.AddField(
            model_name='subcomisioncarrera',
            name='carrera',
            field=models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, to='alumno.Carrera'),
        ),
        migrations.AddField(
            model_name='postulaciones',
            name='alumno',
            field=models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, to='alumno.Alumno'),
        ),
        migrations.AddField(
            model_name='pasantia',
            name='tutor_docente',
            field=models.OneToOneField(on_delete=django.db.models.deletion.DO_NOTHING, to='alumno.Docente'),
        ),
        migrations.AddField(
            model_name='pasantia',
            name='tutor_empresa',
            field=models.OneToOneField(on_delete=django.db.models.deletion.DO_NOTHING, to='alumno.TutorEmpresa'),
        ),
        migrations.AddField(
            model_name='entrevista',
            name='alumno',
            field=models.OneToOneField(on_delete=django.db.models.deletion.DO_NOTHING, to='alumno.Alumno'),
        ),
        migrations.AlterUniqueTogether(
            name='empresa',
            unique_together={('nombre', 'departamento')},
        ),
        migrations.AlterUniqueTogether(
            name='directordepartamento',
            unique_together={('departamento', 'docente')},
        ),
        migrations.AddField(
            model_name='carrera',
            name='departamento',
            field=models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, to='alumno.Departamento'),
        ),
        migrations.AddField(
            model_name='alumno',
            name='carrera',
            field=models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, to='alumno.Carrera'),
        ),
        migrations.AlterUniqueTogether(
            name='subcomisioncarrera',
            unique_together={('carrera', 'docente')},
        ),
        migrations.AlterUniqueTogether(
            name='postulaciones',
            unique_together={('empresa', 'alumno')},
        ),
        migrations.AlterUniqueTogether(
            name='entrevista',
            unique_together={('alumno', 'empresa')},
        ),
        migrations.AlterUniqueTogether(
            name='carrera',
            unique_together={('departamento', 'nombre')},
        ),
    ]
