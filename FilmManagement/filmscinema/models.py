from django.db import models

# Create your models here.

class Genre(models.Model):
    name = models.CharField(max_length=100)

    class Meta:
        ordering = ('name',)

    def __str__(self):
        return self.name

class Film(models.Model):
    title = models.CharField(max_length=100)
    year_prod = models.IntegerField()
    genre = models.ForeignKey(Genre, on_delete=models.CASCADE)
    presentation_date = models.DateTimeField()
    owner = models.ForeignKey(
        'auth.User',
        related_name='films',
        on_delete=models.CASCADE,
        null=True
    )
    class Meta:
        ordering = ('title',)

    def __str__(self):
        return '%s : %d' % (self.title,self.year_prod)

class Cinema(models.Model):
    name = models.CharField(max_length=200)
    city = models.CharField(max_length=100)
    films = models.ManyToManyField(Film)
    #films= models.ForeignKey(Film.title)
    owner = models.ForeignKey(
        'auth.User',
        related_name='cinemas',
        on_delete=models.CASCADE,
        null=True
    )

    class Meta:
        ordering = ('city',)
    
    def __str__(self):
        return '%s : %s' % (self.name,self.city)
