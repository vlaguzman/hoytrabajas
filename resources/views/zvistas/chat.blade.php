@extends('layouts.app')
@section('content')
<?php
	   use Carbon\Carbon;
     Carbon::setLocale('es');
?>
<section class="content" >
  <div class="container">
 	 <div class="row">
     <div class="col-md-4 ">
				<div class="activity_box">
					<h3>Lista de usuarios</h3>
					<div class="scrollbar scrollbar1" id="style-2">
              @foreach($usuarios as $item)
                  <a href="{!! route('msgs.historico', $item->id) !!}">
        						<div class="activity-row">
        							<div class="col-xs-3 activity-img"><img src='{{ $item->url_imagen }}' class="img-responsive avatarxx2" alt=""/></div>
        							<div class="col-xs-7 activity-desc">
        								<h5>{{ $item->des }} </h5>
        								<p>{{ $item->descripcion }} </p>
        							</div>
        							<div class="col-xs-2 activity-desc1">
                        <h6>
                           <i class="fa fa-comment-o fa-2x l_secundary" aria-hidden="true"></i>
                         </h6>
                       </div>
        							<div class="clearfix"> </div>
        						</div>
                </a>
              @endforeach
					</div>
				</div>
		</div>

    <div class="col-md-8">
      <div class="activity_box activity_box1">
        <h3>Conversacion {{ $chat_with }} </h3>
        <div class="scrollbar" id="style-2">

             <div id="mensajes">
               @if (!empty($historico) )
                  @foreach($historico as $item)
                  <?php
                      $carbon = new Carbon($item->created_at, 'America/Bogota');
                      $dt = Carbon::now();
                      $fechax=$carbon->format('d-m-Y  h:i');
                      $dias=$dt->diffInDays($carbon );
                      if($dt->day== $carbon->day  ){
                         $fechax="Hoy, ".$carbon->format('H:i');
                      }else if($dias>=1 && $dias<=7 ){
                          if ($carbon->dayOfWeek ==Carbon::SUNDAY ) {
                              $dia="Domingo, ";
                          }else if($carbon->dayOfWeek ==Carbon::MONDAY){
                              $dia="Lunes, ";
                          }else if($carbon->dayOfWeek ==Carbon::TUESDAY){
                              $dia="Martes, ";
                          }else if($carbon->dayOfWeek ==Carbon::WEDNESDAY){
                              $dia="Miercoles, ";
                          }else if($carbon->dayOfWeek ==Carbon::THURSDAY){
                              $dia="Jueves, ";
                          }else if($carbon->dayOfWeek ==Carbon::FRIDAY){
                              $dia="Viernes, ";
                          }else if($carbon->dayOfWeek ==Carbon::SATURDAY){
                              $dia="Sabado, ";
                          }
                          $fechax= $dia.$carbon->format('H:i');
                      }
                   ?>

                      @if ($item->deuser_id==Auth::user()->id  )
                        <div class="activity-row activity-row1">
                            <div class="col-xs-3 activity-img"><img src='{{ Auth::user()->url_imagen }}' class="img-responsive avatarxx1" alt=""/><span> {{ $fechax   }}  </span></div>
                            <div class="col-xs-5 activity-img1">
                              <div class="activity-desc-sub">
                                <h5>{{ Auth::user()->name }}</h5>
                                <p>{{ $item->mensaje }} </p>
                              </div>
                            </div>
                            <div class="col-xs-4 activity-desc1"></div>
                            <div class="clearfix"> </div>
                        </div>
                     @else
                        <div class="activity-row activity-row1">
                            <div class="col-xs-2 activity-desc1"></div>
                            <div class="col-xs-7 activity-img2">
                              <div class="activity-desc-sub1">
                                <h5>{{ $item->name }}</h5>
                                <p> {{ $item->mensaje }} </p>
                              </div>
                            </div>
                            <div class="col-xs-3 activity-img"><img src='{{ $item->url_imagen }}' class="img-responsive avatarxx1" alt=""/><span> {{      $fechax   }}  </span></div>
                            <div class="clearfix"> </div>
                        </div>
                     @endif
                 @endforeach
              @endif
            </div>
        </div>
            @if ($inicio==false)
               <div id="botones_msg"  class="hidden"  >
                    <input id='para' name='para' type="hidden" value="{{ $chat_with_id }}" >
                    <input id='msg'  name='msg' type="text" value="Escribe tu mensaje" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Escribe tu mensaje';}" required="">
                    <a id='enviar_msg' class="button button-block"  href="#"  >
                       <i class="fa fa-paper-plane-o fa-2x l_secundary" aria-hidden="true"></i>
                    </a>
              </div>
            @endif

      </div>
    </div>



  </div>
 </div>
</section>
@endsection
