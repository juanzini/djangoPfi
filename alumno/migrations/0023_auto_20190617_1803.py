# Generated by Django 2.1 on 2019-06-17 21:03

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('alumno', '0022_auto_20190617_1801'),
    ]

    operations = [
        migrations.AlterField(
            model_name='pasantia',
            name='entrevista',
            field=models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, related_name='entrevista_pasantia', to='alumno.Entrevista'),
        ),
    ]