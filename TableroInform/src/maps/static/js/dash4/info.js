$(document).ready( function ()
    {
        $(function() {
            $(".form-select").on('change', function() {
                const municipio =  $("#municipio").val();
                if(municipio>0){
                  $.ajax({
                      type: 'GET',
                      url:host+`detalles/get/1/${municipio}`,
                      success: function(response){
                          document.getElementById('tab_mun').innerHTML=response.data['municipio'];
                          document.getElementById('tab_dep').innerHTML=response.data['departamento'];
                          document.getElementById('tab_ran').innerHTML=response.data['ranking'];
                          document.getElementById('tab_ran_dep').innerHTML=response.data['ranking_dep'];
                      },
                      error:function (error){
                      }
                  });
                }
            }).change();
        });
    });