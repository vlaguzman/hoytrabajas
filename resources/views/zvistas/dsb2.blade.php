<?php
	use Carbon\Carbon;
    Carbon::setLocale(config('app.locale'));
	use App\Models\Empleador;
	use App\Models\Ciudad;
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
											<div class="blog-tits" >
													<p class='color_tit3x' > {{ $item->nombre }} </p>
													<div class="post-meta">
															<div class="row">
 															   <div class="col-md-12">
 																	 <p class='color_tit1x' >	<i class="fa fa-pencil-square-o"></i> <strong> Publicado por: </strong>  {{ Empleador::where([ ['id', '=',$item->empleador_id] ] )->first()->empresa  }} </p>
 																 </div>
 															</div>

 															<div class="row">
  															   <div class="col-md-12">
  																	 <p class='color_tit1x' ><i class="fa fa-clock-o"></i><strong> {{ $item->created_at->diffForHumans() }}</strong></p>
  																 </div>
  															</div>

													</div>
													<div class="blog-content">
															<p> {{ $item->descripcion }}.</p>
													</div>
													<hr/>
													<div class="blog-content">
														   <div class="text-center">
														  	  <p class='color_bdir' > {{ Ciudad::where([ ['id', '=',$item->ciudad_id] ] )->first()->descripcion }} - {{ $item->direccion }}  </p>
																  <h5 class='color_bprecio' > <i class="fa fa-usd" aria-hidden="true"></i>  {{ $item->paga }} COP.<h5>
															 </div>
													</div>
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
