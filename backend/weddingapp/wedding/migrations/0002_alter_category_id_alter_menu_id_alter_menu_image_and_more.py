# Generated by Django 5.0.4 on 2024-04-11 14:32

import cloudinary.models
import uuid
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('wedding', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='category',
            name='id',
            field=models.UUIDField(default=uuid.uuid4, editable=False, primary_key=True, serialize=False),
        ),
        migrations.AlterField(
            model_name='menu',
            name='id',
            field=models.UUIDField(default=uuid.uuid4, editable=False, primary_key=True, serialize=False),
        ),
        migrations.AlterField(
            model_name='menu',
            name='image',
            field=cloudinary.models.CloudinaryField(max_length=255, null=True, verbose_name='menu'),
        ),
        migrations.AlterField(
            model_name='service',
            name='id',
            field=models.UUIDField(default=uuid.uuid4, editable=False, primary_key=True, serialize=False),
        ),
        migrations.AlterField(
            model_name='user',
            name='avatar',
            field=cloudinary.models.CloudinaryField(max_length=255, null=True, verbose_name='avatar'),
        ),
        migrations.AlterField(
            model_name='weddinghall',
            name='id',
            field=models.UUIDField(default=uuid.uuid4, editable=False, primary_key=True, serialize=False),
        ),
        migrations.AlterField(
            model_name='weddinghall',
            name='image',
            field=cloudinary.models.CloudinaryField(max_length=255, null=True, verbose_name='hall'),
        ),
    ]
