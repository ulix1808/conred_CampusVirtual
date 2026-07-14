var relojdiv = document.getElementById('relojdiv');
var relojChart = echarts.init(relojdiv);
var relojoption;
relojoption  = {
    series: [
        {
        type: 'gauge',
        center: ['50%', '60%'],
        startAngle: 200,
        endAngle: -20,
        min: 2,
        max: 6.6,
        itemStyle: {
            color: '#ffaa00'
        },
        progress: {
            show: true,
            width: -35
        },
        pointer: {
            show: false
        },
        axisLine: {
            show: false
        },
        axisTick: {
            show: false
        },
        splitLine: {
            show: false
        },
        axisLabel: {
            show: false
        },
        detail: {
            show: false
        },
        data: [
            {
            value: 0
            }
        ]
        },
        {
        type: 'gauge',
        center: ['50%', '60%'],
        startAngle: 200,
        endAngle: -20,
        min: 2,
        max: 6.6,
        splitNumber: 10,
        itemStyle: {
            color: '#ffd683'
        },
        
        progress: {
            show: true,
            width: -25
        },
        pointer: {
            show: false
        },
        axisLine: {
            lineStyle: {
            width: -35
            }
        },
        axisTick: {
            distance: -0,
            splitNumber: 5,
            lineStyle: {
            width: 2,
            color: '#e6ebf8'
            }
        },
        splitLine: {
            distance: 0,
            length: 14,
            lineStyle: {
            width: 3,
            color: '#e6ebf8'
            }
        },
        axisLabel: {
            distance: -0,
            color: '#999',
            fontSize: 0
        },
        anchor: {
            show: true
        },
        title: {
            show: false
        },
        detail: {
            valueAnimation: true,
            width: '70%',
            lineHeight: 40,
            borderRadius: 8,
            offsetCenter: [0, '-15%'],
            fontSize: 33,
            fontWeight: 'bolder',
            formatter: '{value}',
            color: '#6e6e6e'
        },
        data: [
            {
            value: 0
            }
        ]
        }
    ]
};



$(document).ready( function ()
{
    $(function() {
        $(".form-select").on('change', function() {
            const riesgo =  $("#riesgo").val();
            const municipio =  $("#municipio").val();
            $.ajax({
                type: 'GET',
                url:host+`info/get/6/${riesgo}/${municipio}`,
                success: function(response){
                    var valor=response.data;
                    if (valor!=0){
                        relojChart.setOption({
                            series: [
                            {data: [{value: valor,}]},
                            {data: [{value: valor,}]}
                            ]
                        });
                    }else{
                        relojChart.setOption({
                            series: [
                                {data: []},
                                {data: []}
                            ]
                        });
                    }
                },
                error:function (error){
                }
            });
        }).change();
    });
});
relojChart.setOption(relojoption);
