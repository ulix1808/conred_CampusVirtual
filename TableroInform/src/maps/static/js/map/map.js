var Pelyexp_Alto=new ol.layer.Vector({
        title: 'Pelyexp Alto',
        name: 'Pelyexp_Alto',
        source: new ol.source.Vector({
                    url: '/static/layers/color_pelyexp_alto.geojson',
                    format: new ol.format.GeoJSON()
                }),
        style: new ol.style.Style({
                    fill:new ol.style.Fill({color:'#734c00'}),
                    stroke: new ol.style.Stroke({color: '#000000',width: 1,})
                }),
        visible: false
    })
var Pelyexp_Bajo = new ol.layer.Vector({
        title: 'Pelyexp Bajo',
        name: 'Pelyexp_Bajo',
        source: new ol.source.Vector({
                    url: '/static/layers/color_pelyexp_bajo.geojson',
                    format: new ol.format.GeoJSON()
                }),
        style: new ol.style.Style({
                    fill:new ol.style.Fill({color:'#ffaa00'}),
                    stroke: new ol.style.Stroke({color: '#000000',width: 1,})
                }),
        visible: false
    })
var Pelyexp_Medio = new ol.layer.Vector({
        title: 'Pelyexp Medio',
        name: 'Pelyexp_Medio',
        source: new ol.source.Vector({
                    url: '/static/layers/color_pelyexp_medio.geojson',
                    format: new ol.format.GeoJSON()
                }),
        style: new ol.style.Style({
                    fill:new ol.style.Fill({color:'#a87000'}),
                    stroke: new ol.style.Stroke({color: '#000000',width: 1,})
                }),
        visible: false
    })
var Pelyexp_Muy_Alto = new ol.layer.Vector({
        title: 'Pelyexp Muy Alto',
        name: 'Pelyexp_Muy_Alto',
        source: new ol.source.Vector({
                    url: '/static/layers/color_pelyexp_muy_alto.geojson',
                    format: new ol.format.GeoJSON()
                }),
        style: new ol.style.Style({
                    fill:new ol.style.Fill({color:'#732600'}),
                    stroke: new ol.style.Stroke({color: '#000000',width: 1,})
                }),
        visible: false
    })
    var Pelyexp_Muy_Bajo = new ol.layer.Vector({
  title: 'Pelyexp Muy Bajo',
  name: 'Pelyexp_Muy_Bajo',
  source: new ol.source.Vector({
              url: '/static/layers/color_pelyexp_muy_bajo.geojson', // Asegúrate de tener este archivo GeoJSON
              format: new ol.format.GeoJSON()
            }),
  style: new ol.style.Style({
              fill: new ol.style.Fill({color: '#FDE6D7'}), // Color para Pelyexp muy bajo, se puede cambiar
              stroke: new ol.style.Stroke({color: '#000000', width: 1,})
            }),
  visible: false
})
//capres
var Capres_Alto = new ol.layer.Vector({//
        title: 'Capres Alto',
        name: 'Capres_Alto',
        source: new ol.source.Vector({
                    url: '/static/layers/color_capre_alto.geojson',
                    format: new ol.format.GeoJSON()
                }),
        style: new ol.style.Style({
                    fill:new ol.style.Fill({color:'#70a800'}),
                    stroke: new ol.style.Stroke({color: '#000000',width: 1,})
                }),
        visible: false
    })
var Capres_Bajo = new ol.layer.Vector({
        title: 'Capres Bajo',
        name: 'Capres_Bajo',
        source: new ol.source.Vector({
                    url: '/static/layers/color_capre_bajo.geojson',
                    format: new ol.format.GeoJSON()
                }),
        style: new ol.style.Style({
                    fill:new ol.style.Fill({color:'#e9ffbe'}),
                    stroke: new ol.style.Stroke({color: '#000000',width: 1,})
                }),
        visible: false
    })
