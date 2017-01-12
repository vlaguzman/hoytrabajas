@extends('layouts.app')
@section('content')

<section class="content bg_azul">
	<div class="row">
	   <br/>
	</div>
	<div class="row">
	   <div class="col-md-1">
	   </div>
	   <div class="col-md-10 "  >
			  <div class="bg_azul"  >
					<div class="bg_blanco">
								 <div class="row ">
									 <div class="col-md-12">
										 <br/> <br/>
									 </div>
								 </div>

								 <div class="row">
									 <div class="col-md-1">
									 </div>
									 <div class="col-md-10 f_white">
											<br/>
									 </div>
									 <div class="col-md-1">

									 </div>
								 </div>
								 <div class="row">
									 <div class="col-md-1">
									 </div>
									 <div class="col-md-10 f_white">
										  <div class="text-center">
										   	<h3 class='tit_mb1' >Renueva tu membresia </h3>
											</div>
									 </div>
									 <div class="col-md-1">

									 </div>
								 </div>
								 <div class="row">
									 <div class="col-md-1">

									 </div>
									 <div class="col-md-10 f_white">
										  <div class="text-center">
											   <h3 class='tit_mb2' >y sigue disfrutando de todos los beneficios</h3>
											</div>
									 </div>
									 <div class="col-md-1">

									 </div>
								 </div>
								 <div class="row">
									 <div class="col-md-1">
									 </div>
									 <div class="col-md-10 f_white">
										 <div class="text-center">
										   	<h3 class='tit_mb3' > {{ $msg }} COP.</h3>
											</div>
									 </div>
									 <div class="col-md-1">
									 </div>
								 </div>
								 <div class="row">
									 <div class="col-md-1">

									 </div>
									 <div class="col-md-10 f_white">
										  <div class="text-center">
										   	  <h3 class='tit_mb2' >La renovacion tiene un periodo de 90 dias</h3>
										  </div>
									 </div>
									 <div class="col-md-1">

									 </div>
								 </div>
								 <div class="row">
									 <div class="col-md-2">
									 </div>
									 <div class="col-md-8 f_white">
										  <div class="text-center">
											   <img src="{{ asset('images/menbresia.png') }} " class='img-responsive center-block' >
										  </div>
									 </div>
									 <div class="col-md-2 f_white">
									 </div>
								 </div>
								 <div class="row">
									 <div class="col-md-1">
									 </div>
									 <div class="col-md-10 f_white">
										  <div class="text-center">
											   <h3 class='tit_mb1' >¡Haz tu pago ahora!</h3>
											</div>
									 </div>
									 <div class="col-md-1">
									 </div>
								 </div>
								 <div class="row">
									 <div class="col-md-1">
									 </div>
									 <div class="col-md-10 f_white">
											<div class="text-center">
												  <h3 class='tit_mb4' >Puedes pagar tu membresia con tu medio de pago favorito, tenemos diferentes opciones disponibles</h3>
											</div>
									 </div>
									 <div class="col-md-1">
									 </div>
								 </div>

								 <div class="row">
									 <div class="col-md-1">
									 </div>
									 <div class="col-md-10 f_white">
											<br/>
									 </div>
									 <div class="col-md-1">

									 </div>
								 </div>
							 </div>
							 <div class="row">
								 <div class="col-md-12">
									 <a href="{!! url('/comprarmembresia3') !!}" class="btn btn-primary btn-block btn-system02"   >
										 Renovar Membresia
									 </a>
								 </div>
							 </div>
					</div>
	     </div>
       <div class="col-md-1">
	     </div>
	 </div>
	 <div class="row">
 	   <br/>
 	</div>
</section>
@endsection
