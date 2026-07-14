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


//riesgo
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
});
var map = new ol.Map({
target: 'map',
layers: [
new ol.layer.Tile({
source: new ol.source.OSM()
          }),
          Belice,
          riesgo_Alto,
          riesgo_Bajo,
          riesgo_Medio,
          riesgo_Muy_Alto,
          riesgo_Muy_Bajo
],
view: new ol.View({
  
    projection: 'EPSG:4326',
    center: [-90.529092, 15.75],
    zoom:7.40,
    minzoom:0

})
});

var style_selected = new ol.style.Style({ //style to be added on selected layer
        fill: new ol.style.Fill({
        color: '#6603fc'
      }),
       stroke: new ol.style.Stroke({
          color: '#000000',
          width: 1,
          opacity:1
        })
    });


const selectSingleClick = new ol.interaction.Select({style: style_selected});
var select = new ol.interaction.Select({style: style_selected});
var selectedFeatures = select.getFeatures();

map.addInteraction(selectSingleClick);
selectSingleClick.on('select', function (e) {
  var a = e.target.getFeatures().R[0].A.Codigo;
  $("#municipio").val(a).change();
  $("#cod_municipio").val(a).change();
});


function limpiar(){
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
}
function layers() {
  var x ='riesgo';
    limpiar();
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
}

function level(val) {
limpiar();
  var vi=document.getElementById("municipio").value;
  var y = 0;

  if (val==0){
    if(y>0){
      $("#municipio").val(0).change();
      vi=0;
      nada();
    }
  }else{
    if(vi>0){
      buscar2(vi);

      drawingSource.clear();
      map.removeLayer(drawingLayer);
      select.setActive(false)
      selectSingleClick.setActive(true);
      draw.setActive(false);
      y=0;
    }
  }

  
if ((y == 4) || (y == 0))
{
riesgo_Alto.setVisible(true);
riesgo_Alto.getSource().changed();
}
if ((y == 2) || (y == 0))
{
riesgo_Bajo.setVisible(true);
riesgo_Bajo.getSource().changed();
}
if ((y == 3) || (y == 0))
{
riesgo_Medio.setVisible(true);
riesgo_Medio.getSource().changed();
}
if ((y == 5) || (y == 0))
{
riesgo_Muy_Alto.setVisible(true);
riesgo_Muy_Alto.getSource().changed();
}
if ((y == 1) || (y == 0))
    {
    riesgo_Muy_Bajo.setVisible(true);
    riesgo_Muy_Bajo.getSource().changed();
    }
}


function codigo2(capa,valor){
  var features = capa.getSource().getFeatures();
  for (var i = 0 ; i < features.length; i++){
     if(features[i].A.Codigo==valor){
       b = features[i];
       selectedFeatures.push(b);
     }
   }
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
   codigo(riesgo_Alto,a)
   codigo(riesgo_Bajo,a)
   codigo(riesgo_Medio,a)
   codigo(riesgo_Muy_Alto,a)
   codigo(riesgo_Muy_Bajo,a)
}


