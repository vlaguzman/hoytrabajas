<div class="container-fluid">
   <div class="row">
     <div class="col-md-1">
     </div>
     <div class="col-md-10 f_white">
        <div class="text-center">
          <h3 class='tit_mb1' >Editar Oferta {{ $oferta->id }} </h3>
        </div>
     </div>
     <div class="col-md-1">

     </div>
   </div>
    <div class="row fondo_gris">
       <div class="col-md-12">
         <br/>
       </div>
    </div>

   <div class="row fondo_gris"   >
        <div class="col-md-1">
        </div>
         <div class="col-md-10 ">
            <div class="text-center">
                <div class="element">
                   <img id='set_ioferta' src="{{  $oferta->url_imagen }}"  class='img-responsive center-block hoverZoomLink set_imagen'  >
                   <input   type="hidden" name="id_oferta" id='id_oferta' value="{{  $oferta->id  }}">
                   <input type="file" name="upload_img_oferta" id="upload_img_oferta" accept="image/*" >
                </div>
            </div>
        </div>
       <div class="col-md-1">
       </div>
  </div>
  <div class="row fondo_gris">
    <div class="col-md-1">
    </div>
    <div class="col-md-10 ">
       <div class="text-center">
         <h3 class='tit_mb1' >Añadir Imagen</h3>
       </div>
    </div>
    <div class="col-md-1">
    </div>
  </div>
  <div class="row fondo_gris">
   <div class="col-md-12">
       <div class="text-center">
         <h4 class='tit_sp' >Toca la pantalla y añade la imagen</h4>
     </div>
   </div>
 </div>


<!-- Nombre Field -->
<div class="form-group col-sm-6">
    {!! Form::label('nombre', 'Titulo:') !!}
    {!! Form::text('nombre', null, ['class' => 'form-control']) !!}
</div>

<!-- Descripcion Field -->
<div class="form-group col-sm-12">
    {!! Form::label('descripcion', 'Descripcion:') !!}
    {!! Form::text('descripcion', null, ['class' => 'form-control']) !!}
</div>
<!-- Paga Field -->
<div class="form-group col-sm-6">
    {!! Form::label('paga', 'Valor:') !!}

    {!! Form::select('paga',[ '20.000 - 50.000' => '20.000 - 50.000 COP.',
                              '50.000 - 100.000' => '50.000 - 100.000 COP.',
                              '100.000 - 200.000' => '100.000 - 200.000 COP.',
                              '200.000 - 500.000' => '200.000 - 500.000 COP.',
                              '+500.000' => '+500.000 COP.'
                              ]
        , null, ['class' => 'form-control'   ] ) !!}
</div>



<!-- Sector Id Field -->
<div class="form-group col-sm-12">
    {!! Form::label('sector_id', 'Sector:') !!}
    {!! Form::select('sector_id',$sectores, null, ['class' => 'form-control'  ] ) !!}
</div>

<!-- Ciudad Id Field -->
<div class="form-group col-sm-6">
    {!! Form::label('ciudad_id', 'Ciudad:') !!}
    {!! Form::select('ciudad_id',$ciudades, null, ['class' => 'form-control','id' => 'ciudad_id '   ] ) !!}
</div>
<!-- Direccion Field -->
<div class="form-group col-sm-10">
    {!! Form::label('direccion', 'Direccion:') !!}
    {!! Form::text('direccion', null, ['class' => 'form-control','id' => 'direccion'  ]) !!}
</div>
<div class="form-group col-sm-2">
    <br/>
    <a  onclick="buscar_direccion_();" class="btn btn-default"><i class="fa fa-search"></i></a>
</div>
<div class="form-group col-sm-6">
    {!! Form::label('lat', 'Latitud:') !!}
    {!! Form::text('lat', null, ['class' => 'form-control','id' => 'flat'    ]  ) !!}
</div>
<div class="form-group col-sm-6">
     {!! Form::label('lng', 'Longitud:') !!}
     {!! Form::text('lng', null, ['class' => 'form-control','id' => 'flng'  ]) !!}
