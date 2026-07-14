from django.shortcuts import render
import json
from django.http.response import HttpResponse, HttpResponseRedirect, JsonResponse
from maps.home.models import conred, riesgo
from django.db.models import Avg, Count
import re
import os
from django.db.models import Q

def mobile(request):
    MOBILE_AGENT_RE=re.compile(r".*(iphone|mobile|androidtouch)",re.IGNORECASE)
    if MOBILE_AGENT_RE.match(request.META['HTTP_USER_AGENT']):
        return True
    else:
        return False

        
def ranking_dep(codigo, codMun):
    ranking=conred.objects.filter(codigo=codigo).order_by('ranking')
    n=0
    for rank in ranking:
        n=n+1
        if(rank.cod_municipio==codMun):
            break
    return n

def generarReporte(codMun, codRepo):
    if (codRepo == 0 or codMun == 0):
        return {'info': None, 'data':None, 'cods':''}#, 'dept': None}
    elif (codRepo == 1):
        value=conred.objects.filter(cod_municipio=codMun).first()
        return {'info':1, 'data':value, 'cods':'['+str(codMun)+']'}#, 'dept': ranking_dep(value.codigo, codMun)}

def generarComparativa(request):
    cods = []
    deptos = []
    for key in request.POST:
        if 'Cods' in key:
            #print(key)
            value = request.POST[key]
            if(int(value)>99):
                cods.append(int(value))
            else:
                deptos.append(int(value))
    comparacion=conred.objects.filter(Q(cod_municipio__in=cods) | Q(codigo__in=deptos))
    return {'info': 2, 'data':comparacion, 'cods':cods}
    #print (comparacion)



def index(request):
    estados=riesgo.objects.all().order_by('id')
    municipios=conred.objects.all().order_by('cod_municipio')
    context = {
        'estados':estados,
        'municipios':municipios,
        'nbar':0,
        'mobile':mobile(request),
        'text': 'INFORM- Guatemala 2021',
        'host': os.environ.get('HOST')
    }
    return render(request, "home/index.html", context)




def home(request):
    estados=riesgo.objects.all().order_by('id')
    municipios=conred.objects.all().order_by('cod_municipio')
    context = {
        'estados':estados,
        'municipios':municipios,
        'nbar':1,
        'mobile':mobile(request),
        'text': 'INFORM- Guatemala 2021',
        'text2': 'riesgo',
        'host': os.environ.get('HOST')
    }
    return render(request, "home/home.html", context)


def peligro(request):
    estados=riesgo.objects.all().order_by('id')
    municipios=conred.objects.all().order_by('cod_municipio')
    context = {
        'estados':estados,
        'municipios':municipios,
        'nbar' :2,
        'mobile':mobile(request),
        'text': 'INFORM- Guatemala 2021',
        'text2': 'peligro y exposición',
        'host': os.environ.get('HOST')
    }
    return render(request, "home/peligro.html", context)


def vulnerabilidad(request):
    estados=riesgo.objects.all().order_by('id')
    municipios=conred.objects.all().order_by('cod_municipio')
    context = {
        'estados':estados,
        'municipios':municipios,
        'nbar' :3,
        'mobile':mobile(request),
        'text': 'INFORM- Guatemala 2021',
        'text2': 'vulnerabilidad',
        'host': os.environ.get('HOST')
    }
    return render(request, "home/vulnerabilidad.html", context)

def falta(request):
    estados=riesgo.objects.all().order_by('id')
    municipios=conred.objects.all().order_by('cod_municipio')
    context = {
        'estados':estados,
        'municipios':municipios,
        'nbar' :4,
        'mobile':mobile(request),
        'text': 'INFORM- Guatemala 2021',
        'text2': 'falta de capacidad de respuesta',
        'host': os.environ.get('HOST')
    }
    return render(request, "home/falta.html", context)


