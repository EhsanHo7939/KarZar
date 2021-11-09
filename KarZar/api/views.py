from rest_framework.decorators import api_view
from rest_framework.response import Response


# Create your views here.

@api_view(['GET'])
def getRoutes(request):
    routes = [
        {
            'Endpoint': '/test1/',
            'method': 'GET',
            'body': None,
            'description': 'Returns Test1'
        },
        {
            'Endpoint': '/test2/',
            'method': 'GET',
            'body': None,
            'description': 'Returns Test2'
        },
        {
            'Endpoint': '/test3/',
            'method': 'GET',
            'body': None,
            'description': 'Returns Test3'
        },
        {
            'Endpoint': '/test4/',
            'method': 'GET',
            'body': None,
            'description': 'Returns Test4'
        },
        
    ]

    return Response(routes)