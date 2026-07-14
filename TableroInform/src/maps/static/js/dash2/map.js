var style = function () {
  var zoom = map.getView().getZoom();
  var font_size = zoom * 1.80; // arbitrary value
  return new ol.style.Style({
              stroke: new ol.style.Stroke({color: '#000000',width: 3,lineDash: [.1, 5]}),
              fill:new ol.style.Fill({color:'#ffffff'}),
              text: new ol.style.Text({
                     font: font_size + 'px Calibri,sans-serif',
                    fill: new ol.style.Fill({ color: '#000' }),
                    text: 'Diferendo\nterritorial,\ninsular\ny\nmarítimo\npendiente\nde\nresolver.',
                  })
            })
};


//pelyexp
var Belice=new ol.layer.Vector({
  title: 'Belice',
  name: 'Belice',
  source: new ol.source.Vector({
              url: '/static/layers/Belice.geojson',
              format: new ol.format.GeoJSON()
            }),
  style: style,
  visible: true               
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
});

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

var map = new ol.Map({
target: 'map',
layers: [
    new ol.layer.Tile({
    source: new ol.source.OSM()
                }),
                Belice,
                Pelyexp_Alto,
                Pelyexp_Bajo,
                Pelyexp_Medio,
                Pelyexp_Muy_Alto,
                Pelyexp_Muy_Bajo
],
view: new ol.View({
        
          projection: 'EPSG:4326',
          center: [-90.529092, 15.75],
          zoom:7.40,
          minzoom:0 })  });
      
var style_selected = new ol.style.Style({ //style to be added on selected layer
        fill: new ol.style.Fill({
        color: '#6603fc'
      }),
       stroke: new ol.style.Stroke({
          color: '#6603fc',
          width: 3,
          opacity:1
        })
    });

const selectSingleClick = new ol.interaction.Select({style: style_selected});
var select = new ol.interaction.Select({style: style_selected});
var selectedFeatures = select.getFeatures();
var click = 0;     
     
     map.addInteraction(selectSingleClick);
    selectSingleClick.on('select', function (e) {
    
      var a = e.target.getFeatures().R[0].A.Codigo
      click=1;
      $("#municipio").val(a).change();
      document.getElementById('hidden_div').style.display = "none";
      document.getElementById('hidden_div_1').style.display = "block";
    });

function limpiar(){
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
  }
function layers() {
  var x = document.getElementById("layers").value;
      limpiar();
  if (x == 'riesgo') 
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
  
}
function level(val) {
    limpiar();
    var vi=document.getElementById("municipio").value;
    var y = document.getElementById("riesgo").value;

    if (val==0){
      if(y>0){
        $("#municipio").val(0).change();
        vi=0;
        nada();
      }else{

      }
    }else{
      if(vi>0){
        buscar2(vi);

        drawingSource.clear();
        map.removeLayer(drawingLayer);
          select.setActive(false)
          selectSingleClick.setActive(true);
          draw.setActive(false);  
        if(click==0){
          $("#riesgo").val(0).change();
          y=0;
        }
      }
    }
    if(vi==0){
      document.getElementById('hidden_div').style.display = "block";
      document.getElementById('hidden_div_1').style.display = "none";
    }else{
      document.getElementById('hidden_div').style.display = "none";
      document.getElementById('hidden_div_1').style.display = "block";
    }

    if ((y == 4) || (y == 0))
     {
      Pelyexp_Alto.setVisible(true);
      Pelyexp_Alto.getSource().changed();
     }
    if ((y == 2) || (y == 0))
     {
      Pelyexp_Bajo.setVisible(true);
      Pelyexp_Bajo.getSource().changed();
     }
    if ((y == 3) || (y == 0))
     {
      Pelyexp_Medio.setVisible(true);
      Pelyexp_Medio.getSource().changed();
     }
    if ((y == 5) || (y == 0))
     {
      Pelyexp_Muy_Alto.setVisible(true);
      Pelyexp_Muy_Alto.getSource().changed();
     }
     if ((y == 1) || (y == 0))
      {
        Pelyexp_Muy_Bajo.setVisible(true);
        Pelyexp_Muy_Bajo.getSource().changed();
      }
  click=0;
}