def generar (request):
    estados=riesgo.objects.all().order_by('id')
    municipios=conred.objects.all().order_by('cod_municipio')
    departamentos=conred.objects.values('codigo', 'departamento').order_by('codigo').distinct()
    context=None
    if request.method == 'GET':
        context = {
            'estados':estados,
            'departamentos':departamentos,
            'municipios':municipios,
            'nbar' :5,
            'mobile':mobile(request),
            'host': os.environ.get('HOST')
        }
    else:
        codMun = int (request.POST.get('municipio', -1))
        codRepo = int(request.POST.get('reporte'), 0)
        rep=None
        if(codRepo==1):
            rep=generarReporte(codMun, codRepo)
        elif(codRepo==2):
            rep=generarComparativa(request)
        context = {
            'estados':estados,
            'departamentos':departamentos,
            'municipios':municipios,
            'nbar' :5,
            'mobile':mobile(request),
            'cods':rep['cods'],
            'info':rep['info'],
            'codMun':codMun,
            'data':rep['data'],
            'host': os.environ.get('HOST')
        }
    return render(request, "home/generar.html", context)


def indicador_promedio_dash1(municipio, aj_riesgo):
    varRiesgo=riesgo.objects.filter(pk=aj_riesgo).first()
    min=varRiesgo.min_ri
    max=varRiesgo.max_ri
    if (municipio==0):
        return round(((conred.objects.filter(inform_risk__gte=min, inform_risk__lte=max).aggregate(Avg('inform_risk')))['inform_risk__avg']) or 0, 2)
    else:
        var=conred.objects.filter(cod_municipio=municipio, inform_risk__gte=min, inform_risk__lte=max).first()
        if(var):
            return round (var.inform_risk, 2)
        else:
            return 0

def indicador_promedio_dash2(municipio, aj_riesgo):
    varRiesgo=riesgo.objects.filter(pk=aj_riesgo).first()
    min=varRiesgo.min_pelyexp
    max=varRiesgo.max_pelyexp
    if (municipio==0):
        return round(((conred.objects.filter(peligro_y_exposicion__gte=min, peligro_y_exposicion__lte=max).aggregate(Avg('peligro_y_exposicion')))['peligro_y_exposicion__avg']) or 0, 2)
    else:
        var=conred.objects.filter(cod_municipio=municipio, peligro_y_exposicion__gte=min, peligro_y_exposicion__lte=max).first()
        if(var):
            return round (var.peligro_y_exposicion, 2)
        else:
            return 0

def indicador_promedio_dash3(municipio, aj_riesgo):
    varRiesgo=riesgo.objects.filter(pk=aj_riesgo).first()
    min=varRiesgo.min_vul
    max=varRiesgo.max_vul
    if (municipio==0):
        return round(((conred.objects.filter(vulnerabilidades__gte=min, vulnerabilidades__lte=max).aggregate(Avg('vulnerabilidades')))['vulnerabilidades__avg']) or 0, 2)
    else:
        var=conred.objects.filter(cod_municipio=municipio, vulnerabilidades__gte=min, vulnerabilidades__lte=max).first()
        if(var):
            return round (var.vulnerabilidades, 2)
        else:
            return 0

def indicador_promedio_dash4(municipio, aj_riesgo):
    varRiesgo=riesgo.objects.filter(pk=aj_riesgo).first()
    min=varRiesgo.min_capres
    max=varRiesgo.max_capres
    if (municipio==0):
        return round(((conred.objects.filter(falta_capacidad_respuesta__gte=min, falta_capacidad_respuesta__lte=max).aggregate(Avg('falta_capacidad_respuesta')))['falta_capacidad_respuesta__avg']) or 0, 2)
    else:
        var=conred.objects.filter(cod_municipio=municipio, falta_capacidad_respuesta__gte=min, falta_capacidad_respuesta__lte=max).first()
        if(var):
            return round (var.falta_capacidad_respuesta, 2)
        else:
            return 0

