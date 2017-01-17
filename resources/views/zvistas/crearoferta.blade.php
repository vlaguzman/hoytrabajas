@extends('layouts.app')
@section('content')
<section class="content">
	<div class="row">
	   <br/>
	</div>
	<div class="row">
	   <div class="col-md-1">
	   </div>
	   <div class="col-md-10">
			 <form method="post" action="{{ url('/registraroferta') }}" enctype="multipart/form-data"   >
 				 {!! csrf_field() !!}
			 	<div class="container-fluid">
						<div class="row">
							<div class="col-md-1">
							</div>
							<div class="col-md-10 f_white">
								 <div class="text-center">
									 <h3 class='tit_mb1' >Crear Oferta </h3>
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
									  <div id="cropContainerModal"></div>
		             </div>
		              <div class="col-md-10 ">
										 <div class="text-center">

											   <div class="element">
											 	    <img id='set_imagen' src="{{ $url_img_ }}"  class='img-responsive center-block hoverZoomLink set_imagen'  >
												    <input type="file" name="upload_img_" id="upload_img_" accept="image/*" >


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


				<div class="fondo_gris">
						<br />
						<div class="form-group has-feedback {{ $errors->has('tit') ? ' has-error' : '' }}">
								<div class="input-group">
									<span class="input-group-addon" ><span class="icon icon-event"></span></span>
								  Titulo
								@if ($errors->has('tit'))
									<span class="help-block">
										<strong>{{ $errors->first('tit') }}</strong>
									</span>
									@endif
							</div>
							<input type="text"  maxlength="100" class="form-control" name="tit"  id='oferta_cnombre' value="{{ old('tit') }}" placeholder="Nombre de la oferta" >
							<div class="text-center">
								<span id='cont_oferta_nombre' >0/100 caracteres </span>
							</div>
						</div>
					<div class="form-group has-feedback {{ $errors->has('des') ? ' has-error' : '' }}">
							<div class="input-group">
								<span class="input-group-addon" ><span class="icon icon-speech"></span></span>
							   Describe la vacante
								@if ($errors->has('des'))
									<span class="help-block">
										<strong>{{ $errors->first('des') }}</strong>
									</span>
									@endif
						</div>
						<input type="text" maxlength="250" class="form-control" name="des" id='oferta_cdes' value="{{ old('des') }}" placeholder="Ejemplo: necesitamos meseros" >

						<div class="text-center">
							 <span id='cont_oferta_des' >0/250 caracteres </span>
						 </div>
					</div>
					<div class="form-group has-feedback {{ $errors->has('pago') ? ' has-error' : '' }}">
							<div class="input-group">
								<span class="input-group-addon" ><span class="icon icon-pie-chart"></span></span>
						    Valor a pagar
							@if ($errors->has('pago'))
								<span class="help-block">
									<strong>{{ $errors->first('pago') }}</strong>
								</span>
								@endif
						 </div>
						 {!! Form::select('pago',[ '20.000 - 50.000' => '20.000 - 50.000 COP.',
																		   '50.000 - 100.000' => '50.000 - 100.000 COP.',
																		   '100.000 - 200.000' => '100.000 - 200.000 COP.',
																			 '200.000 - 500.000' => '200.000 - 500.000 COP.',
																			 '+500.000' => '+500.000 COP.'
																			 ]
								 , null, ['class' => 'form-control'   ] ) !!}
					</div>

					<div class="form-group "   >
							 <div class="input-group">
								  <span class="input-group-addon" > <span class="icon icon-heart"></span>  </span>
							    Sector de interes
						  </div>
							{!! Form::select('sector',$sectores, null, ['class' => 'form-control'   ] ) !!}
					</div>

					<div class="form-group "   >
					    <div class="input-group">
						      <span class="input-group-addon" > <span class="icon icon-location-pin"></span>  </span>
	                Ciudad
						</div>
					 	{!! Form::select('ciudad',$ciudades, null, ['class' => 'form-control'  ] ) !!}
					</div>
					<div class="form-group has-feedback {{ $errors->has('dire') ? ' has-error' : '' }}">
							<div class="input-group">
								<span class="input-group-addon" ><span class="icon icon-direction"></span></span>
								Direccion
							@if ($errors->has('dire'))
								<span class="help-block">
									<strong>{{ $errors->first('dire') }}</strong>
								</span>
								@endif
						</div>
							<input type="text" class="form-control" maxlength="200" name="dire" id='direccion' value="{{ old('dire') }}" placeholder="Calle ,Av, #" >
							<div class="text-center">
								 <span id='cont_oferta_dir' >0/200 caracteres </span>
							 </div>
					</div>
					<div class="row">
						<div class="col-xs-12">
								<a onclick="buscar_direccion_();" class="btn btn-primary btn-block btn-system03">Buscar direccion</a>
						</div>
				 </div>
				 <div class="row">
					 <div class="col-xs-3">
						   Lat:
					 </div>
					 <div class="col-xs-3">
							 <input type="text" class="form-control" name="lat"  id = 'flat' value='4.6566464'  >
					 </div>
					 <div class="col-xs-3">
							Lon:
					</div>
					<div class="col-xs-3">
							<input type="text" class="form-control" name="lng"  id = 'flng'  value='-74.1470262'  >
					</div>
				</div>
					<br />
				</div>

				<div class="row ">
				  <div class="col-md-12">
				   <div id="map" style="height: 500px"   ></div>
				   <script type="text/javascript">
				     var map;
				      function initMap() {
				           console.debug('cargando mapa...');
				            var latx= parseFloat(4.6566464);
					          var lonx=  parseFloat(-74.1470262);
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

					<div class="row">
						<div class="col-xs-12">
								<button type="submit" class="btn btn-primary btn-block btn-system01">Guardar Oferta </button>
						</div>
				 </div>
			 </div>





	   </form>

	   </div>
    <div class="col-md-1">
	   </div>
	</div>
</section>
@endsection
