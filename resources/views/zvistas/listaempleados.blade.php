@extends('layouts.app')
@section('content')
<section class="content" id="meet-team">
  <div class="container">
	<div class="row">
		<div class="col-sm-12 col-md-12">
			@if (!empty($empleados))
			  <div class="container">
    				<ul class="media-list">
    				    @foreach($empleados as $item)
    					  <li class="media">
    						<div class="media-left">
    							<a href="#">
    							   <img class="media-object avatarxx1" src="{{ $item->url_imagen }}" alt="" >
    							</a>
    						</div>
    						<div class="media-body">
      							<h4 >{{ $item->nombres }} {{ $item->apellidos }}</h4>
                    <div class="my-rating-1" data-rating="{{ $item->rate }}"></div>
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
				   @include('zvistas.noencontrados')
			@endif
		</div>
	</div>
  </div>
</section>
@endsection