def recuento_dash1(municipio, aj_riesgo):
    tot=[]
    estados=[]
    data=[]
    min=1
    max=6
    if (aj_riesgo!=0):
        min=aj_riesgo
        max=aj_riesgo+1
    
    for i in range(min, max):
        varRiesgo=riesgo.objects.filter(pk=i).first()
        estados.append(varRiesgo.name)

        min=varRiesgo.min_ri
        max=varRiesgo.max_ri
        cant=0
        if(municipio==0):
            cant=(((conred.objects.filter(inform_risk__gte=min, inform_risk__lte=max).aggregate(Count('index')))['index__count']) or 0)
        else:
            cant=(((conred.objects.filter(cod_municipio=municipio, inform_risk__gte=min, inform_risk__lte=max).aggregate(Count('index')))['index__count']) or 0)
        data.append({'value':cant, 'itemStyle':{'color':'#'+varRiesgo.color_ri}})
    tot.append(estados)
    tot.append(data)
    return tot


def recuento_dash2(municipio,aj_riesgo):
    tot=[]
    estados=[]
    data=[]
    min=1
    max=6
    if (aj_riesgo!=0):
        min=aj_riesgo
        max=aj_riesgo+1
    
    for i in range(min, max):
        varRiesgo=riesgo.objects.filter(pk=i).first()
        estados.append(varRiesgo.name)

        min=varRiesgo.min_pelyexp
        max=varRiesgo.max_pelyexp
        cant=0
        if(municipio==0):
            cant=(((conred.objects.filter(peligro_y_exposicion__gte=min, peligro_y_exposicion__lte=max).aggregate(Count('index')))['index__count']) or 0)
        else:
            cant=(((conred.objects.filter(cod_municipio=municipio, peligro_y_exposicion__gte=min, peligro_y_exposicion__lte=max).aggregate(Count('index')))['index__count']) or 0)
        data.append({'value':cant, 'itemStyle':{'color':'#'+varRiesgo.color_pelyexp}})
    tot.append(estados)
    tot.append(data)
    return tot


def recuento_dash3(municipio,aj_riesgo):
    tot=[]
    estados=[]
    data=[]
    min=1
    max=6
    if (aj_riesgo!=0):
        min=aj_riesgo
        max=aj_riesgo+1
    
    for i in range(min, max):
        varRiesgo=riesgo.objects.filter(pk=i).first()
        estados.append(varRiesgo.name)

        min=varRiesgo.min_vul
        max=varRiesgo.max_vul
        cant=0
        if(municipio==0):
            cant=(((conred.objects.filter(vulnerabilidades__gte=min, vulnerabilidades__lte=max).aggregate(Count('index')))['index__count']) or 0)
        else:
            cant=(((conred.objects.filter(cod_municipio=municipio, vulnerabilidades__gte=min, vulnerabilidades__lte=max).aggregate(Count('index')))['index__count']) or 0)
        data.append({'value':cant, 'itemStyle':{'color':'#'+varRiesgo.color_vul}})
    tot.append(estados)
    tot.append(data)
    return tot


def recuento_dash4(municipio, aj_riesgo):
    tot=[]
    estados=[]
    data=[]
    min=1
    max=6
    if (aj_riesgo!=0):
        min=aj_riesgo
        max=aj_riesgo+1
    
    for i in range(min, max):
        varRiesgo=riesgo.objects.filter(pk=i).first()
        estados.append(varRiesgo.name)

        min=varRiesgo.min_capres
        max=varRiesgo.max_capres
        cant=0
        if(municipio==0):
            cant=(((conred.objects.filter(falta_capacidad_respuesta__gte=min, falta_capacidad_respuesta__lte=max).aggregate(Count('index')))['index__count']) or 0)
        else:
            cant=(((conred.objects.filter(cod_municipio=municipio, falta_capacidad_respuesta__gte=min, falta_capacidad_respuesta__lte=max).aggregate(Count('index')))['index__count']) or 0)
        data.append({'value':cant, 'itemStyle':{'color':'#'+varRiesgo.color_capres}})
    tot.append(estados)
    tot.append(data)
    return tot


