<?php
	use Carbon\Carbon;
	use App\Models\Oferta;
	use App\Models\Ciudad;
	use App\Models\Sector;
	use App\Models\Empleador;
    Carbon::setLocale(config('app.locale'));
	//echo "Hoy es : ".Carbon::now()->format('l j F Y h:i:s A');
  	$vacio=true;
?>
<section class="content">
	<div class="row">
	   <br/>
	</div>
	<div class="row">
	   <div class="col-md-12">
			 <div class="container">
				 <div class="row">
				 @if (!empty($ofertas))
				  @foreach($ofertas as $item)

              {{ 	$vacio=false }}
				   <div class="col-lg-4 col-md-4 col-sm-6">
							 <div class="single-blog" >
								  <a href="{{ route('ofertas.show', $item->id) }}"   >
											<img src="{{ $item->url_imagen }}" class="img-responsive center-block "   >
											<h2>{{ $item->nombre }}</h2>
											<ul class="post-meta">
													<li><i class="fa fa-pencil-square-o"></i><strong> Publicado por: </strong> {{ Empleador::where([ ['id', '=',$item->empleador_id] ] )->first()->empresa  }}</li>
													<li><i class="fa fa-clock-o"></i><strong> {{ $item->created_at->diffForHumans() }}</strong></li>
											</ul>
											<div class="blog-content">
													<p> {{ $item->descripcion }}.</p>
											</div>
											<hr/>
											<div class="blog-content">
												  	<p> {{ App\Models\Ciudad::find($item->ciudad_id)->first()->descripcion }}  - {{ $item->direccion }}   </p>
														<h5 class='text-right color_bprecio' > <i class="fa fa-usd" aria-hidden="true"></i>  {{ $item->paga }} COP.<h5>
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
</section>
