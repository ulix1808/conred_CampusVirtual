var pel_y_expdiv = document.getElementById('pel_y_exp');
var pel_y_expChart = echarts.init(pel_y_expdiv);
var pel_y_expoption;
pel_y_expoption ={
    series: [
      {
        type: 'gauge',
        axisLine: {lineStyle: {width: 0,}},
        pointer: {show: false},
        axisTick: {lineStyle: {width: 0,}},
        splitLine: {lineStyle: {width: 0,}},
        axisLabel: {fontSize: 0},
        detail: {valueAnimation: true,offsetCenter: [0, '-15%'],fontSize: 66,color: '#999999'},
        data: [{value: 0}]}]
    
};


var vulnediv = document.getElementById('vulne');
var vulneChart = echarts.init(vulnediv);
var vulneoption;
vulneoption ={
    series: [
      {
        type: 'gauge',
        axisLine: {lineStyle: {width: 0,}},
        pointer: {show: false},
        axisTick: {lineStyle: {width: 0,}},
        splitLine: {lineStyle: {width: 0,}},
        axisLabel: {fontSize: 0},
        detail: {valueAnimation: true,offsetCenter: [0, '-15%'],fontSize: 66,color: '#999999'},
        data: [{value: 0}]}]
    
  };


var falta_respuestadiv = document.getElementById('falta_respuesta');
var falta_respuestaChart = echarts.init(falta_respuestadiv);
var falta_respuestaoption;
falta_respuestaoption ={
    series: [
      {
        type: 'gauge',
        axisLine: {lineStyle: {width: 0,}},
        pointer: {show: false},
        axisTick: {lineStyle: {width: 0,}},
        splitLine: {lineStyle: {width: 0,}},
        axisLabel: {fontSize: 0},
        detail: {valueAnimation: true,offsetCenter: [0, '-15%'],fontSize: 66,color: '#999999'},
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
                    url:host+`info/get/3/${riesgo}/${municipio}`,
                    success: function(response){
                        pel_y_expChart.setOption({
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
                    url:host+`info/get/4/${riesgo}/${municipio}`,
                    success: function(response){
                        vulneChart.setOption({
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
                    url:host+`info/get/5/${riesgo}/${municipio}`,
                    success: function(response){
                        falta_respuestaChart.setOption({
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

    pel_y_expChart.setOption(pel_y_expoption);
    vulneChart.setOption(vulneoption);
    falta_respuestaChart.setOption(falta_respuestaoption);