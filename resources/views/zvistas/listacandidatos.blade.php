
@extends('layouts.app')
@section('content')
<section class="content" id="meet-team">
	<div class="row">
	   <div class="col-md-12">
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
									 @if (!empty($empleados1))
											<div class="container">
											@foreach($empleados1 as $item)
											  <div class="row">
													<div class="col-sm-6 col-md-3">

															<div class="team-member wow fadeInUp" data-wow-duration="400ms" data-wow-delay="0ms">
															    	<a href="{{ route('candidatos.show', $item->id) }}" >
																		 <div class="team-img">
																			    <div class="text-center">
							                               <img class="img-responsive center-block avatarxx1" src="{{ $item->url_imagen }}" alt="">
																					  </div>
							                        </div>

						                        <div class="team-info">
																			 <div class="text-center">
							                            <h3>{{ $item->nombres }} {{ $item->apellidos }}</h3>
							                            <span>{{ $item->experiencia }} Años experiencia</span>
																				</div>
						                        </div>
																		<p>{{ $item->descripcion }}</p>
																		</a>
																		<div class="text-center">
								                        <ul class="social-icons">
								                            <li><a href="#"><i class="fa fa-facebook"></i></a></li>
								                            <li><a href="#"><i class="fa fa-twitter"></i></a></li>
								                            <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
								                            <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
								                        </ul>
																			</div>
															  </div>

													</div>
											</div>
										 @endforeach
										 	</div>
									@else
 											@include('zvistas.noempleados')
									@endif

						   </div>
					 </div>
					 <div role="tabpanel" class="tab-pane fade" id="aceptado">
						  <div class="panel-body">
								 @if (!empty($empleados2))
								<div class="container">
								@foreach($empleados2 as $item)
									<div class="row">
										<div class="col-sm-6 col-md-3">
											<div class="team-member wow fadeInUp" data-wow-duration="400ms" data-wow-delay="0ms">
													 <div class="team-img">
																<img class="img-responsive center-block avatarxx1" src="{{ $item->url_imagen }}" alt="">
														</div>
														<div class="team-info">
																<h3>{{ $item->nombres }} {{ $item->apellidos }}</h3>
																<span>{{ $item->experiencia }} Años experiencia</span>
														</div>
														<p>{{ $item->descripcion }}</p>
														<ul class="social-icons">
																<li><a href="#"><i class="fa fa-facebook"></i></a></li>
																<li><a href="#"><i class="fa fa-twitter"></i></a></li>
																<li><a href="#"><i class="fa fa-google-plus"></i></a></li>
																<li><a href="#"><i class="fa fa-linkedin"></i></a></li>
														</ul>
											</div>
										</div>
								</div>
							 @endforeach
								</div>
							 @else
										@include('zvistas.noempleados')
								@endif
						   </div>
					 </div>
					 <div role="tabpanel" class="tab-pane fade" id="rechazado">
						  <div class="panel-body">
								  @if (!empty($empleados3))
								<div class="container">
								@foreach($empleados3 as $item)
									<div class="row">
										<div class="col-sm-6 col-md-3">
											<div class="team-member wow fadeInUp" data-wow-duration="400ms" data-wow-delay="0ms">
													 <div class="team-img">
																<img class="img-responsive center-block avatarxx1" src="{{ $item->url_imagen }}" alt="">
														</div>
														<div class="team-info">
																<h3>{{ $item->nombres }} {{ $item->apellidos }}</h3>
																<span>{{ $item->experiencia }} Años experiencia</span>
														</div>
														<p>{{ $item->descripcion }}</p>
														<ul class="social-icons">
																<li><a href="#"><i class="fa fa-facebook"></i></a></li>
																<li><a href="#"><i class="fa fa-twitter"></i></a></li>
																<li><a href="#"><i class="fa fa-google-plus"></i></a></li>
																<li><a href="#"><i class="fa fa-linkedin"></i></a></li>
														</ul>
											</div>
										</div>
								</div>
							 @endforeach
								</div>
							 @else
										@include('zvistas.noempleados')
								@endif
						   </div>
					 </div>
				</div>


	   </div>
	</div>
</section>
@endsection
