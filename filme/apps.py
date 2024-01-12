from django.apps import AppConfig


class FilmeConfig(AppConfig):
    default_auto_field = 'django.db.models.BigAutoField'
    name = 'filme'

    #Getting or Creating superuser
    def ready(self):
        from .models import Usuario
        import os

        email     =   os.getenv('EMAIL_ADMIN')
        password  = os.getenv('PASSWORD_ADMIN')

        users = Usuario.objects.filter(email=email)
        if not users:
            Usuario.objects.create_superuser(username="admin",email=email,password=password,
                                             is_active=True,is_staff=True)


