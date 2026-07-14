var radardiv = document.getElementById('radardiv');
var radarChart = echarts.init(radardiv);
var radaroption;

radaroption = {
  title: {
    text: ''
  },
  graphic: [
    {
      type: 'group',
      rotation: Math.PI / 4,
      bounding: 'raw',
      right: 110,
      bottom: 110,
      z: 100,
      children: [
        {
          type: 'rect',
          left: 'center',
          top: 'center',
          z: 100,
          shape: {
            width: 400,
            height: 50
          },
          style: {
            fill: 'rgba(0,0,0,0.15)'
          }
        },
        {
          type: 'text',
          left: 'center',
          top: 'center',
          z: 100,
          style: {
            fill: '#fff',
            text: 'INFORM GT 2021 | CONRED',
            font: 'bold 15px sans-serif'
          }
        }
      ]
    }],
  tooltip: {
    trigger: 'axis'
  },
  toolbox: {
    feature: {

      saveAsImage: {
          title : 'Descargar',
        }, 
    }
  },
  radar: {
    indicator: [
      { name: 'Indicador General', max: 6.70 },
      { name: 'Peligro y Exposición', max: 6.60 },
      { name: 'Falta de Capacidad de Respuesta', max: 8.80 },
      { name: 'Vulnerabilidad', max: 8.50 }
      
    ]
  },
  series:
    {
      name: 'Estadísticas',
      type: 'radar',
       tooltip: {
        trigger: 'item'
      },
      areaStyle: {},
      data: [
        {
          value: [0, 0, 0, 0],
          name: 'Estadísticas'
        }
      ]
    }
};


$(document).ready( function ()
{
  const municipio =  $("#municipio").val();
  console.log(municipio);
  $.ajax({
    type: 'GET',
    url:host+`radar/get/${municipio}`,
    success: function(response){
        radarChart.setOption({
          series:{
            data: [
              {
                value: response.data,
                name: ''
              }
            ]
          }
        });
    },
    error:function (error){
    }
  });
});
radarChart.setOption(radaroption);