</div>
<div class="row ">
  <div class="col-md-12">
   <div id="map" style="height: 500px"   ></div>
   <script type="text/javascript">
     var map;
      function initMap() {
           console.debug('cargando mapa...');
            var vlat = $('#flat').val();
            var vlng = $('#flng').val();
            console.debug('cargando mapa, punto LAT='+vlat+" LONGITUD="+vlng );
            if(vlat==0 || vlng==0 || vlat=="" || vlng=="" ||  vlat==undefined || vlng==undefined ){
                 vlat = 4.6566464;
                 vlng = -74.1470262;
            }
            var latx= parseFloat(vlat);
	          var lonx=  parseFloat(vlng);
            var myLatLng = {lat: latx, lng: lonx};
            var mapOptions = {
                zoom: 14,
                center: myLatLng
              }
          map = new google.maps.Map(document.getElementById("map"), mapOptions);
          var marker = new google.maps.Marker({
                position: myLatLng,
                draggable:true,
                map: map,
                animation: google.maps.Animation.DROP,
                title: 'Aqui!'
          });
          marker.setMap(map);
          google.maps.event.addListener(marker, 'drag', function(e) {
      				geocodeLatLng( map,marker);
      		});
      }

      function geocodeLatLng( map,marker) {
            console.debug("Resultado mover o click del marcador ")
            geocoder_for1 = new google.maps.Geocoder();
            geocoder_for1.geocode({'location': marker.getPosition()}, function(results, status) {
                if (status === google.maps.GeocoderStatus.OK) {
                 console.debug("Resultado mover o click del marcador: OK ,"+results)
                  if (results && results.length > 0 ) {
                    for( i=0; i< results.length ; i++){
                        console.debug("Resultado mover o click del marcador:  "+results[i].formatted_address )
                    }
                    var add1=results[0].formatted_address.split(',');
                    $('#direccion').val(add1[0]);
                    $('#flat').val(results[0].geometry.location.lat());
                    $('#flng').val(results[0].geometry.location.lng());
                    console.debug("Resultado mover o click del marcador:  "+add1[0])
                  } else {
                console.debug("Resultado mover o click del marcador: SIN RESULTADOS ")
                  }
                } else {
                   console.debug("Resultado mover o click del marcador: NO LOCALIZADO ")
                }
            });
         }

         function buscar_direccion_(){
               var address = $('#direccion').val();
               var $pais_tx ='Colombia';
               var $ciud_tx =$('#ciudad_id option:selected').text();
               var geocoder = new google.maps.Geocoder();
               address=address+", "+$ciud_tx+", "+$pais_tx;
               console.debug("Buscar direccion p3 buscar: "+address)
               geocoder.geocode({ 'address': address}, geocodeResult);
          }

         function geocodeResult(results, status) {
              	console.debug("Buscar direccion p4 resultado "+status)
                    if (status == 'OK') {
                          $('#flat').val(results[0].geometry.location.lat());
                          $('#flng').val(results[0].geometry.location.lng());
                    		  console.debug("Buscar direccion p5 pintando ")
                          var mapOptions = {
                    			      zoom: 20,
                                center: results[0].geometry.location,
                                mapTypeId: google.maps.MapTypeId.ROADMAP
                            };
                    		 map = new google.maps.Map(document.getElementById("map"), mapOptions);
                         map.fitBounds(results[0].geometry.viewport);
                         var marker = new google.maps.Marker({
                               position: results[0].geometry.location,
                               draggable:true,
                               map: map,
                               animation: google.maps.Animation.DROP,
                               title: 'Direccion encontrada!'
                         });

                        marker.setMap(map);
                        google.maps.event.addListener(marker, 'drag', function(e) {
                    				  geocodeLatLng( map,marker);
                    		});
                    		 console.debug("Buscar direccion p6 pintando OK-- ")

                  }else{

                  }
          }


      </script>

      <script async defer
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA1c5fXxWdutyXZPPBHZTKHvJbyo1yAVDY&callback=initMap">
      </script>
    </div>
</div>


<!-- Submit Field -->
<div class="form-group col-sm-12">
    <br/>
</div>
  <div class="form-group col-sm-12">
      <div class="text-center">
          {!! Form::submit('Guardar', ['class' => 'btn btn-primary']) !!}
          <a href="{{ redirect()->back()->getTargetUrl() }}" class="btn btn-default"><i class="icon ion-android-arrow-back"></i></a>
      </div>
  </div>
</div>
