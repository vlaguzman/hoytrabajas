<?php
	   use Carbon\Carbon;
     use App\Models\Empleador;
     use App\Models\Usuario;
     use App\Models\Ciudad;
     Carbon::setLocale(config('app.locale'));

?>
<div class="container-fluid">

<div class="row">
   <div class="col-md-12">
       <div class="single-blog" >
              <img src="{{ $oferta->url_imagen }}" class="img-responsive center-block img50p"    >
							<div class="blog-tits" >
              <h2>{{ $oferta->nombre }}</h2>

               <div class="post-meta">
								 <div class="row">
										 <div class="col-md-12">
											 <p class='color_tit1x' >	<i class="fa fa-pencil-square-o"></i> <strong> Creado por: </strong>  {{ Empleador::where([ ['id', '=', $oferta->empleador_id] ] )->first()->contacto  }} </p>
										 </div>
									</div>

									<div class="row">
										 <div class="col-md-12">
											 <p class='color_tit1x' ><i class="fa fa-clock-o"></i><strong> {{  $oferta->created_at->diffForHumans() }}</strong></p>
										 </div>
									</div>
              </div>
              <div class="blog-content">
                  <p> {{ $oferta->descripcion }}.</p>
              </div>
							<hr/>
							<div class="blog-content">
								 <div class="text-center">
										<p class='color_bdir' > {{ Ciudad::where([ ['id', '=',$oferta->ciudad_id] ] )->first()->descripcion }}  - {{ $oferta->direccion }}   </p>
									  <h5 class='color_bprecio' > <i class="fa fa-usd" aria-hidden="true"></i>  {{ $oferta->paga }} COP.<h5>
							 	</div>


							</div>

				    </div>
      </div>


   </div>
</div>
 @if ( Auth::user()->perfil_id =='3' )
    <div class="row f_gris">
        <div class="col-md-12">
           <div class="text-center">
						   @if ( Auth::user()->postulado($oferta->id) )
									 <h2 class='tit_postulado' >Te postulaste  {{  Auth::user()->fechapostulado($oferta->id)->diffForHumans()  }}  </h2>
									 <input type="hidden"  id='limite' name="limite" value='{{  Auth::user()->fechapostuladolim($oferta->id)  }}'  >
										<div class="countdown barra_postulado "  >
											 Espera respuesta en : <span id="clock"   ></span>
										</div>
										<div class="progress">
											<div class="progress-bar progress-bar-info barra_rosada" role="progressbar" aria-valuenow="{{ Auth::user()->fechapostuladoprogreso($oferta->id)  }}" aria-valuemin="0" aria-valuemax="100" style="width: 20%">
													<span class="sr-only"></span>
											 </div>
										</div>
							@elseif ( Auth::user()->postulacionaceptado($oferta->id) )
									<div class="barra_aceptado "  >
										 Fuiste aceptado
									</div>
							@elseif ( Auth::user()->postulacionrechazado($oferta->id) )
										<div class="barra_aceptado "  >
											 Fuiste Rechazado
										</div>
						 	 @else
									 <a class="button button-block btn-system03"  href="{!! route('postulacion.registrar',$oferta->id ) !!}"  >
											Hoy Trabajo
								  	</a>
							 @endif
           </div>
        </div>
    </div>
    <div class="row f_gris">
        <div class="col-md-2">
           <div class="center-block ">
               <img src="{{ Usuario::where([ ['id', '=', Empleador::where([ ['id', '=', $oferta->empleador_id] ] )->first()->user_id  ] ] )->first()->url_imagen   }} " class="profile-picture-1 img-responsive center-block"  width="74px" alt="User Image"/>
           </div>
        </div>
        <div class="col-md-2">
             <h3 class="card-title evento-tit-6">{{  Empleador::where([ ['id', '=',$oferta->empleador_id] ] )->first()->empresa  }}  </h3>
						 <h3 class="evento-tit-7"><small>{{ Empleador::where([ ['id', '=',$oferta->empleador_id] ] )->count() }}  Publicaciones </small> </h3>
        </div>
        <div class="col-md-4">

        </div>
        <div class="col-md-4">
					  <?php
						   $emp_userid=Empleador::where([ ['id', '=',$oferta->empleador_id] ] )->first()->user_id ;
						  ?>
							@if ( Auth::user()->postulado($oferta->id) )
								  <a class="button button-block btn-system01"  href="{!! route('msgs.historico',  $emp_userid  ) !!}"  >
									   Escribenos
								  </a>
							@endif

        </div>
    </div>
  @endif