#--------------------------------------------------------------------
def pel_y_exp_dash1(municipio, aj_riesgo):
    varRiesgo=riesgo.objects.filter(pk=aj_riesgo).first()
    min=varRiesgo.min_ri
    max=varRiesgo.max_ri
    if (municipio==0):
        return round(((conred.objects.filter(inform_risk__gte=min, inform_risk__lte=max).aggregate(Avg('peligro_y_exposicion')))['peligro_y_exposicion__avg']) or 0, 2)
    else:
        var=conred.objects.filter(cod_municipio=municipio, inform_risk__gte=min, inform_risk__lte=max).first()
        if(var):
            return round (var.peligro_y_exposicion, 2)
        else:
            return 0


def vulne_dash1(municipio, aj_riesgo):
    varRiesgo=riesgo.objects.filter(pk=aj_riesgo).first()
    min=varRiesgo.min_ri
    max=varRiesgo.max_ri
    if (municipio==0):
        return round(((conred.objects.filter(inform_risk__gte=min, inform_risk__lte=max).aggregate(Avg('vulnerabilidades')))['vulnerabilidades__avg']) or 0, 2)
    else:
        var=conred.objects.filter(cod_municipio=municipio, inform_risk__gte=min, inform_risk__lte=max).first()
        if(var):
            return round (var.vulnerabilidades, 2)
        else:
            return 0


def falta_respuesta_dash1(municipio, aj_riesgo):
    varRiesgo=riesgo.objects.filter(pk=aj_riesgo).first()
    min=varRiesgo.min_ri
    max=varRiesgo.max_ri
    if (municipio==0):
        return round(((conred.objects.filter(inform_risk__gte=min, inform_risk__lte=max).aggregate(Avg('falta_capacidad_respuesta')))['falta_capacidad_respuesta__avg']) or 0, 2)
    else:
        var=conred.objects.filter(cod_municipio=municipio, inform_risk__gte=min, inform_risk__lte=max).first()
        if(var):
            return round (var.falta_capacidad_respuesta, 2)
        else:
            return 0
#--------------------------------------------------------------------

#--------------------------------------------------------------------
def eventos_naturales_dash2(municipio, aj_riesgo):
    varRiesgo=riesgo.objects.filter(pk=aj_riesgo).first()
    min=varRiesgo.min_pelyexp
    max=varRiesgo.max_pelyexp
    if (municipio==0):
        return round(((conred.objects.filter(peligro_y_exposicion__gte=min, peligro_y_exposicion__lte=max).aggregate(Avg('eventos_naturales')))['eventos_naturales__avg']) or 0, 2)
    else:
        var=conred.objects.filter(cod_municipio=municipio, peligro_y_exposicion__gte=min, peligro_y_exposicion__lte=max).first()
        if(var):
            return round (var.eventos_naturales, 2)
        else:
            return 0


def degradacion_ambiental_dash2(municipio, aj_riesgo):
    varRiesgo=riesgo.objects.filter(pk=aj_riesgo).first()
    min=varRiesgo.min_pelyexp
    max=varRiesgo.max_pelyexp
    if (municipio==0):
        return round(((conred.objects.filter(peligro_y_exposicion__gte=min, peligro_y_exposicion__lte=max).aggregate(Avg('degradacion_ambiental')))['degradacion_ambiental__avg']) or 0, 2)
    else:
        var=conred.objects.filter(cod_municipio=municipio, peligro_y_exposicion__gte=min, peligro_y_exposicion__lte=max).first()
        if(var):
            return round (var.degradacion_ambiental, 2)
        else:
            return 0

def inform_humano_dash2(municipio, aj_riesgo):
    varRiesgo=riesgo.objects.filter(pk=aj_riesgo).first()
    min=varRiesgo.min_pelyexp
    max=varRiesgo.max_pelyexp
    if (municipio==0):
        return round(((conred.objects.filter(peligro_y_exposicion__gte=min, peligro_y_exposicion__lte=max).aggregate(Avg('inform_humano')))['inform_humano__avg']) or 0, 2)
    else:
        var=conred.objects.filter(cod_municipio=municipio, peligro_y_exposicion__gte=min, peligro_y_exposicion__lte=max).first()
        if(var):
            return round (var.inform_humano, 2)
        else:
            return 0


