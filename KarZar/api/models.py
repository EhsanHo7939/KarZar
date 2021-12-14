from django.db import models
from django.contrib.auth import get_user_model
from django.utils import timezone
from phonenumber_field.modelfields import PhoneNumberField

# Create your models here.

class Question(models.Model):

    Q_Body = models.TextField(blank=False)
    
    Option_1 = models.CharField(max_length=50, blank=False)
    Option_2 = models.CharField(max_length=50, blank=False)
    Option_3 = models.CharField(max_length=50, blank=True)
    Option_4 = models.CharField(max_length=50, blank=True)

    Option_1_count = models.IntegerField(default=0)
    Option_2_count = models.IntegerField(default=0)
    Option_3_count = models.IntegerField(default=0)
    Option_4_count = models.IntegerField(default=0)
    
    author = models.ForeignKey(get_user_model(), on_delete=models.CASCADE)
    publish = models.DateTimeField(default=timezone.now)
    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)


    def __str__(self):
        return self.Q_Body[:50]


    class Meta:
        ordering = ['-updated']


class Vote(models.Model):

    question = models.ForeignKey(Question, on_delete=models.CASCADE)

    Voter_Phone_Number = PhoneNumberField(null=True, blank=False)

    Voter_Fullname = models.CharField(max_length=50, blank=True)

    Voter_Choise = models.IntegerField(default=0)

    Voter_Opinion = models.TextField(blank=True)

    created = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return "Q {0} | V {1}".format(self.question.id, self.id)

    class Meta:
        ordering = ['-created']
    