from .permissions import IsStaffOrReadOnly, IsAuthorOrReadOnly, IsSuperUser
from .serializers import QuestionSerializer, VoteSerializer, UserSerializer
from .models import Question, Vote
from rest_framework.generics import ListCreateAPIView, RetrieveUpdateDestroyAPIView
# from rest_framework.permissions import IsAuthenticated
from django.contrib.auth import get_user_model


# Create your views here.

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
    permission_classes = (IsStaffOrReadOnly,)
    
    filterset_fields = ["author"]
    
    ordering_fields = [
        "publish",
        "created",
        "updated"
        ]
    
    search_fields = [
        "Q_Body",
        "author__username",
        "author__first_name",
        "author__last_name"
        ]


class QuestionDetail(RetrieveUpdateDestroyAPIView):
    queryset = Question.objects.all()
    serializer_class = QuestionSerializer
    permission_classes = (IsStaffOrReadOnly, IsAuthorOrReadOnly)


class VoteList(ListCreateAPIView):
    queryset = Vote.objects.all()
    serializer_class = VoteSerializer

    filterset_fields = ["question"]
    
    ordering_fields = [
        "question_id",
        "created"
        ]
    
    search_fields = [
        "Voter_Phone_Number",
        "Voter_Fullname",
        "Voter_Opinion"
        ]

class VoteDetail(RetrieveUpdateDestroyAPIView):
    queryset = Vote.objects.all()
    serializer_class = VoteSerializer
    permission_classes = (IsStaffOrReadOnly, )


class UserList(ListCreateAPIView):
    queryset = get_user_model().objects.all()
    serializer_class = UserSerializer
    filterset_fields = ["is_superuser", "is_staff", "is_active"]
    ordering_fields = []
    permission_classes = (IsSuperUser, )

class UserDetail(RetrieveUpdateDestroyAPIView):
    queryset = get_user_model().objects.all()
    serializer_class = UserSerializer
    permission_classes = (IsSuperUser, )