def inform_natural_dash2(municipio, aj_riesgo):
    varRiesgo=riesgo.objects.filter(pk=aj_riesgo).first()
    min=varRiesgo.min_pelyexp
    max=varRiesgo.max_pelyexp
    if (municipio==0):
        return round(((conred.objects.filter(peligro_y_exposicion__gte=min, peligro_y_exposicion__lte=max).aggregate(Avg('inform_natural')))['inform_natural__avg']) or 0, 2)
    else:
        var=conred.objects.filter(cod_municipio=municipio, peligro_y_exposicion__gte=min, peligro_y_exposicion__lte=max).first()
        if(var):
            return round (var.inform_natural, 2)
        else:
            return 0

#-----------------------------------------------------------
    

#-----------------------------------------------------------

def desarrollo_economico_dash3(municipio, aj_riesgo):
    varRiesgo=riesgo.objects.filter(pk=aj_riesgo).first()
    min=varRiesgo.min_vul
    max=varRiesgo.max_vul
    if (municipio==0):
        return round(((conred.objects.filter(vulnerabilidades__gte=min, vulnerabilidades__lte=max).aggregate(Avg('desarrollo_economico')))['desarrollo_economico__avg']) or 0, 2)
    else:
        var=conred.objects.filter(cod_municipio=municipio, vulnerabilidades__gte=min, vulnerabilidades__lte=max).first()
        if(var):
            return round (var.desarrollo_economico, 2)
        else:
            return 0

def desigualdad_dash3(municipio, aj_riesgo):
    varRiesgo=riesgo.objects.filter(pk=aj_riesgo).first()
    min=varRiesgo.min_vul
    max=varRiesgo.max_vul
    if (municipio==0):
        return round(((conred.objects.filter(vulnerabilidades__gte=min, vulnerabilidades__lte=max).aggregate(Avg('desigualdad')))['desigualdad__avg']) or 0, 2)
    else:
        var=conred.objects.filter(cod_municipio=municipio, vulnerabilidades__gte=min, vulnerabilidades__lte=max).first()
        if(var):
            return round (var.desigualdad, 2)
        else:
            return 0


def desarrollo_y_pobreza_dash3(municipio, aj_riesgo):
    varRiesgo=riesgo.objects.filter(pk=aj_riesgo).first()
    min=varRiesgo.min_vul
    max=varRiesgo.max_vul
    if (municipio==0):
        return round(((conred.objects.filter(vulnerabilidades__gte=min, vulnerabilidades__lte=max).aggregate(Avg('desarrollo_y_pobreza')))['desarrollo_y_pobreza__avg']) or 0, 2)
    else:
        var=conred.objects.filter(cod_municipio=municipio, vulnerabilidades__gte=min, vulnerabilidades__lte=max).first()
        if(var):
            return round (var.desarrollo_y_pobreza, 2)
        else:
            return 0



def poblacion_en_dependencia_dash3(municipio, aj_riesgo):
    varRiesgo=riesgo.objects.filter(pk=aj_riesgo).first()
    min=varRiesgo.min_vul
    max=varRiesgo.max_vul
    if (municipio==0):
        return round(((conred.objects.filter(vulnerabilidades__gte=min, vulnerabilidades__lte=max).aggregate(Avg('poblacion_en_dependencia')))['poblacion_en_dependencia__avg']) or 0, 2)
    else:
        var=conred.objects.filter(cod_municipio=municipio, vulnerabilidades__gte=min, vulnerabilidades__lte=max).first()
        if(var):
            return round (var.poblacion_en_dependencia, 2)
        else:
            return 0


def poblacion_desprotegida_dash3(municipio, aj_riesgo):
    varRiesgo=riesgo.objects.filter(pk=aj_riesgo).first()
    min=varRiesgo.min_vul
    max=varRiesgo.max_vul
    if (municipio==0):
        return round(((conred.objects.filter(vulnerabilidades__gte=min, vulnerabilidades__lte=max).aggregate(Avg('poblacion_desprotegida')))['poblacion_desprotegida__avg']) or 0, 2)
    else:
        var=conred.objects.filter(cod_municipio=municipio, vulnerabilidades__gte=min, vulnerabilidades__lte=max).first()
        if(var):
            return round (var.poblacion_desprotegida, 2)
        else:
            return 0