var Capres_Medio = new ol.layer.Vector({
        title: 'Capres Medio',
        name: 'Capres_Medio',
        source: new ol.source.Vector({
                    url: '/static/layers/color_capre_medio.geojson',
                    format: new ol.format.GeoJSON()
                }),
        style: new ol.style.Style({
                    fill:new ol.style.Fill({color:'#98e600'}),
                    stroke: new ol.style.Stroke({color: '#000000',width: 1,})
                }),
        visible: false
    })
var Capres_Muy_Alto = new ol.layer.Vector({
        title: 'Capres Muy Alto',
        name: 'Capres_Muy_Alto',
        source: new ol.source.Vector({
                    url: '/static/layers/color_capre_muy_alto.geojson',
                    format: new ol.format.GeoJSON()
                }),
        style: new ol.style.Style({
                    fill:new ol.style.Fill({color:'#4c7300'}),
                    stroke: new ol.style.Stroke({color: '#000000',width: 1,})
                }),
        visible: false
    })
    var Capres_Muy_Bajo = new ol.layer.Vector({
  title: 'Capres Muy Bajo',
  name: 'Capres_Muy_Bajo',
  source: new ol.source.Vector({
              url: '/static/layers/color_capres_muy_bajo.geojson', // Asegúrate de tener este archivo GeoJSON
              format: new ol.format.GeoJSON()
            }),
  style: new ol.style.Style({
              fill: new ol.style.Fill({color: '#E1E9D8'}), // Color para Capres muy bajo, se puede cambiar
              stroke: new ol.style.Stroke({color: '#000000', width: 1,})
            }),
  visible: false
})
//vul
var Vul_Alto = new ol.layer.Vector({
        title: 'Vul Alto',
        name: 'Vul_Alto',
        source: new ol.source.Vector({
                    url: '/static/layers/color_vul_alto.geojson',
                    format: new ol.format.GeoJSON()
                }),
        style: new ol.style.Style({
                    fill:new ol.style.Fill({color:'#0084a8'}),
                    stroke: new ol.style.Stroke({color: '#000000',width: 1,})
                }),
        visible: false
    })
var Vul_Medio = new ol.layer.Vector({
        title: 'Vul Medio',
        name: 'Vul_Medio',
        source: new ol.source.Vector({
                    url: '/static/layers/color_vul_medio.geojson',
                    format: new ol.format.GeoJSON()
                }),
        style: new ol.style.Style({
                    fill:new ol.style.Fill({color:'#00a9e6'}),
                    stroke: new ol.style.Stroke({color: '#000000',width: 1,})
                }),
        visible: false
    })
var Vul_Muy_Alto = new ol.layer.Vector({
        title: 'Vul Muy Alto',
        name: 'Vul_Muy_Alto',
        source: new ol.source.Vector({
                    url: '/static/layers/color_vul_muy_alto.geojson',
                    format: new ol.format.GeoJSON()
                }),
        style: new ol.style.Style({
                    fill:new ol.style.Fill({color:'#004c73'}),
                    stroke: new ol.style.Stroke({color: '#000000',width: 1,})
                }),
        visible: false
    })
    var Vul_Bajo = new ol.layer.Vector({
  title: 'Vul Bajo',
  name: 'Vul_Bajo',
  source: new ol.source.Vector({
              url: '/static/layers/color_vul_bajo.geojson', // Asegúrate de tener este archivo GeoJSON
              format: new ol.format.GeoJSON()
            }),
  style: new ol.style.Style({
              fill: new ol.style.Fill({color: '#9AB5DC'}), // Color para Vul bajo, se puede cambiar
              stroke: new ol.style.Stroke({color: '#000000', width: 1,})
            }),
  visible: false
})
    var Vul_Muy_Bajo = new ol.layer.Vector({
  title: 'Vul Muy Bajo',
  name: 'Vul_Muy_Bajo',
  source: new ol.source.Vector({
              url: '/static/layers/color_vul_muy_bajo.geojson', // Asegúrate de tener este archivo GeoJSON
              format: new ol.format.GeoJSON()
            }),
  style: new ol.style.Style({
              fill: new ol.style.Fill({color: '#CCDAEE'}), // Color para Vul muy bajo, se puede cambiar
              stroke: new ol.style.Stroke({color: '#000000', width: 1,})
            }),
  visible: false
})
//riesgo
var riesgo_Alto = new ol.layer.Vector({
        title: 'riesgo Alto',
        name: 'riesgo_Alto',
        source: new ol.source.Vector({
                    url: '/static/layers/color_riesgo_alto.geojson',
                    format: new ol.format.GeoJSON()
                }),
        style: new ol.style.Style({
                    fill:new ol.style.Fill({color:'#a80000'}),
                    stroke: new ol.style.Stroke({color: '#000000',width: 1,})
                })
    })
    var riesgo_Bajo = new ol.layer.Vector({
        title: 'riesgo Bajo',
        name: 'riesgo_Bajo',
        source: new ol.source.Vector({
                    url: '/static/layers/color_riesgo_bajo.geojson',
                    format: new ol.format.GeoJSON()
                }),
        style: new ol.style.Style({
                    fill:new ol.style.Fill({color:'#ff7f7f'}),
                    stroke: new ol.style.Stroke({color: '#000000',width: 1,})
                })
    })
