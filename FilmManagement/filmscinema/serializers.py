from rest_framework import  serializers
from .models import  Film,Cinema,Genre
from django.contrib.auth.models import User

class UserSerializer(serializers.ModelSerializer):
    films = serializers.PrimaryKeyRelatedField(many=True, queryset=Film.objects.all())
    cinemas = serializers.PrimaryKeyRelatedField(many=True, queryset=Cinema.objects.all())

    class Meta:
        model = User
        fields = ('id', 'username', 'films', 'cinemas')

class GenreSerializer(serializers.ModelSerializer):
    class Meta:
        model = Genre
        fields = ('id', 'name')
        depth = 1

class GenreWriteSerializer(serializers.ModelSerializer):

    class Meta:
        model = Genre
        fields = ('id', 'name')


class FilmSerializer(serializers.ModelSerializer):
    owner = serializers.ReadOnlyField(source='owner.username')

    class Meta:
        model = Film
        fields = ('id', 'title', 'year_prod', 'genre','presentation_date', 'owner')
        depth = 1

class FilmWriteSerializer(serializers.ModelSerializer):
    genre = serializers.PrimaryKeyRelatedField(queryset=Genre.objects.all(), allow_null=True)

    class Meta:
        model = Film
        fields = ('id', 'title', 'year_prod', 'genre','presentation_date')

class CinemaSerializer(serializers.ModelSerializer):
    
    owner = serializers.ReadOnlyField(source='owner.username')
    
    class Meta:
        model = Cinema
        fields = ('id', 'name', 'city', 'films', 'owner')
        depth = 1

class CinemaWriteSerializer(serializers.ModelSerializer):

    class Meta:
        model = Cinema
        fields = ('id', 'name', 'city', 'films', 'owner')
        #fields = ('id', 'name', 'city')
