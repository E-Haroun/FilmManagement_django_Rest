from django.urls import path
from django.contrib import admin
from rest_framework.urlpatterns import format_suffix_patterns
from . import views
from rest_framework_simplejwt.views import TokenObtainPairView,TokenRefreshView

urlpatterns = [
    path('admin/', admin.site.urls),

    path('users/', views.UserList.as_view()),
    path('users/<int:id>/', views.UserDetail.as_view()),
    
    path('genre/', views.GenreList.as_view(),name='genre'),
    path('genre/<int:id>/', views.GenreDetail.as_view(),name='genre'),   
    
    path('films/', views.FilmList.as_view(),name='films'),
    path('films/<int:id>/', views.FilmDetail.as_view(),name='films'),

    path('cinema/', views.CinemaList.as_view()),
    path('cinema/<int:id>/', views.CinemaDetail.as_view(),name='Cinema'),
    
    path('title/<title>/', views.film_title,name='filmtitles'),
    path('title/', views.film_title),
   
    path('filc/<int:id>/', views.filmcinema),
    path('filg/<int:id>/', views.filmgenre),
    
    path('api/token/', TokenObtainPairView.as_view(), name='token_obtain_pair'),
    path('api/token/refresh/', TokenRefreshView.as_view(), name='token_refresh'),

]
urlpatterns = format_suffix_patterns(urlpatterns)
