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
            color: '#e9ffbe'
          }
        },
        {
          value :0,
          itemStyle: {
            color: '#d1ff73'
          }
        },
        {
          value :0,
          itemStyle: {
            color: '#98e600'
          }
        },
        {
          value :0,
          itemStyle: {
            color: '#70a800'
          }
        },
        {
          value :0,
          itemStyle: {
            color: '#4c7300'
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
                url:host+`info/get/202/${riesgo}/${municipio}`,
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
