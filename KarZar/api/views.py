from rest_framework.decorators import api_view
from rest_framework.response import Response
from .serializers import QuestionSerializer, VoteSerializer, UserSerializer
from .models import Question, Vote
from rest_framework.generics import ListCreateAPIView, RetrieveUpdateDestroyAPIView
# from rest_framework.permissions import IsAuthenticated
from django.contrib.auth import get_user_model


# Create your views here.

@api_view(['GET'])
def getRoutes(request):
    routes = [
        {
            'Endpoint': '/questions/',
            'method': 'GET',
            'body': None,
            'description': 'Returns an array of questions'
        },
        {
            'Endpoint': '/questions/id/',
            'method': 'GET',
            'body': None,
            'description': 'Returns a single question object'
        },        {
            'Endpoint': '/votes/',
            'method': 'GET',
            'body': None,
            'description': 'Returns an array of votes'
        },
        {
            'Endpoint': '/votes/id/',
            'method': 'GET',
            'body': None,
            'description': 'Returns a single vote object'
        },        {
            'Endpoint': '/users/',
            'method': 'GET',
            'body': None,
            'description': 'Returns an array of users'
        },
        {
            'Endpoint': '/users/id/',
            'method': 'GET',
            'body': None,
            'description': 'Returns a single user object'
        },

        
        
    ]

    return Response(routes)


# @api_view(['GET'])
# def getQuestions(request):
#     questions = Question.objects.all()
#     serializer = QuestionSerializer(questions, many=True)
#     return Response(serializer.data)


# @api_view(['GET'])
# def getQuestion(request, pk):
#     question = Question.objects.get(id=pk)
#     serializer = QuestionSerializer(question, many=False)
#     return Response(serializer.data)


# @api_view(['POST'])
# def createQuestion(request):
#     data = request.data

#     question = Question.objects.create(
#         Q_Body = data['Q_Body'],
#         Option_1 = data['Option_1'],
#         Option_2 = data['Option_2'],
#         Option_3 = data['Option_3'],
#         Option_4 = data['Option_4'],
#     )
    
#     serializer = QuestionSerializer(question, many=False)
#     return Response(serializer.data)


# @api_view(['PUT'])
# def updateQuestion(request, pk):
#     data = request.data

#     question = Question.objects.get(id=pk)
#     serializer = QuestionSerializer(question, data=request.data)
#     if serializer.is_valid():
#         serializer.save()

#     return Response(serializer.data)


# @api_view(['DELETE'])
# def deleteQuestion(request, pk):
#     question = Question.objects.get(id=pk)
#     question.delete()
#     return Response('Question was Deleted!')


# ---------------------------------------------------------------------------------

class QuestionList(ListCreateAPIView):
    queryset = Question.objects.all()
    serializer_class = QuestionSerializer


class QuestionDetail(RetrieveUpdateDestroyAPIView):
    queryset = Question.objects.all()
    serializer_class = QuestionSerializer


class VoteList(ListCreateAPIView):
    queryset = Vote.objects.all()
    serializer_class = VoteSerializer


class VoteDetail(RetrieveUpdateDestroyAPIView):
    queryset = Vote.objects.all()
    serializer_class = VoteSerializer


class UserList(ListCreateAPIView):
    queryset = get_user_model().objects.all()
    serializer_class = UserSerializer


class UserDetail(RetrieveUpdateDestroyAPIView):
    queryset = get_user_model().objects.all()
    serializer_class = UserSerializer
