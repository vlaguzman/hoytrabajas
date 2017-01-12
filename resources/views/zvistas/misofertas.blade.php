
@extends('layouts.app')
@section('content')
<?php
	   use Carbon\Carbon;
     use App\Models\Empleador;
     use App\Models\Usuario;
     use App\Models\Ciudad;
     Carbon::setLocale(config('app.locale'));
    $vacio=true;
?>
<section class="content">
	<div class="row">
	   <br/>
	</div>
	<div class="row">
	   <div class="col-md-12">
			 <div >
					<ul class="nav nav-tabs " role="tablist">
					   <li role="presentation" class="active" ><a href="#activa" aria-controls="activa" role="tab" data-toggle="tab">Activas</a></li>
					   <li role="presentation" 								><a href="#finalizada"  aria-controls="finalizada"  role="tab" data-toggle="tab">Finalizadas</a></li>
					</ul>
				</div>
				<div class="tab-content ">
					 <div role="tabpanel" class="tab-pane fade in active" id="activa">
						    <div class="panel-body">

									<div class="container">
									 <div class="row">
										@if (!empty($ofertas1))
										 @foreach($ofertas1 as $item)
										     {{ 	$vacio=false }}
											<div class="col-lg-4 col-md-4 col-sm-6">
													<div class="single-blog" >
														 <a href="{{ route('ofertas.show', $item->id) }}"   >
																 <img src="{{ $item->url_imagen }}" class="img-responsive center-block "   >
																 <h2>{{ $item->nombre }}</h2>
																 <ul class="post-meta">
																		 <li><i class="fa fa-pencil-square-o"></i><strong> Publicado por: </strong> {{ Empleador::where([ ['id', '=',$item->empleador_id] ] )->first()->empresa  }}</li>
																		 <li><i class="fa fa-clock-o"></i><strong> {{ $item->created_at->diffForHumans()  }}</strong></li>
																 </ul>
																 <div class="blog-content">
																		 <p> {{ $item->descripcion }}.</p>
																 </div>
																 <hr/>
																 <div class="blog-content">
																			 <p> {{ Ciudad::find($item->ciudad_id)->first()->descripcion }}  - {{ $item->direccion }}   </p>
																			 <h5 class='text-right color_bprecio' > <i class="fa fa-usd" aria-hidden="true"></i>  {{ $item->paga }} COP.<h5>
																 </div>
																 <hr/>
 																<div class="blog-content">

 															   {!! Form::open(['route' => ['ofertas.destroy', $item->id], 'method' => 'delete']) !!}
																   <div class="text-right">
		 																		<div class='btn-group'>
		 																					<a href="{{ route('ofertas.edit', $item->id) }}" class='btn btn-default btn-lg'>
		 																						        <i class="icon ion-edit"></i>
		 																					</a>
		 																					{!! Form::button('<i class="glyphicon glyphicon-trash"></i>', [
		 																						        'type' => 'submit',
		 																						        'class' => 'btn btn-danger btn-lg',
		 																						        'onclick' => "return confirm('Confirma que desea eliminar la oferta?')"
		 																					]) !!}
		 																	  </div>
																	</div>
 																	{!! Form::close() !!}
 														  </div>
														 </a>
												 </div>
											 </div>
											@endforeach
										@endif
										@if ($vacio)
											 @include('zvistas.noofertas')
										@endif

									</div>
								 </div>


						   </div>
					 </div>
					 <div role="tabpanel" class="tab-pane fade" id="finalizada">
						  <div class="panel-body">

								<div class="container">
								 <div class="row">
									@if (!empty($ofertas2))
									 @foreach($ofertas2 as $item)
										<div class="col-lg-4 col-md-4 col-sm-6">
												<div class="single-blog" >
													 <a href="{{ route('ofertas.show', $item->id) }}"   >
															 <img src="{{ $item->url_imagen }}" class="img-responsive center-block "   >
															 <h2>{{ $item->nombre }}</h2>
															 <ul class="post-meta">
																	 <li><i class="fa fa-pencil-square-o"></i><strong> Publicado por: </strong> {{ Empleador::where([ ['id', '=',$item->empleador_id] ] )->first()->empresa  }}</li>
																	 <li><i class="fa fa-clock-o"></i><strong> {{ $item->created_at->diffForHumans()  }}</strong></li>
															 </ul>
															 <div class="blog-content">
																	 <p> {{ $item->descripcion }}.</p>
															 </div>
															 <hr/>
															 <div class="blog-content">
																		 <p> {{ Ciudad::find($item->ciudad_id)->first()->descripcion }}  - {{ $item->direccion }}   </p>
																		 <h5 class='text-right color_bprecio' > <i class="fa fa-usd" aria-hidden="true"></i>  {{ $item->paga }} COP.<h5>
															 </div>
															  <hr/>
																<div class="blog-content">
															   {!! Form::open(['route' => ['ofertas.destroy', $item->id], 'method' => 'delete']) !!}
																		<div class='btn-group'>
																					<a href="{{ route('ofertas.edit', $item->id) }}" class='btn btn-default btn-lg'>
																						    <i class="icon ion-edit"></i>
																					</a>
																					{!! Form::button('<i class="glyphicon glyphicon-trash"></i>', [
																						        'type' => 'submit',
																						        'class' => 'btn btn-danger btn-lg',
																						        'onclick' => "return confirm('Confirma que desea eliminar la oferta?')"
																					]) !!}
																	</div>
																	{!! Form::close() !!}
														  </div>

													 </a>
											 </div>
										 </div>
										@endforeach
								 @else
											@include('zvistas.noofertasfin')
									@endif
								</div>
							 </div>

						   </div>
					 </div>
				</div>
	   </div>
	</div>
</section>
@endsection
