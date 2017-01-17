<?php
	   use Carbon\Carbon;
     use App\Models\Mensaje;
     Carbon::setLocale(config('app.locale'));
     $notificaciones=Mensaje::getNotificacions( Auth::user()->id );
     $tt=Mensaje::ttNotificacions( Auth::user()->id );
     $tit="No hay mensajes";

		 $ttn=Mensaje::ttNotificacionsnews( Auth::user()->id );
     if($tt>0){
?>
<li class="dropdown messages-menu">
    <a href="#" id='leer_mensajes' class="dropdown-toggle" data-toggle="dropdown">
    	 <i class="fa fa-envelope-o fa-2x"></i>
    	 <span id='div_tt_nuevas' class="label label-success">{{  $ttn }}</span>
    </a>
    <ul class="dropdown-menu">
  	<li class="header"> <div id='div_tt_nuevas_' >   Tienes {{  $ttn }} mensajes nuevos  </div> </li>
  	<li>
  		<ul class="menu">
         @foreach($notificaciones as $item)
  		       <li>
							 @if ( $item->notifiable_type=='oferta' )
							 		<a href="{{ route('ofertas.show', $item->redirect_url) }}">
							@elseif ( $item->notifiable_type=='candidato' )
		 							 		<a href="{{ route('candidatos.show', $item->redirect_url) }}">
							 @else
							 		<a href="#">
							 @endif
                  <div class="pull-left">
                      <img src="{{ $item->image_url }}" class="img-circle" >
                  </div>
                  <h4>
                      {{ $item->type }}
                      <small><i class="fa fa-clock-o"></i> {{ $item->created_at->diffForHumans() }}  </small>
                  </h4>
                  <p>  {{ $item->data }}</p>
               </a>
            </li>
         @endforeach
  		</ul>
  	</li>
  	<li class="footer"><a href="#">Ver todos</a></li>
    </ul>
  </li>
<?php
   }
?>
