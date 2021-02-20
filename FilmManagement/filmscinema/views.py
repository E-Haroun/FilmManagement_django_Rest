from django.shortcuts import render
from .models import  *
from .serializers import  *
from rest_framework.response import Response
from rest_framework import generics, permissions
#from .permissions import IsOwnerOrReadOnly
from rest_framework.decorators import api_view
import pdb
import requests
from rest_framework import generics
from rest_framework import mixins
from rest_framework.permissions import IsAuthenticated
from datetime import datetime

@api_view(['GET'])
def film_title(request,title= 'Games'):
   
    # Get a list of films that have the word 'hunger' in the title
    if request.method == 'GET':
        films = requests.get('http://www.omdbapi.com/?i=tt3896198&apikey=19f3d35d&type=movie&s={}'.format(title))
        json = films.json()
        a = []
        for key in json['Search']:

            films_dict = {}
            films_dict['title'] = key['Title']
            films_dict['year_prod'] = key['Year']
            films_dict['presentation_date'] = datetime.now()

            a.append(films_dict)
        serializedFilm = FilmSerializer(a, many=True)
        return Response(serializedFilm.data)

class UserList(generics.ListCreateAPIView):
    #permission_classes = (IsAuthenticated,)
    queryset = User.objects.all()
    serializer_class = UserSerializer

class UserDetail(generics.RetrieveUpdateDestroyAPIView):
    queryset = User.objects.all()
    lookup_field = 'id'
    serializer_class = UserSerializer

class FilmList(generics.ListCreateAPIView):
    #permission_classes = (permissions.IsAuthenticatedOrReadOnly, IsOwnerOrReadOnly)
    queryset = Film.objects.all()

    def get(self, request, *args, **kwargs):
        k = request.GET.keys()
        filter_dict = {}
        if(k):
            for key, value in request.GET.items():
                filter_dict[key] = value
            films = Film.objects.filter(**filter_dict)
            serialized_films = FilmSerializer(films, many=True)
            return Response(serialized_films.data)
        else:
            return Response(FilmSerializer(Film.objects.all(), many=True).data)

    def perform_create(self, serializer):
        serializer.save(owner=self.request.user)

    def get_serializer_class(self):
        if(self.request.method == 'GET'):
            return FilmSerializer
        return FilmWriteSerializer

class FilmDetail(generics.RetrieveUpdateDestroyAPIView):
    queryset = Film.objects.all()
    #permission_classes = (permissions.IsAuthenticatedOrReadOnly, IsOwnerOrReadOnly)
    serializer_class = FilmSerializer
    lookup_field = 'id'
    def get_serializer_class(self):
        if(self.request.method == 'GET'):
            return FilmSerializer
        return FilmWriteSerializer

class CinemaList(generics.ListCreateAPIView):
    queryset = Cinema.objects.all()
    serializer_class = CinemaSerializer()
    #permission_classes = (permissions.IsAuthenticatedOrReadOnly,IsOwnerOrReadOnly)
    def get(self, request, *args, **kwargs):
        k = request.GET.keys()
        filter_dict = {}
        if(k):
            for key, value in request.GET.items():
                filter_dict[key] = value
            cinemas = Cinema.objects.filter(**filter_dict)
            serialized_cinemas = CinemaSerializer(cinemas, many=True)
            return Response(serialized_cinemas.data)
        else:
            return Response(CinemaSerializer(Cinema.objects.all(), many=True).data)

    def get_serializer_class(self):
        if(self.request.method == 'GET'):
            return CinemaSerializer
        return CinemaWriteSerializer

    def perform_create(self, serializer):
        serializer.save(owner=self.request.user)

class CinemaDetail(generics.RetrieveUpdateDestroyAPIView):

    queryset = Cinema.objects.all()
    #permission_classes = (permissions.IsAuthenticatedOrReadOnly, IsOwnerOrReadOnly)
    serializer_class = CinemaSerializer
    lookup_field = 'id'
    def get_serializer_class(self):
        if(self.request.method == 'GET'):
            return CinemaSerializer
        return CinemaWriteSerializer

class GenreList(generics.ListCreateAPIView):
    queryset = Genre.objects.all()
    serializer_class = GenreSerializer
    def get_serializer_class(self):
        if(self.request.method == 'GET'):
            return GenreSerializer
        return GenreWriteSerializer

class GenreDetail(generics.RetrieveUpdateDestroyAPIView):
    queryset = Genre.objects.all()
    serializer_class = GenreSerializer
    lookup_field = 'id'
    def get_serializer_class(self):
        if(self.request.method == 'GET'):
            return GenreSerializer
        return GenreWriteSerializer
        
@api_view(['GET'])
def filmcinema(request,id):
    cinema = Cinema.objects.filter(films__id=id)
    serializer = CinemaSerializer(cinema,many=True)
    return Response(serializer.data)

@api_view(['GET'])
def filmgenre(request,id):
    film = Film.objects.filter(genre__id=id)
    serializer = FilmSerializer(film,many=True)
    return Response(serializer.data)