var riesgo_Medio = new ol.layer.Vector({
        title: 'riesgo Medio',
        name: 'riesgo_Medio',
        source: new ol.source.Vector({
                    url: '/static/layers/color_riesgo_medio.geojson',
                    format: new ol.format.GeoJSON()
                }),
        style: new ol.style.Style({
                    fill:new ol.style.Fill({color:'#ff0000'}),
                    stroke: new ol.style.Stroke({color: '#000000',width: 1,})
                })
    })
var riesgo_Muy_Alto = new ol.layer.Vector({
        title: 'riesgo Muy Alto',
        name: 'riesgo_Muy_Alto',
        source: new ol.source.Vector({
                    url: '/static/layers/color_riesgo_muy_alto.geojson',
                    format: new ol.format.GeoJSON()
                }),
        style: new ol.style.Style({
                    fill:new ol.style.Fill({color:'#730000'}),
                    stroke: new ol.style.Stroke({color: '#000000',width: 1,})
                })
    })
    var riesgo_Muy_Bajo = new ol.layer.Vector({
  title: 'riesgo Muy Bajo',
  name: 'riesgo_Muy_Bajo',
  source: new ol.source.Vector({
              url: '/static/layers/color_riesgo_muy_bajo.geojson', // Asegúrate de tener este archivo GeoJSON
              format: new ol.format.GeoJSON()
          }),
  style: new ol.style.Style({
              fill: new ol.style.Fill({color: '#FFC8BF'}), // Color para riesgo muy bajo, puede ser cambiado
              stroke: new ol.style.Stroke({color: '#000000', width: 1,})
          })
})
var map = new ol.Map({
target: 'map',
layers: [
    new ol.layer.Tile({
    source: new ol.source.OSM()
                }),
                Pelyexp_Alto,
                Pelyexp_Bajo,
                Pelyexp_Medio,
                Pelyexp_Muy_Alto,
                Pelyexp_Muy_Bajo,
                Capres_Alto,
                Capres_Bajo,
                Capres_Medio,
                Capres_Muy_Alto,
                Capres_Muy_Bajo,
                Vul_Alto,
                Vul_Medio,
                Vul_Muy_Alto,
                Vul_Bajo,
                Vul_Muy_Bajo,
                riesgo_Alto,
                riesgo_Bajo,
                riesgo_Medio,
                riesgo_Muy_Alto,
                riesgo_Muy_Bajo
],
view: new ol.View({

    center:[15.293304, -90.529092],
    zoom:2

})
});
      
      
const selectSingleClick = new ol.interaction.Select();
     
     
     map.addInteraction(selectSingleClick);
    selectSingleClick.on('select', function (e) {
    console.log(e.target.getFeatures().R[0])
      var a = e.target.getFeatures().R[0].A.Codigo
      alert(a)
    });