def socioeconomica_dash3(municipio, aj_riesgo):
    varRiesgo=riesgo.objects.filter(pk=aj_riesgo).first()
    min=varRiesgo.min_vul
    max=varRiesgo.max_vul
    if (municipio==0):
        return round(((conred.objects.filter(vulnerabilidades__gte=min, vulnerabilidades__lte=max).aggregate(Avg('socioeconomica')))['socioeconomica__avg']) or 0, 2)
    else:
        var=conred.objects.filter(cod_municipio=municipio, vulnerabilidades__gte=min, vulnerabilidades__lte=max).first()
        if(var):
            return round (var.socioeconomica, 2)
        else:
            return 0


def grupos_vulnerables_dash3(municipio, aj_riesgo):
    varRiesgo=riesgo.objects.filter(pk=aj_riesgo).first()
    min=varRiesgo.min_vul
    max=varRiesgo.max_vul
    if (municipio==0):
        return round(((conred.objects.filter(vulnerabilidades__gte=min, vulnerabilidades__lte=max).aggregate(Avg('grupos_vulnerables')))['grupos_vulnerables__avg']) or 0, 2)
    else:
        var=conred.objects.filter(cod_municipio=municipio, vulnerabilidades__gte=min, vulnerabilidades__lte=max).first()
        if(var):
            return round (var.grupos_vulnerables, 2)
        else:
            return 0



#-----------------------------------------------------------

#-----------------------------------------------------------

def rrd_dash4(municipio, aj_riesgo):
    varRiesgo=riesgo.objects.filter(pk=aj_riesgo).first()
    min=varRiesgo.min_capres
    max=varRiesgo.max_capres
    if (municipio==0):
        return round(((conred.objects.filter(falta_capacidad_respuesta__gte=min, falta_capacidad_respuesta__lte=max).aggregate(Avg('rrd')))['rrd__avg']) or 0, 2)
    else:
        var=conred.objects.filter(cod_municipio=municipio, falta_capacidad_respuesta__gte=min, falta_capacidad_respuesta__lte=max).first()
        if(var):
            return round (var.rrd, 2)
        else:
            return 0

def gestion_municipal_dash4(municipio, aj_riesgo):
    varRiesgo=riesgo.objects.filter(pk=aj_riesgo).first()
    min=varRiesgo.min_capres
    max=varRiesgo.max_capres
    if (municipio==0):
        return round(((conred.objects.filter(falta_capacidad_respuesta__gte=min, falta_capacidad_respuesta__lte=max).aggregate(Avg('gestion_municipal')))['gestion_municipal__avg']) or 0, 2)
    else:
        var=conred.objects.filter(cod_municipio=municipio, falta_capacidad_respuesta__gte=min, falta_capacidad_respuesta__lte=max).first()
        if(var):
            return round (var.gestion_municipal, 2)
        else:
            return 0

def comunicacion_dash4(municipio, aj_riesgo):
    varRiesgo=riesgo.objects.filter(pk=aj_riesgo).first()
    min=varRiesgo.min_capres
    max=varRiesgo.max_capres
    if (municipio==0):
        return round(((conred.objects.filter(falta_capacidad_respuesta__gte=min, falta_capacidad_respuesta__lte=max).aggregate(Avg('comunicacion')))['comunicacion__avg']) or 0, 2)
    else:
        var=conred.objects.filter(cod_municipio=municipio, falta_capacidad_respuesta__gte=min, falta_capacidad_respuesta__lte=max).first()
        if(var):
            return round (var.comunicacion, 2)
        else:
            return 0

