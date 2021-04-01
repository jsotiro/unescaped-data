from django.http import HttpResponse
from django.shortcuts import render
from django.template import loader



template_root = 'unescaped_data'

def index(request):
    template = loader.get_template(template_root+'/index.html')
    return HttpResponse(template.render(None, request))


def post_data(request):
    data = request.POST['data']
    auto_escape =  'on'
    if 'auto_escape' in request.POST:
        auto_escape =  request.POST['auto_escape']
    return render(request, '{}/results_auto_escape_{}.html'.format(template_root, auto_escape), {'data': data})
