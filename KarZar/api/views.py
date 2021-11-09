from rest_framework.decorators import api_view
from rest_framework.response import Response
from .serializers import QuestionSerializer
from .models import Question


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
        },
        {
            'Endpoint': '/questions/create/',
            'method': 'POST',
            'body': {'body': ""},
            'description': 'Creates a new question object with data sent in post request'
        },
        {
            'Endpoint': '/questions/id/update/',
            'method': 'PUT',
            'body': {'body': ""},
            'description': 'Updates an existing question with data sent in put request'
        },
        {
            'Endpoint': '/questions/id/delete/',
            'method': 'DELETE',
            'body': None,
            'description': 'Deletes an existing question'
        },
        
        
    ]

    return Response(routes)


@api_view(['GET'])
def getQuestions(request):
    questions = Question.objects.all()
    serializer = QuestionSerializer(questions, many=True)
    return Response(serializer.data)


@api_view(['GET'])
def getQuestion(request, pk):
    question = Question.objects.get(id=pk)
    serializer = QuestionSerializer(question, many=False)
    return Response(serializer.data)


@api_view(['POST'])
def createQuestion(request):
    data = request.data

    question = Question.objects.create(
        Q_Body = data['Q_Body'],
        Option_1 = data['Option_1'],
        Option_2 = data['Option_2'],
        Option_3 = data['Option_3'],
        Option_4 = data['Option_4'],
    )
    
    serializer = QuestionSerializer(question, many=False)
    return Response(serializer.data)


@api_view(['PUT'])
def updateQuestion(request, pk):
    data = request.data

    question = Question.objects.get(id=pk)
    serializer = QuestionSerializer(question, data=request.data)
    if serializer.is_valid():
        serializer.save()

    return Response(serializer.data)


@api_view(['DELETE'])
def deleteQuestion(request, pk):
    question = Question.objects.get(id=pk)
    question.delete()
    return Response('Question was Deleted!')
