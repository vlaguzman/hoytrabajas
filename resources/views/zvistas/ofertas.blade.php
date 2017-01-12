@extends('layouts.app')
@section('content')

<?php
	   use Carbon\Carbon;
     use App\Models\Empleador;
     use App\Models\Usuario;
     use App\Models\Ciudad;
     Carbon::setLocale(config('app.locale'));

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
																 <p> {{ Ciudad::find($item->ciudad_id)->first()->descripcion }}  - {{ $item->direccion }}   </p>
																 <h5 class='text-right color_bprecio' > <i class="fa fa-usd" aria-hidden="true"></i>  {{ $item->paga }} COP.<h5>
													 </div>
											 </a>
									 </div>
								 </div>
								@endforeach
						 @else

							@endif



						</div>
         </div>
		   </div>
	</div>
</section>
@endsection
