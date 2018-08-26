from django.shortcuts import render
# Create your views here.
from django.http import HttpResponse


def index(request):
    return HttpResponse("<h1> HELLOW !!!</h1> <br> <h2> Demo is comming SOON!")
