var rrddiv = document.getElementById('rrd');
var rrdChart = echarts.init(rrddiv);
var rrdoption;
rrdoption ={
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


var gestion_municipaldiv = document.getElementById('gestion_municipal');
var gestion_municipalChart = echarts.init(gestion_municipaldiv);
var gestion_municipaloption;
gestion_municipaloption ={
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


var comunicaciondiv = document.getElementById('comunicacion');
var comunicacionChart = echarts.init(comunicaciondiv);
var comunicacionoption;
comunicacionoption ={
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


  var infraestructuradiv = document.getElementById('infraestructura');
  var infraestructuraChart = echarts.init(infraestructuradiv);
  var infraestructuraoption;
  infraestructuraoption ={
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


var saluddiv = document.getElementById('salud');
var saludChart = echarts.init(saluddiv);
var saludoption;
saludoption ={
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


var inform_institucionaldiv = document.getElementById('inform_institucional');
var inform_institucionalChart = echarts.init(inform_institucionaldiv);
var inform_institucionaloption;
inform_institucionaloption ={
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


var inform_infraestrucutradiv = document.getElementById('inform_infraestrucutra');
var inform_infraestrucutraChart = echarts.init(inform_infraestrucutradiv);
var inform_infraestrucutraoption;
inform_infraestrucutraoption ={
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
                    url:host+`info/get/203/${riesgo}/${municipio}`,
                    success: function(response){
                        rrdChart.setOption({
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
                    url:host+`info/get/204/${riesgo}/${municipio}`,
                    success: function(response){
                        gestion_municipalChart.setOption({
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
                    url:host+`info/get/205/${riesgo}/${municipio}`,
                    success: function(response){
                        comunicacionChart.setOption({
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
                    url:host+`info/get/206/${riesgo}/${municipio}`,
                    success: function(response){
                        infraestructuraChart.setOption({
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
                    url:host+`info/get/207/${riesgo}/${municipio}`,
                    success: function(response){
                        saludChart.setOption({
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
                    url:host+`info/get/208/${riesgo}/${municipio}`,
                    success: function(response){
                        inform_institucionalChart.setOption({
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
                    url:host+`info/get/209/${riesgo}/${municipio}`,
                    success: function(response){
                        inform_infraestrucutraChart.setOption({
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

    rrdChart.setOption(rrdoption);
    gestion_municipalChart.setOption(gestion_municipaloption);
    comunicacionChart.setOption(comunicacionoption);
    infraestructuraChart.setOption(infraestructuraoption);
    saludChart.setOption(saludoption);
    inform_institucionalChart.setOption(inform_institucionaloption);
    inform_infraestrucutraChart.setOption(inform_infraestrucutraoption);