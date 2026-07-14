var eventos_naturalesdiv = document.getElementById('eventos_naturales');
var eventos_naturalesChart = echarts.init(eventos_naturalesdiv);
var eventos_naturalesoption;
eventos_naturalesoption = {
    series: [
        {
            type: 'gauge',
            axisLine: { lineStyle: { width: 0, } },
            pointer: { show: false },
            axisTick: { lineStyle: { width: 0, } },
            splitLine: { lineStyle: { width: 0, } },
            axisLabel: { fontSize: 0 },
            detail: { valueAnimation: true, offsetCenter: [0, '-50%'], fontSize: 40, color: '#999999' },
            data: [{ value: 0 }]
        }]

};


var degradacion_ambientaldiv = document.getElementById('degradacion_ambiental');
var degradacion_ambientalChart = echarts.init(degradacion_ambientaldiv);
var degradacion_ambientaloption;
degradacion_ambientaloption = {
    series: [
        {
            type: 'gauge',
            axisLine: { lineStyle: { width: 0, } },
            pointer: { show: false },
            axisTick: { lineStyle: { width: 0, } },
            splitLine: { lineStyle: { width: 0, } },
            axisLabel: { fontSize: 0 },
            detail: { valueAnimation: true, offsetCenter: [0, '-50%'], fontSize: 40, color: '#999999' },
            data: [{ value: 0 }]
        }]

};


var inform_humanodiv = document.getElementById('inform_humano');
var inform_humanoChart = echarts.init(inform_humanodiv);
var inform_humanooption;
inform_humanooption = {
    series: [
        {
            type: 'gauge',
            axisLine: { lineStyle: { width: 0, } },
            pointer: { show: false },
            axisTick: { lineStyle: { width: 0, } },
            splitLine: { lineStyle: { width: 0, } },
            axisLabel: { fontSize: 0 },
            detail: { valueAnimation: true, offsetCenter: [0, '-50%'], fontSize: 40, color: '#999999' },
            data: [{ value: 0 }]
        }]

};


var inform_naturaldiv = document.getElementById('inform_natural');
var inform_naturalChart = echarts.init(inform_naturaldiv);
var inform_naturaloption;
inform_naturaloption = {
    series: [
        {
            type: 'gauge',
            axisLine: { lineStyle: { width: 0, } },
            pointer: { show: false },
            axisTick: { lineStyle: { width: 0, } },
            splitLine: { lineStyle: { width: 0, } },
            axisLabel: { fontSize: 0 },
            detail: { valueAnimation: true, offsetCenter: [0, '-50%'], fontSize: 40, color: '#999999' },
            data: [{ value: 0 }]
        }]

};




$(document).ready(function () {
    $(function () {
        $(".form-select").on('change', function () {
            const riesgo = $("#riesgo").val();
            const municipio = $("#municipio").val();
            $.ajax({
                type: 'GET',
                url:host+`info/get/8/${riesgo}/${municipio}`,
                success: function (response) {
                    eventos_naturalesChart.setOption({
                        series: [
                            { data: [{ value: response.data, }] }
                        ]
                    });
                },
                error: function (error) {
                }
            });
            $.ajax({
                type: 'GET',
                url:host+`info/get/9/${riesgo}/${municipio}`,
                success: function (response) {
                    degradacion_ambientalChart.setOption({
                        series: [
                            { data: [{ value: response.data, }] }
                        ]
                    });
                },
                error: function (error) {
                }
            });
            $.ajax({
                type: 'GET',
                url:host+`info/get/10/${riesgo}/${municipio}`,
                success: function (response) {
                    inform_humanoChart.setOption({
                        series: [
                            { data: [{ value: response.data, }] }
                        ]
                    });
                },
                error: function (error) {
                }
            });

            $.ajax({
                type: 'GET',
                url:host+`info/get/11/${riesgo}/${municipio}`,
                success: function (response) {
                    inform_naturalChart.setOption({
                        series: [
                            { data: [{ value: response.data, }] }
                        ]
                    });
                },
                error: function (error) {
                }
            });
        }).change();
    });
});

eventos_naturalesChart.setOption(eventos_naturalesoption);
degradacion_ambientalChart.setOption(degradacion_ambientaloption);
inform_humanoChart.setOption(inform_humanooption);
inform_naturalChart.setOption(inform_naturaloption);