function limpiar(){
  Capres_Alto.setVisible(false);
  Capres_Alto.getSource().changed();
  Capres_Bajo.setVisible(false);
  Capres_Bajo.getSource().changed();
  Capres_Medio.setVisible(false);
  Capres_Medio.getSource().changed();
  Capres_Muy_Alto.setVisible(false);
  Capres_Muy_Alto.getSource().changed();
  Capres_Muy_Bajo.setVisible(false);
  Capres_Muy_Bajo.getSource().changed();
  Pelyexp_Alto.setVisible(false);
  Pelyexp_Alto.getSource().changed();
  Pelyexp_Bajo.setVisible(false);
  Pelyexp_Bajo.getSource().changed();
  Pelyexp_Medio.setVisible(false);
  Pelyexp_Medio.getSource().changed();
  Pelyexp_Muy_Alto.setVisible(false);
  Pelyexp_Muy_Alto.getSource().changed();
  Pelyexp_Muy_Bajo.setVisible(false);
  Pelyexp_Muy_Bajo.getSource().changed();
  riesgo_Alto.setVisible(false);
  riesgo_Alto.getSource().changed();
  riesgo_Bajo.setVisible(false);
  riesgo_Bajo.getSource().changed();
  riesgo_Medio.setVisible(false);
  riesgo_Medio.getSource().changed();
  riesgo_Muy_Alto.setVisible(false);
  riesgo_Muy_Alto.getSource().changed();
  riesgo_Muy_Bajo.setVisible(false);
  riesgo_Muy_Bajo.getSource().changed();
  Vul_Alto.setVisible(false);
  Vul_Alto.getSource().changed();
  Vul_Medio.setVisible(false);
  Vul_Medio.getSource().changed();
  Vul_Muy_Alto.setVisible(false);
  Vul_Muy_Alto.getSource().changed();
  Vul_Bajo.setVisible(false);
  Vul_Bajo.getSource().changed();
  Vul_Muy_Bajo.setVisible(false);
  Vul_Muy_Bajo.getSource().changed();
  }
