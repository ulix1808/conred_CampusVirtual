var desarrollo_economicodiv = document.getElementById('desarrollo_economico');
var desarrollo_economicoChart = echarts.init(desarrollo_economicodiv);
var desarrollo_economicooption;
desarrollo_economicooption ={
    series: [
      {
        type: 'gauge',
        axisLine: {lineStyle: {width: 0,}},
        pointer: {show: false},
        axisTick: {lineStyle: {width: 0,}},
        splitLine: {lineStyle: {width: 0,}},
        axisLabel: {fontSize: 0},
        detail: {valueAnimation: true,offsetCenter: [0, '-15%'],fontSize: 40,color: '#999999'},
        data: [{value: 0}]}]
    
};


var desigualdaddiv = document.getElementById('desigualdad');
var desigualdadChart = echarts.init(desigualdaddiv);
var desigualdadoption;
desigualdadoption ={
    series: [
      {
        type: 'gauge',
        axisLine: {lineStyle: {width: 0,}},
        pointer: {show: false},
        axisTick: {lineStyle: {width: 0,}},
        splitLine: {lineStyle: {width: 0,}},
        axisLabel: {fontSize: 0},
        detail: {valueAnimation: true,offsetCenter: [0, '-15%'],fontSize: 40,color: '#999999'},
        data: [{value: 0}]}]
    
  };


var desarrollo_y_pobrezadiv = document.getElementById('desarrollo_y_pobreza');
var desarrollo_y_pobrezaChart = echarts.init(desarrollo_y_pobrezadiv);
var desarrollo_y_pobrezaoption;
desarrollo_y_pobrezaoption ={
    series: [
      {
        type: 'gauge',
        axisLine: {lineStyle: {width: 0,}},
        pointer: {show: false},
        axisTick: {lineStyle: {width: 0,}},
        splitLine: {lineStyle: {width: 0,}},
        axisLabel: {fontSize: 0},
        detail: {valueAnimation: true,offsetCenter: [0, '-15%'],fontSize: 40,color: '#999999'},
        data: [{value: 0}]}]
    
  };



var poblacion_en_dependenciadiv = document.getElementById('poblacion_en_dependencia');
var poblacion_en_dependenciaChart = echarts.init(poblacion_en_dependenciadiv);
var poblacion_en_dependenciaoption;
poblacion_en_dependenciaoption ={
    series: [
      {
        type: 'gauge',
        axisLine: {lineStyle: {width: 0,}},
        pointer: {show: false},
        axisTick: {lineStyle: {width: 0,}},
        splitLine: {lineStyle: {width: 0,}},
        axisLabel: {fontSize: 0},
        detail: {valueAnimation: true,offsetCenter: [0, '-15%'],fontSize: 40,color: '#999999'},
        data: [{value: 0}]}]
    
  };



var poblacion_desprotegidadiv = document.getElementById('poblacion_desprotegida');
var poblacion_desprotegidaChart = echarts.init(poblacion_desprotegidadiv);
var poblacion_desprotegidaoption;
poblacion_desprotegidaoption ={
    series: [
    {
        type: 'gauge',
        axisLine: {lineStyle: {width: 0,}},
        pointer: {show: false},
        axisTick: {lineStyle: {width: 0,}},
        splitLine: {lineStyle: {width: 0,}},
        axisLabel: {fontSize: 0},
        detail: {valueAnimation: true,offsetCenter: [0, '-15%'],fontSize: 40,color: '#999999'},
        data: [{value: 0}]}]
    
};



var socioeconomicadiv = document.getElementById('socioeconomica');
var socioeconomicaChart = echarts.init(socioeconomicadiv);
var socioeconomicaoption;
socioeconomicaoption ={
    series: [
      {
        type: 'gauge',
        axisLine: {lineStyle: {width: 0,}},
        pointer: {show: false},
        axisTick: {lineStyle: {width: 0,}},
        splitLine: {lineStyle: {width: 0,}},
        axisLabel: {fontSize: 0},
        detail: {valueAnimation: true,offsetCenter: [0, '-15%'],fontSize: 40,color: '#999999'},
        data: [{value: 0}]}]
    
};