def infraestructura_dash4(municipio, aj_riesgo):
    varRiesgo=riesgo.objects.filter(pk=aj_riesgo).first()
    min=varRiesgo.min_capres
    max=varRiesgo.max_capres
    if (municipio==0):
        return round(((conred.objects.filter(falta_capacidad_respuesta__gte=min, falta_capacidad_respuesta__lte=max).aggregate(Avg('infraestructura')))['infraestructura__avg']) or 0, 2)
    else:
        var=conred.objects.filter(cod_municipio=municipio, falta_capacidad_respuesta__gte=min, falta_capacidad_respuesta__lte=max).first()
        if(var):
            return round (var.infraestructura, 2)
        else:
            return 0

def salud_dash4(municipio, aj_riesgo):
    varRiesgo=riesgo.objects.filter(pk=aj_riesgo).first()
    min=varRiesgo.min_capres
    max=varRiesgo.max_capres
    if (municipio==0):
        return round(((conred.objects.filter(falta_capacidad_respuesta__gte=min, falta_capacidad_respuesta__lte=max).aggregate(Avg('salud')))['salud__avg']) or 0, 2)
    else:
        var=conred.objects.filter(cod_municipio=municipio, falta_capacidad_respuesta__gte=min, falta_capacidad_respuesta__lte=max).first()
        if(var):
            return round (var.salud, 2)
        else:
            return 0


def inform_institucional_dash4(municipio, aj_riesgo):
    varRiesgo=riesgo.objects.filter(pk=aj_riesgo).first()
    min=varRiesgo.min_capres
    max=varRiesgo.max_capres
    if (municipio==0):
        return round(((conred.objects.filter(falta_capacidad_respuesta__gte=min, falta_capacidad_respuesta__lte=max).aggregate(Avg('inform_institucional')))['inform_institucional__avg']) or 0, 2)
    else:
        var=conred.objects.filter(cod_municipio=municipio, falta_capacidad_respuesta__gte=min, falta_capacidad_respuesta__lte=max).first()
        if(var):
            return round (var.inform_institucional, 2)
        else:
            return 0


def inform_infraestrucutra_dash4(municipio, aj_riesgo):
    varRiesgo=riesgo.objects.filter(pk=aj_riesgo).first()
    min=varRiesgo.min_capres
    max=varRiesgo.max_capres
    if (municipio==0):
        return round(((conred.objects.filter(falta_capacidad_respuesta__gte=min, falta_capacidad_respuesta__lte=max).aggregate(Avg('inform_infraestrucutra')))['inform_infraestrucutra__avg']) or 0, 2)
    else:
        var=conred.objects.filter(cod_municipio=municipio, falta_capacidad_respuesta__gte=min, falta_capacidad_respuesta__lte=max).first()
        if(var):
            return round (var.inform_infraestrucutra, 2)
        else:
            return 0



#-----------------------------------------------------------





def switch_dash1(campo, municipio, aj_riesgo):
    if (campo==1):
        return indicador_promedio_dash1(municipio, aj_riesgo)
    elif (campo==2):
        return recuento_dash1(municipio, aj_riesgo)
    elif (campo==3):
        return pel_y_exp_dash1(municipio, aj_riesgo)
    elif (campo==4):
        return vulne_dash1(municipio, aj_riesgo)
    elif (campo==5):
        return falta_respuesta_dash1(municipio, aj_riesgo)


def switch_dash2(campo, municipio, aj_riesgo):
    if (campo==6):
        return indicador_promedio_dash2(municipio, aj_riesgo)
    elif (campo==7):
        return recuento_dash2(municipio, aj_riesgo)
    elif (campo==8):
        return eventos_naturales_dash2(municipio, aj_riesgo)
    elif (campo==9):
        return degradacion_ambiental_dash2(municipio, aj_riesgo)
    elif (campo==10):
        return inform_humano_dash2(municipio, aj_riesgo)
    elif (campo==11):
        return inform_natural_dash2(municipio, aj_riesgo)

