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
	path('<int:pk>/', views.DetailView.as_view(), name='detail'),
	path('', include('registration.backends.simple.urls')),
]