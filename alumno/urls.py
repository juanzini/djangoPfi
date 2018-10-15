from django.urls import path, include
from . import views
from registration.backends.simple.views import RegistrationView

# Create a new class that redirects the user to the index page, if successful at logging
class MyRegistrationView(RegistrationView):
    def get_success_url(self,request, user):
        return '3024212/'


urlpatterns = [
	path('', views.BaseView.as_view(), name='base'),
	path('index', views.IndexView.as_view(), name='index'),
	path('', include('registration.backends.simple.urls')),
	path('create', views.CreateAlumnoView.as_view(), name='create-alumno'),
	path('list', views.ListAlumnoView.as_view(), name='list-alumno'),
	path('detail/<int:num_reg>', views.DetailAlumnoView.as_view(), name='detail-alumno'),
	path('edit/<int:num_reg>', views.EditAlumnoView.as_view(), name='edit-alumno'),
]