function layers() {
  var x = document.getElementById("layers").value;
      limpiar();
  if (x == 'capres')
  {
      Capres_Alto.setVisible(true);
      Capres_Alto.getSource().changed();
      Capres_Bajo.setVisible(true);
      Capres_Bajo.getSource().changed();
      Capres_Medio.setVisible(true);
      Capres_Medio.getSource().changed();
      Capres_Muy_Alto.setVisible(true);
      Capres_Muy_Alto.getSource().changed();
      Capres_Muy_Bajo.setVisible(true);
      Capres_Muy_Bajo.getSource().changed();
   }
   
  if (x == 'pelyexp') 
  {
      Pelyexp_Alto.setVisible(true);
      Pelyexp_Alto.getSource().changed();
      Pelyexp_Bajo.setVisible(true);
      Pelyexp_Bajo.getSource().changed();
      Pelyexp_Medio.setVisible(true);
      Pelyexp_Medio.getSource().changed();
      Pelyexp_Muy_Alto.setVisible(true);
      Pelyexp_Muy_Alto.getSource().changed();  
      Pelyexp_Muy_Bajo.setVisible(true);
      Pelyexp_Muy_Bajo.getSource().changed();    
    
  }
  
  if (x == 'riesgo') 
  {
      riesgo_Alto.setVisible(true);
      riesgo_Alto.getSource().changed();
      riesgo_Bajo.setVisible(true);
      riesgo_Bajo.getSource().changed();
      riesgo_Medio.setVisible(true);
      riesgo_Medio.getSource().changed();
      riesgo_Muy_Alto.setVisible(true);
      riesgo_Muy_Alto.getSource().changed();
      riesgo_Muy_Bajo.setVisible(true);
      riesgo_Muy_Bajo.getSource().changed();
  }
  
    if (x == 'vul')
  {
      Vul_Alto.setVisible(true);
      Vul_Alto.getSource().changed();
      Vul_Medio.setVisible(true);
      Vul_Medio.getSource().changed();
      Vul_Muy_Alto.setVisible(true);
      Vul_Muy_Alto.getSource().changed();
      Vul_Bajo.setVisible(true);
      Vul_Bajo.getSource().changed();
      Vul_Muy_Bajo.setVisible(true);
      Vul_Muy_Bajo.getSource().changed();
  }
}
function level() {
    limpiar();
  var x = document.getElementById("layers").value;
  var y = document.getElementById("level").value;
  if (x == 'capres')
   {
   if ((y == 'alto') || (y == 'todos'))
    {
      Capres_Alto.setVisible(true);
      Capres_Alto.getSource().changed();
    }
   if ((y == 'bajo') || (y == 'todos'))
    {
      Capres_Bajo.setVisible(true);
      Capres_Bajo.getSource().changed();
    }
   if ((y == 'medio') || (y == 'todos'))
    {
      Capres_Medio.setVisible(true);
      Capres_Medio.getSource().changed();
    }
   if ((y == 'muyalto') || (y == 'todos'))
    {
      Capres_Muy_Alto.setVisible(true);
      Capres_Muy_Alto.getSource().changed();
    }
    if ((y == 'muybajo') || (y == 'todos'))
    {
      Capres_Muy_Bajo.setVisible(true);
      Capres_Muy_Bajo.getSource().changed();
    }
   }
   
  if (x == 'pelyexp') 
  {
    if ((y == 'alto') || (y == 'todos'))
     {
      Pelyexp_Alto.setVisible(true);
      Pelyexp_Alto.getSource().changed();
     }
    if ((y == 'bajo') || (y == 'todos'))
    {
      Pelyexp_Bajo.setVisible(true);
      Pelyexp_Bajo.getSource().changed();
    }
   if ((y == 'medio') || (y == 'todos'))
    {
      Pelyexp_Medio.setVisible(true);
      Pelyexp_Medio.getSource().changed();
    }
   if ((y == 'muyalto') || (y == 'todos'))
    {
      Pelyexp_Muy_Alto.setVisible(true);
      Pelyexp_Muy_Alto.getSource().changed();      
    }
    if ((y == 'muybajo') || (y == 'todos'))
    {
      Pelyexp_Muy_Bajo.setVisible(true);
      Pelyexp_Muy_Bajo.getSource().changed();    
    }
  }
  
  if (x == 'riesgo') 
  {
    if ((y == 'alto') || (y == 'todos'))
     {
      riesgo_Alto.setVisible(true);
      riesgo_Alto.getSource().changed();
     }
    if ((y == 'bajo') || (y == 'todos'))
     {
      riesgo_Bajo.setVisible(true);
      riesgo_Bajo.getSource().changed();
     }
    if ((y == 'medio') || (y == 'todos'))
     {
      riesgo_Medio.setVisible(true);
      riesgo_Medio.getSource().changed();
     }
   if ((y == 'muyalto') || (y == 'todos'))
     {
      riesgo_Muy_Alto.setVisible(true);
      riesgo_Muy_Alto.getSource().changed();
     }
     if ((y == 'muybajo') || (y == 'todos'))
     {
      riesgo_Muy_Bajo.setVisible(true);
      riesgo_Muy_Bajo.getSource().changed();
     }
  }
  
  if (x == 'vul')
  {
    if ((y == 'alto') || (y == 'todos'))
     {
      Vul_Alto.setVisible(true);
      Vul_Alto.getSource().changed();
     }
    if ((y == 'medio') || (y == 'todos'))
     {
      Vul_Medio.setVisible(true);
      Vul_Medio.getSource().changed();
     }
    if ((y == 'muyalto') || (y == 'todos'))
     {
      Vul_Muy_Alto.setVisible(true);
      Vul_Muy_Alto.getSource().changed();
     }
     if ((y == 'bajo') || (y == 'todos'))
     {
      Vul_Bajo.setVisible(true);
      Vul_Bajo.getSource().changed();
     }
     if ((y == 'muybajo') || (y == 'todos'))
     {
      Vul_Muy_Bajo.setVisible(true);
      Vul_Muy_Bajo.getSource().changed();
     }
  }
}