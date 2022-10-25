from django.shortcuts import render


def home(request):
    context = {
        'title': 'Homepage',
    }
    return render(request, 'homeApp/home.html', context)
