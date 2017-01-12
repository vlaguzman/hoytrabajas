<?php
	   use Carbon\Carbon;
     use App\Models\Candidato;
     use App\Models\Usuario;
     use App\Models\Ciudad;
     Carbon::setLocale(config('app.locale'));

?>
@extends('layouts.app')
@section('content')
<div class="fondo">
  <div class="register-box fondo_hdn">
    <div class="register-box-body fondo_hdn">

		<div class="text-center">
			<br />
		</div>
		<div class="row f_primary">
				<br />
		</div>
	    <div class="row f_primary">
		    <div class="col-md-4 ">

            </div>
            <div class="col-md-4">
								<img id='img_perfil' class="profile-picture-1  img-responsive center-block" src="{{ Auth::user()->url_imagen }} "  />
            </div>
			<div class="col-md-4">
			     <button class='btn_image f_primary'  >
						  <img id='set_iperfil' class="img-responsive center-block" src="{{ asset('images/camerap.png') }} "  />
						  <input   type="hidden" name="id_usuario" id='id_usuario' value="{{  Auth::user()->id  }}">
						  <input type="file" name="upload_img_perfil" id="upload_img_perfil" accept="image/*" >
				   </button>
      </div>
		</div>
		<div class="row f_primary">
				<br />
		</div>


    <form method="post" action="{{ url('/guardarperfil') }}">
		   {!! csrf_field() !!}
			<div class="fondo_gris">
			    <br />
          <input type="hidden"  name="tipo" value='1'  >
          <div class="form-group has-feedback {{ $errors->has('nombres') ? ' has-error' : '' }}">
  				    <div class="input-group">
  					    <span class="input-group-addon" ><span class="icon icon-user"></span></span>
    						<input type="text" class="form-control" name="nombres" value="{{ $datos->nombres }}" placeholder="Nombre" >
    						@if ($errors->has('nombres'))
    						  	<span class="help-block">
    							     <strong>{{ $errors->first('nombres') }}</strong>
    							  </span>
    					  @endif
  					 </div>
  				</div>
					<div class="form-group has-feedback {{ $errors->has('apellidos') ? ' has-error' : '' }}">
  				    <div class="input-group">
  					    <span class="input-group-addon" ><span class="icon icon-user"></span></span>
    						<input type="text" class="form-control" name="apellidos" value="{{ $datos->apellidos }}" placeholder="Nombre" >
    						@if ($errors->has('apellidos'))
    						  	<span class="help-block">
    							     <strong>{{ $errors->first('apellidos') }}</strong>
    							  </span>
    					  @endif
  					 </div>
  				</div>
				<div class="form-group has-feedback {{ $errors->has('email') ? ' has-error' : '' }}">
				    <div class="input-group">
					    <span class="input-group-addon" ><span class="icon icon-envelope"></span></span>
						<input type="text" class="form-control" name="email" value="{{  $datos->correo }}" placeholder="Email" autocomplete="off">
						@if ($errors->has('email'))
						<span class="help-block">
						  <strong>{{ $errors->first('email') }}</strong>
					    </span>
					  @endif
					</div>
				</div>
        <div class="form-group has-feedback {{ $errors->has('telefono') ? ' has-error' : '' }}">
            <div class="input-group">
              <span class="input-group-addon" ><span class="icon icon-phone"></span></span>
            <input type="text" class="form-control" name="telefono" value="{{ $datos->telefono }}" placeholder="Telefono" >
            @if ($errors->has('telefono'))
              <span class="help-block">
                <strong>{{ $errors->first('telefono') }}</strong>
              </span>
              @endif
          </div>
        </div>
				<br />
		  </div>
			  <div class="row">
					<div class="col-xs-12">
							<button type="submit" class="btn btn-primary btn-block btn-system01">Guardar</button>
					</div>
			 </div>
    </form>

    </div>
  </div>
</div>
@endsection
