# Generated by Django 3.2.9 on 2021-12-10 14:01

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion
import django.utils.timezone
import phonenumber_field.modelfields


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='Question',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('Q_Body', models.TextField()),
                ('Option_1', models.TextField(max_length=50)),
                ('Option_2', models.TextField(max_length=50)),
                ('Option_3', models.TextField(blank=True, max_length=50)),
                ('Option_4', models.TextField(blank=True, max_length=50)),
                ('Option_1_count', models.IntegerField(default=0)),
                ('Option_2_count', models.IntegerField(default=0)),
                ('Option_3_count', models.IntegerField(default=0)),
                ('Option_4_count', models.IntegerField(default=0)),
                ('publish', models.DateTimeField(default=django.utils.timezone.now)),
                ('created', models.DateTimeField(auto_now_add=True)),
                ('updated', models.DateTimeField(auto_now=True)),
                ('author', models.ForeignKey(default=1, on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
            options={
                'ordering': ['-updated'],
            },
        ),
        migrations.CreateModel(
            name='Vote',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('Voter_Phone_Number', phonenumber_field.modelfields.PhoneNumberField(max_length=128, null=True, region=None, unique=True)),
                ('Voter_Fullname', models.CharField(blank=True, max_length=50)),
                ('Voter_Choise', models.IntegerField(default=0)),
                ('Voter_Opinion', models.TextField(blank=True)),
                ('created', models.DateTimeField(auto_now_add=True)),
                ('question', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='api.question')),
            ],
            options={
                'ordering': ['-created'],
            },
        ),
    ]