<div class="row f_gris">
		<div class="col-md-12  ">
      <div class="text-center">
				 <h2 class="card-title evento-tit-6">Comparte esta oferta con amigos</h2>
      </div>
		</div>
</div>
<div class="row f_gris">
   <div class="col-md-3 col-sm-3">

   </div>
   <div class="col-md-2 col-sm-2">
        <div class="text-center">
                <a class="btn_image f_gris"  onclick="javascript:window.open(this.href,'', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;"
                     href="https://www.facebook.com/sharer/sharer.php?u=http://www.hoytrabajas.com/htw/public/ofertas/{{ $oferta->id }} ">
                    <img src="{{ asset('images/facebook.png') }}" class='social-img '  >
               </a>
        </div>
    </div>
    <div class="col-md-2 col-sm-2">
         <div class="text-center">
            <a class='btn_image f_gris'   onclick="javascript:window.open(this.href,'', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;"
						    href="https://plus.google.com/share?url=http://www.hoytrabajas.com/htw/public/ofertas/{{ $oferta->id }}"  >
              <img src="{{ asset('images/google.png') }}"  class='social-img '  >
             </a>
          </div>
    </div>
    <div class="col-md-2 col-sm-2">
      <div class="text-center">
           <a class='btn_image f_gris'   >
               <img src="{{ asset('images/twitter.png') }}" class='social-img '  >
           </a>
        </div>
    </div>
    <div class="col-md-3 col-sm-3">

    </div>
</div>
<div class="row f_gris">
		<div class="col-md-12  ">
      <br/>
			<input type="hidden" id="flat" data-lat="{{ $oferta->lat }}">
			<input type="hidden" id="flng" data-lng="{{ $oferta->lng }}">

		</div>
