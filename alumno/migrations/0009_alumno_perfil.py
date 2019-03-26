# Generated by Django 2.1 on 2019-03-25 00:13

import alumno.models
from django.db import migrations
import private_storage.fields
import private_storage.storage.files


class Migration(migrations.Migration):

    dependencies = [
        ('alumno', '0008_auto_20190324_1532'),
    ]

    operations = [
        migrations.AddField(
            model_name='alumno',
            name='perfil',
            field=private_storage.fields.PrivateFileField(blank=True, null=True, storage=private_storage.storage.files.PrivateFileSystemStorage(), upload_to=alumno.models.Alumno.perfil_upload_path),
        ),
    ]
