from django.forms import ModelForm

from .models import PushApplication


class PushAppForm(ModelForm):
    class Meta:
        model = PushApplication
        fields = ['name', 'vapid_key']
