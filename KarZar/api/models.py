from django.db import models


# Create your models here.

class Question(models.Model):
    Q_Body = models.TextField(blank=False)
    
    Option_1 = models.TextField(blank=False)
    Option_2 = models.TextField(blank=False)
    Option_3 = models.TextField(blank=True)
    Option_4 = models.TextField(blank=True)

    Extra_Option = models.TextField(blank=True)
    updated = models.DateTimeField(auto_now=True)
    created = models.DateTimeField(auto_now_add=True)


    def __str__(self):
        return self.Q_Body[:50]


    class Meta:
        ordering = ['-updated']