</div>



  @if ( Auth::user()->perfil_id =='3' )
      <div class="row ">
          <div class="col-md-12">
							<div id="map" style="height: 500px"   ></div>
          </div>
      </div>
  @elseif ( Auth::user()->perfil_id =='2' )

	<section  id="meet-team">
			<div >
			 <ul class="nav nav-tabs " role="tablist">
					<li role="presentation" class="active" ><a href="#pendiente" aria-controls="pendiente" role="tab" data-toggle="tab">Pendientes</a></li>
					<li role="presentation" 								><a href="#aceptado"  aria-controls="aceptado"  role="tab" data-toggle="tab">Aceptados</a></li>
					<li role="presentation"							  ><a href="#rechazado" aria-controls="rechazado" role="tab" data-toggle="tab">Rechazados</a></li>
			 </ul>
		 </div>
		 <div class="tab-content ">
				 <div role="tabpanel" class="tab-pane fade in active" id="pendiente">
							<div class="panel-body">
								 @if (count($empleados1)>0)
									<ul class="media-list">
										@foreach($empleados1 as $item)
												<li class="media">
													<div class="container-fluid">
														<div class="row">
															<div class="col-sm-2 col-md-2 col-lg-2">

							    							<a href="{{ route('candidatos.show', $item->id) }}"  >
							    							   <img class="media-object avatarxx3" src="{{ $item->url_imagen }}" alt="" >
							    							</a>
					    					</div>
					    						<div class="col-sm-8 col-md-8 col-lg-8">
					      							<h4 >{{ $item->nombres }} {{ $item->apellidos }} <small> {{ $item->correo }} </small> </h4>
					                    <div class="my-rating-1" data-rating="{{ $item->rate }}"></div>
					                    <h5> {{ $item->experiencia }}  Años de experiencia </h5>
															<h5> Vence {{  Auth::user()->getFechaVence( $item->fpostulacion )->diffForHumans()  }}  </h5>

					    						</div>
												<div class="col-sm-2 col-md-2 col-lg-2">

														<a class='btn_image f_gris'   href="{!! route('postulacion.rechazar',$item->pid ) !!}"  >
															<img src="{{ asset('images/rechazar.png') }}"  class='social-img '  >
														</a>

														<a class='btn_image f_gris'   href="{!! route('postulacion.aprobar',$item->pid ) !!}"  >
														 	<img src="{{ asset('images/aceptar.png') }}"  class='social-img '  >
														</a>

												</div>


													</div>

													<div class="row">
														  <div class="col-sm-2 col-md-2 col-lg-2">
															</div>
															<div class="col-sm-8 col-md-8 col-lg-8">
																	<div class="progress">
																	  <div class="progress-bar progress-bar-info barra_rosada" role="progressbar" aria-valuenow="{{ Auth::user()->getVenceHoras( $item->fpostulacion )  }}" aria-valuemin="0" aria-valuemax="100" style="width: 20%">
																	      <span class="sr-only"></span>
																	   </div>
																	</div>
													    </div>
															<div class="col-sm-2 col-md-2 col-lg-2">
															</div>
													</div>


												</div>

										    </li>
					              <hr/>
									 @endforeach
									       </ul>

								@else
										@include('zvistas.noempleados')
								@endif

						 </div>
				 </div>
				 <div role="tabpanel" class="tab-pane fade" id="aceptado">
						<div class="panel-body">
							 @if (count($empleados2)>0)

									 <ul class="media-list">
							@foreach($empleados2 as $item)
											<li class="media">
												<div class="container-fluid">
													<div class="row">
														<div class="col-sm-2 col-md-2 col-lg-2">
																<a href="{{ route('candidatos.show', $item->id) }}">
																	 <img class="media-object avatarxx3" src="{{ $item->url_imagen }}" alt="" >
																</a>
														</div>
														<div class="col-sm-8 col-md-8 col-lg-8">

																	<h4 >{{ $item->nombres }} {{ $item->apellidos }} <small> {{ $item->correo }} </small> </h4>
																	<div class="my-rating-2" data-rating="{{ $item->rate }}"></div>
																	<h5> {{ $item->experiencia }}  Años de experiencia </h5>

														</div>
														<div class="col-sm-2 col-md-2 col-lg-2">
																<a class="button button-block"  href="{!! route('msgs.historico', $item->userid) !!}"  >
																	 <i class="icon-bubbles icono-5x l_secundary" aria-hidden="true"></i>
																</a>
														</div>

												</div>

											</div>
										</li>
										<hr/>
						 @endforeach
									 </ul>

						 @else
									@include('zvistas.noeaceptados')
							@endif
						 </div>
				 </div>
				 <div role="tabpanel" class="tab-pane fade" id="rechazado">
						<div class="panel-body">
								@if (count($empleados3)>0)
								<div class="container">
 									 <ul class="media-list">
							   @foreach($empleados3 as $item)
											<li class="media">
											<div class="media-left">
												<a href="{{ route('candidatos.show', $item->id) }}">
													 <img class="media-object avatarxx3" src="{{ $item->url_imagen }}" alt="" >
												</a>
											</div>
											<div class="media-body">
													<h4 >{{ $item->nombres }} {{ $item->apellidos }} <small> {{ $item->correo }} </small> </h4>
													<div class="my-rating-2" data-rating="{{ $item->rate }}"></div>
													<h5> {{ $item->experiencia }}  Años de experiencia </h5>
											</div>
											<div class="media-right">
												<a class="button button-block"  href="{!! route('msgs.historico', $item->userid) !!}"  >
													 <i class="icon-bubbles icono-5x l_secundary" aria-hidden="true"></i>
												</a>
											</div>
										</li>
										<hr/>
						 @endforeach
									 </ul>
							</div>
						 @else
									@include('zvistas.noerechazados')
							@endif
						 </div>
				 </div>
			</div>
	</section>
	<div class="row ">
			<div class="col-md-12">
					<div id="map" style="height: 500px"   ></div>
			</div>
	</div>
  @else
    <div class="row ">
        <div class="col-md-12">
           <div id="map" style="height: 500px"   ></div>
        </div>
    </div>

  @endif


</div>

	<script type="text/javascript">
		 function initMap() {
					console.debug('cargando mapa...');
					 var vlat = $('#flat').data('lat');
					 var vlng = $('#flng').data('lng');
					 console.debug('cargando mapa, punto LAT='+vlat+" LONGITUD="+vlng );
					 if(vlat==0 || vlng==0 || vlat=="" || vlng=="" ||  vlat==undefined || vlng==undefined ){
								vlat = 4.6566464;
								vlng = -74.1470262;
					 }
					 var myLatLng = {lat: vlat, lng: vlng};
					 var mapOptions = {
							 zoom: 14,
							 center: myLatLng
						 }
				 var map = new google.maps.Map(document.getElementById("map"), mapOptions);
				 var marker = new google.maps.Marker({
							 position: myLatLng,
							 map: map,
							 animation: google.maps.Animation.DROP,
							 title: 'Aqui!'
				 });
				 marker.setMap(map);

		 }

		 </script>
		 <script async defer
			 src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA1c5fXxWdutyXZPPBHZTKHvJbyo1yAVDY&callback=initMap">
		 </script>
