# Generated by Django 5.0.4 on 2024-04-27 09:40

import django.db.models.deletion
from django.conf import settings
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('wedding', '0008_weddingparty_is_weekend_weddingparty_shift_party'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='cancel',
            name='employee_id',
        ),
        migrations.AddField(
            model_name='cancel',
            name='employee',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL),
        ),
        migrations.AlterField(
            model_name='cancel',
            name='cancel_date',
            field=models.DateTimeField(auto_now_add=True, null=True),
        ),
        migrations.AlterField(
            model_name='weddingparty',
            name='user',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='party_users', to=settings.AUTH_USER_MODEL),
        ),
    ]
