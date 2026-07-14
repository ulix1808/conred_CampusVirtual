var barrasdiv = document.getElementById('barrasdiv');
var barrasChart = echarts.init(barrasdiv);
var barrasoption;

barrasoption = {
  toolbox: {
  },
  xAxis: {
    type: 'category',
    axisLabel: { interval: 0, rotate: 30 },
    data: [
      {value: 'Muy Bajo',textStyle: {fontSize: 12}},
      {value: 'Bajo',textStyle: {fontSize: 12}},
      {value: 'Medio',textStyle: {fontSize: 12}},
      {value: 'Alto',textStyle: {fontSize: 12}},
      {value: 'Muy Alto',textStyle: {fontSize: 12}}]
  },
  yAxis: {
    type: 'value'
  },
  grid: {
    top: 44,
    bottom: 45,
    right: 20,
    left:37
  },
  series: [
    {
      label: {
        show: true,
        position: 'top',
        valueAnimation: true
      },
      data: [
        {
          value :0,
          itemStyle: {
            color: '#bee8ff'
          }
        },
        {
          value :0,
          itemStyle: {
            color: '#00c5ff'
          }
        },
        {
          value :0,
          itemStyle: {
            color: '#00a9e6'
          }
        },
        {
          value :0,
          itemStyle: {
            color: '#0084a8'
          }
        },
        {
          value :0,
          itemStyle: {
            color: '#004c73'
          }
        },
      ],
      type: 'bar'
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
                url:host+`info/get/102/${riesgo}/${municipio}`,
                success: function(response){
                    barrasChart.setOption({
                        xAxis: {
                            data: response.data[0]
                        },
                        series: [
                        {data: response.data[1]}
                        ]
                    });

                },
                error:function (error){
                }
            });
        }).change();
    });
});

barrasChart.setOption(barrasoption);
