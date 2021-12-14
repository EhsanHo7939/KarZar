from rest_framework.serializers import ModelSerializer, SerializerMethodField
from .models import Question, Vote
from django.contrib.auth import get_user_model


class QuestionSerializer(ModelSerializer):
    def get_author(self, obj):
        return {
            "username": obj.author.username,
            "first_name": obj.author.first_name,
            "last_name": obj.author.last_name,
            "email": obj.author.email,
        }

    author_info = SerializerMethodField("get_author")
   
    class Meta:
        model = Question
        fields = '__all__'
        

class UserSerializer(ModelSerializer):
    class Meta:
        model = get_user_model()
        fields = '__all__'


class VoteSerializer(ModelSerializer):
    def get_question(self, obj):
        return {
            "id": obj.question.id,
            "body": obj.question.Q_Body,
            "option_1": obj.question.Option_1,
            "option_2": obj.question.Option_2,
            "option_3": obj.question.Option_3,
            "option_4": obj.question.Option_4,
            "author": obj.question.author.username,
        }

    question_info = SerializerMethodField("get_question")

    class Meta:
        model = Vote
        fields = '__all__'