def switch_dash3(campo, municipio, aj_riesgo):
    if (campo==101):
        return indicador_promedio_dash3(municipio, aj_riesgo)
    elif (campo==102):
        return recuento_dash3(municipio, aj_riesgo)
    
    elif (campo==103):
        return desarrollo_economico_dash3(municipio, aj_riesgo)
    elif (campo==104):
        return desigualdad_dash3(municipio, aj_riesgo)    
    elif (campo==105):
        return desarrollo_y_pobreza_dash3(municipio, aj_riesgo)     
    elif (campo==106):
        return poblacion_en_dependencia_dash3(municipio, aj_riesgo)     
    elif (campo==107):
        return poblacion_desprotegida_dash3(municipio, aj_riesgo)     
    elif (campo==108):
        return socioeconomica_dash3(municipio, aj_riesgo)     
    elif (campo==109):
        return grupos_vulnerables_dash3(municipio, aj_riesgo)    

def switch_dash4(campo, municipio, aj_riesgo):
    if (campo==201):
        return indicador_promedio_dash4(municipio, aj_riesgo)
    elif (campo==202):
        return recuento_dash4(municipio, aj_riesgo)

    elif (campo==203):
        return rrd_dash4(municipio, aj_riesgo)
    elif (campo==204):
        return gestion_municipal_dash4(municipio, aj_riesgo)    
    elif (campo==205):
        return comunicacion_dash4(municipio, aj_riesgo)     
    elif (campo==206):
        return infraestructura_dash4(municipio, aj_riesgo)     
    elif (campo==207):
        return salud_dash4(municipio, aj_riesgo)     
    elif (campo==208):
        return inform_institucional_dash4(municipio, aj_riesgo)     
    elif (campo==209):
        return inform_infraestrucutra_dash4(municipio, aj_riesgo) 


def switch(campo, municipio,riesgo):
    if (campo>0 and campo<6):
        return switch_dash1(campo, municipio, riesgo)
    if (campo>5 and campo<100):
        return switch_dash2(campo, municipio, riesgo)
    if (campo>100 and campo<200):
        return switch_dash3(campo, municipio, riesgo)
    if (campo>200 and campo<300):
        return switch_dash4(campo, municipio, riesgo)


def info(request,*args, **kwargs):
    aj_campo=int (kwargs.get('campo'))
    aj_riesgo=int(kwargs.get('riesgo'))
    aj_municipio=int(kwargs.get('municipio'))
    #print('municipio: '+str(aj_municipio)+' mayor o igual que = '+str(varRiesgo.min)+' y menor que ='+str(varRiesgo.max))
    value=switch(aj_campo, aj_municipio, aj_riesgo)
    return JsonResponse({'data':value})



def detalles(request,*args, **kwargs):
    aj_campo=int (kwargs.get('campo'))
    aj_municipio=int(kwargs.get('municipio'))
    print(aj_municipio)
    variable = conred.objects.filter(cod_municipio=int(aj_municipio)).first()
    data={'municipio':variable.municipio, 'departamento': variable.departamento, 'ranking':variable.ranking, 'ranking_dep':variable.ranking_dep}
    return JsonResponse({'data':data})



def radar(request,*args, **kwargs):
    aj_municipio=int(kwargs.get('municipio'))
    variable = conred.objects.filter(cod_municipio=int(aj_municipio)).first()
    data=[]
    data.append(variable.inform_risk)
    data.append(variable.peligro_y_exposicion)
    data.append(variable.falta_capacidad_respuesta)
    data.append(variable.vulnerabilidades)
    return JsonResponse({'data':data})



# def autocomplete(request):
#     if request.is_ajax():
#         print('hola')
#         query = request.GET.get("term", "")
#         products = conred.objects.filter(municipio__icontains=query)
#         titles = list()
#         for product in products:
#             titles.append({'label':str(product.municipio), 'value':str(product.cod_municipio)})
#             titles.append(str(product.cod_municipio))
#         data = json.dumps(titles)
#     mimetype = "application/json"
#     return HttpResponse(data, mimetype)

def autocomplete(request):
    if request.is_ajax():
        query = request.GET.get("term", "")
        print(query)
        products = conred.objects.all()
        titles = list()
        for product in products:
            titles.append({'label':str(product.municipio), 'value':str(product.cod_municipio)})
            titles.append(str(product.cod_municipio))
        data = json.dumps(titles)
    mimetype = "application/json"
    return HttpResponse(data, mimetype)



    