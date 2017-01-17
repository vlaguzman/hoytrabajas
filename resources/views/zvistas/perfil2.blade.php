<?php
	   use Carbon\Carbon;
     use App\Models\Candidato;
     use App\Models\Usuario;
     use App\Models\Ciudad;
     Carbon::setLocale(config('app.locale'));

?>
@extends('layouts.app')
@section('content')
<div class="">
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

  <div class="row ">

    <form method="post" action="{{ url('/guardarperfil') }}">
		   {!! csrf_field() !!}
			<div class="fondo_gris">
			    <br />
          <input type="hidden"  name="tipo" value='2'  >
          <div class="form-group has-feedback {{ $errors->has('nombre') ? ' has-error' : '' }}">
  				    <div class="input-group">
  					    <span class="input-group-addon" ><span class="icon icon-user"></span></span>
    						<input type="text" class="form-control" name="nombre" value="{{ $datos->contacto }}" placeholder="Nombre" >
    						@if ($errors->has('nombre'))
    						  	<span class="help-block">
    							     <strong>{{ $errors->first('Nombre') }}</strong>
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


				<div class="form-group has-feedback {{ $errors->has('empresa') ? ' has-error' : '' }}">
				    <div class="input-group">
					    <span class="input-group-addon" ><span class="icon icon-briefcase"></span></span>
						<input type="text" class="form-control" name="empresa" value="{{ $datos->empresa }}" placeholder="Nombre Empresa" >
						@if ($errors->has('empresa'))
							<span class="help-block">
							  <strong>{{ $errors->first('empresa') }}</strong>
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
				<div class="form-group "   >
				    <div class="input-group">
					    <span class="input-group-addon" > <span class="icon icon-location-pin"></span>  </span>
             {!! Form::select('ciudad',$ciudades, $datos->ciudad_id, ['class' => 'form-control'  ] ) !!}
					</div>
				</div>
        <div class="form-group has-feedback {{ $errors->has('direccion') ? ' has-error' : '' }}">
            <div class="input-group">
              <span class="input-group-addon" ><span class="icon icon-direction"></span></span>
            <input type="text" class="form-control" name="direccion" value="{{ $datos->direccion }}" placeholder="Direccion" >
            @if ($errors->has('direccion'))
              <span class="help-block">
                <strong>{{ $errors->first('direccion') }}</strong>
              </span>
              @endif
          </div>
        </div>
        <div class="form-group has-feedback {{ $errors->has('reseña') ? ' has-error' : '' }}">
				    <div class="input-group">
					    <span class="input-group-addon" ><span class="icon icon-pencil"></span></span>

						<textarea  rows="3" cols="40" class="form-control" name="reseña" id='resena2' placeholder="Reseña" maxlength="300">{{ $datos->descripcion }}</textarea>
						@if ($errors->has('reseña'))
							<span class="help-block">
							  <strong>{{ $errors->first('reseña') }}</strong>
							</span>
					    @endif
					</div>

					<div class="text-center">
						<span id='cont_resena2' >0/300 caracteres </span>
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
</div>
@endsection