function codigo(capa,valor){
  var features = capa.getSource().getFeatures();
  for (var i = 0 ; i < features.length; i++){
     if(features[i].A.Codigo==valor){
        b = features[i];
        var ext=b.getGeometry().getExtent();
        var center=ol.extent.getCenter(ext);
        map.setView( new ol.View({
          projection: 'EPSG:4326',//or any projection you are using
          center: [center[0] , center[1]],//zoom to the center of your feature
          zoom: 9.5 //here you define the levelof zoom
        }));
        selectedFeatures.push(b);
     }
   }
}
function buscar(a){
selectedFeatures.clear();
   codigo(Pelyexp_Alto,a)
   codigo(Pelyexp_Bajo,a)
   codigo(Pelyexp_Medio,a)
   codigo(Pelyexp_Muy_Alto,a)
   codigo(Pelyexp_Muy_Bajo,a)
}


var select = new ol.interaction.Select({style:style_selected});

var drawingLayer = new ol.layer.Vector({
source: drawingSource
});

var drawingSource = new ol.source.Vector({
useSpatialIndex : false
});

var selectedFeatures = select.getFeatures();
var tipo = 'Polygon'
var draw



function dibujar (){
  selectSingleClick.getFeatures().clear();
  selectSingleClick.setActive(false);
  //polígonos
  map.addInteraction(select);

  map.addLayer(drawingLayer);
  draw = new ol.interaction.Draw({
  source : drawingSource,
  type : tipo,
  condition : ol.events.condition.platformModifierKeyOnly
  });
  map.addInteraction(draw);


  draw.on('drawstart',function(event){
  drawingSource.clear();
  select.setActive(false);
  selectedFeatures.clear(); 
  },this);
  function evaluar(capa,dibujo){
  var features = capa.getSource().getFeatures();
  for (var i = 0 ; i < features.length; i++){
  if(dibujo.intersectsExtent( features[i].getGeometry().getExtent() )){
      selectedFeatures.push(features[i]);
      cods.push(features[i].A.Codigo);
      var div=document.getElementById("cods");
      div.innerHTML +='<a  id="Codsa'+c+'" onclick="Quitar(\'Codsa'+c+'\', \'Cods'+c+'\')" class="btn btn-outline-dark btn-md" style="margin-right: 2%; margin-bottom: 2%;" title="haz click para eliminarme">'+features[i].A.Codigo+'</a>';
      div.innerHTML +='<input id="Cods'+c+'" class="form-control" name="Cods'+c+'" type="hidden" value="'+features[i].A.Codigo+'">'
      c=c+1;
      //console.log(features[i].A.Codigo)
  }
  } 
  }
  draw.on('drawend', function(event) {

  delaySelectActivate();
  selectedFeatures.clear();

  var polygon = event.feature.getGeometry();
  evaluar(Pelyexp_Alto,polygon);
  evaluar(Pelyexp_Bajo,polygon);
  evaluar(Pelyexp_Medio,polygon);
  evaluar(Pelyexp_Muy_Alto,polygon);
  evaluar(Pelyexp_Muy_Bajo,polygon);
  });

  function delaySelectActivate(){
  setTimeout(function(){
  select.setActive(true)
  },300);
  }
  //fin polígonos
  }



function buscar2(a){
  tipo = 'Polygon'
  dibujar()
  buscar(a)
  draw.setActive(false)
  map.removeLayer(drawingLayer);
}


function nada(){
  drawingSource.clear();
  selectedFeatures.clear(); 
  map.removeLayer(drawingLayer);
  select.setActive(false)
  selectSingleClick.setActive(true);
  draw.setActive(false)
  }