var select = new ol.interaction.Select({style: style_selected});

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
    $('#combo').show();
      selectSingleClick.getFeatures().clear();
      selectSingleClick.setActive(false);
      //polígonos
      map.addInteraction(select);

      map.addLayer(drawingLayer);

      if (mobileAndTabletCheck()){
        draw = new ol.interaction.Draw({
          source : drawingSource,
          type : tipo,
          condition: ol.events.condition.never,
          freehandCondition: ol.events.condition.always,
          });
        map.getInteractions().forEach(function(interaction) {
          if (interaction instanceof ol.interaction.DragPan) {
              interaction.setActive(false);
          }
        }, this);
      }
      else{
        draw = new ol.interaction.Draw({
          source : drawingSource,
          type : tipo,
          condition : ol.events.condition.platformModifierKeyOnly
          });
      }
      
      map.addInteraction(draw);
   


      draw.on('drawstart',function(event){
        drawingSource.clear();
        select.setActive(false);
        selectedFeatures.clear(); 

         if (mobileAndTabletCheck()){
            map.getInteractions().forEach(function(interaction) {
              if (interaction instanceof ol.interaction.DragPan) {
                  interaction.setActive(false);
              }
            }, this);
      }

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
        evaluar(riesgo_Alto,polygon);
        evaluar(riesgo_Bajo,polygon);
        evaluar(riesgo_Medio,polygon);
        evaluar(riesgo_Muy_Alto,polygon);
        evaluar(riesgo_Muy_Bajo,polygon);
        map.addInteraction(new ol.interaction.DragPan);
      });

      function delaySelectActivate(){
        setTimeout(function(){
          select.setActive(true)
        },300);
      }
      
      }



      function buscar2(a){
        tipo = 'Polygon'
        dibujar()
        buscar(a)
        draw.setActive(false)
        map.removeLayer(drawingLayer);
        map.addInteraction(new ol.interaction.DragPan);
      }

      function buscara(a){
         codigo2(riesgo_Alto,a)
         codigo2(riesgo_Bajo,a)
         codigo2(riesgo_Medio,a)
         codigo2(riesgo_Muy_Alto,a)
         codigo2(riesgo_Muy_Bajo,a)
      }

      function buscar3(a){
        var variable=(a[0]);
        console.log(variable);
        if(variable!=''){
          selectedFeatures.clear();
          tipo = 'Polygon';  
          dibujar()
          for (var i = 0 ; i < a.length; i++){
            buscara(a[i]);
          }
          draw.setActive(false)
          map.removeLayer(drawingLayer);
          select.setActive(false)
          selectSingleClick.setActive(true);
          map.addInteraction(new ol.interaction.DragPan);
        }
      }

      
      function nada(){
      $('#combo').hide();
      drawingSource.clear();
      selectedFeatures.clear(); 
      map.removeLayer(drawingLayer);
      select.setActive(false)
      selectSingleClick.setActive(true);
      draw.setActive(false)
      }


map.once('rendercomplete', () => buscar3(codes.replace('[','').replace(']','').split(',')));


window.mobileAndTabletCheck = function() {
  let check = false;
  (function(a){if(/(android|bb\d+|meego).+mobile|avantgo|bada\/|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|iris|kindle|lge |maemo|midp|mmp|mobile.+firefox|netfront|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\/|plucker|pocket|psp|series(4|6)0|symbian|treo|up\.(browser|link)|vodafone|wap|windows ce|xda|xiino|android|ipad|playbook|silk/i.test(a)||/1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\-(n|u)|c55\/|capi|ccwa|cdm\-|cell|chtm|cldc|cmd\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\-s|devi|dica|dmob|do(c|p)o|ds(12|\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\-|_)|g1 u|g560|gene|gf\-5|g\-mo|go(\.w|od)|gr(ad|un)|haie|hcit|hd\-(m|p|t)|hei\-|hi(pt|ta)|hp( i|ip)|hs\-c|ht(c(\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\-(20|go|ma)|i230|iac( |\-|\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\/)|klon|kpt |kwc\-|kyo(c|k)|le(no|xi)|lg( g|\/(k|l|u)|50|54|\-[a-w])|libw|lynx|m1\-w|m3ga|m50\/|ma(te|ui|xo)|mc(01|21|ca)|m\-cr|me(rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\-2|po(ck|rt|se)|prox|psio|pt\-g|qa\-a|qc(07|12|21|32|60|\-[2-7]|i\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\-|oo|p\-)|sdk\/|se(c(\-|0|1)|47|mc|nd|ri)|sgh\-|shar|sie(\-|m)|sk\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\-|v\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\-|tdg\-|tel(i|m)|tim\-|t\-mo|to(pl|sh)|ts(70|m\-|m3|m5)|tx\-9|up(\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|yas\-|your|zeto|zte\-/i.test(a.substr(0,4))) check = true;})(navigator.userAgent||navigator.vendor||window.opera);
  return check;
};

