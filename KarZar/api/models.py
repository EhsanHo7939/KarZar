from django.db import models


# Create your models here.

class Question(models.Model):
    Q_Body = models.TextField()
    
    Option_1 = models.TextField()
    Option_2 = models.TextField()
    Option_3 = models.TextField()
    Option_4 = models.TextField()

    Extra_Option = models.TextField()
    updated = models.DateTimeField(auto_now=True)
    created = models.DateTimeField(auto_now_add=True)


    def __str__(self):
        return self.Q_Body[:30]


    class Meta:
        ordering = ['-updated']