# Generated by Django 2.1 on 2018-11-04 18:41

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('alumno', '0006_auto_20181104_1435'),
    ]

    operations = [
        migrations.AlterField(
            model_name='alumno',
            name='prioridad',
            field=models.PositiveSmallIntegerField(verbose_name='Año que cursa'),
        ),
        migrations.AlterField(
            model_name='user',
            name='username',
            field=models.CharField(blank=True, max_length=1),
        ),
    ]