# Generated by Django 3.0.7 on 2020-11-15 19:27

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('spypp', '0002_auto_20201014_2021'),
    ]

    operations = [
        migrations.AlterField(
            model_name='puesto',
            name='fecha_inactivacion',
            field=models.DateField(default=datetime.datetime(2020, 11, 30, 16, 27, 30, 249561)),
        ),
    ]