var grupos_vulnerablesdiv = document.getElementById('grupos_vulnerables');
var grupos_vulnerablesChart = echarts.init(grupos_vulnerablesdiv);
var grupos_vulnerablesoption;
grupos_vulnerablesoption ={
    series: [
      {
        type: 'gauge',
        axisLine: {lineStyle: {width: 0,}},
        pointer: {show: false},
        axisTick: {lineStyle: {width: 0,}},
        splitLine: {lineStyle: {width: 0,}},
        axisLabel: {fontSize: 0},
        detail: {valueAnimation: true,offsetCenter: [0, '-15%'],fontSize: 40,color: '#999999'},
        data: [{value: 0}]}]
    
  };



$(document).ready( function ()
    {
        $(function() {
            $(".form-select").on('change', function() {
                const riesgo =  $("#riesgo").val();
                const municipio =  $("#municipio").val();
                $.ajax({
                    type: 'GET',
                    url:host+`info/get/103/${riesgo}/${municipio}`,
                    success: function(response){
                        desarrollo_economicoChart.setOption({
                            series: [
                            {data: [{value: response.data,}]}
                            ]
                        });
                    },
                    error:function (error){
                    }
                });
                $.ajax({
                    type: 'GET',
                    url:host+`info/get/104/${riesgo}/${municipio}`,
                    success: function(response){
                        desigualdadChart.setOption({
                            series: [
                            {data: [{value: response.data,}]}
                            ]
                        });
                    },
                    error:function (error){
                    }
                });
                $.ajax({
                    type: 'GET',
                    url:host+`info/get/105/${riesgo}/${municipio}`,
                    success: function(response){
                        desarrollo_y_pobrezaChart.setOption({
                            series: [
                            {data: [{value: response.data,}]}
                            ]
                        });
                    },
                    error:function (error){
                    }
                });
                $.ajax({
                    type: 'GET',
                    url:host+`info/get/106/${riesgo}/${municipio}`,
                    success: function(response){
                        poblacion_en_dependenciaChart.setOption({
                            series: [
                            {data: [{value: response.data,}]}
                            ]
                        });
                    },
                    error:function (error){
                    }
                });
                $.ajax({
                    type: 'GET',
                    url:host+`info/get/107/${riesgo}/${municipio}`,
                    success: function(response){
                        poblacion_desprotegidaChart.setOption({
                            series: [
                            {data: [{value: response.data,}]}
                            ]
                        });
                    },
                    error:function (error){
                    }
                });
                $.ajax({
                    type: 'GET',
                    url:host+`info/get/108/${riesgo}/${municipio}`,
                    success: function(response){
                        socioeconomicaChart.setOption({
                            series: [
                            {data: [{value: response.data,}]}
                            ]
                        });
                    },
                    error:function (error){
                    }
                });
                $.ajax({
                    type: 'GET',
                    url:host+`info/get/109/${riesgo}/${municipio}`,
                    success: function(response){
                        grupos_vulnerablesChart.setOption({
                            series: [
                            {data: [{value: response.data,}]}
                            ]
                        });
                    },
                    error:function (error){
                    }
                });
            }).change();
        });
    });

    desarrollo_economicoChart.setOption(desarrollo_economicooption);
    desigualdadChart.setOption(desigualdadoption);
    desarrollo_y_pobrezaChart.setOption(desarrollo_y_pobrezaoption);
    poblacion_en_dependenciaChart.setOption(poblacion_en_dependenciaoption);
    poblacion_desprotegidaChart.setOption(poblacion_desprotegidaoption);
    socioeconomicaChart.setOption(socioeconomicaoption);
    grupos_vulnerablesChart.setOption(grupos_vulnerablesoption);