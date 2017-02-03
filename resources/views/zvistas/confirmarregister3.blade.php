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
              <img class="img-responsive center-block" src="{{ $datos->url_imagen  }} "  />
           </div>
			    <div class="col-md-4">

          </div>
		   </div>
  		 <div class="row f_primary">
  				<br />
  		 </div>


    <form method="post" action="{{ url('/guardarconfirmarregistro') }}">
		   {!! csrf_field() !!}
			<div class="fondo_gris">
			  <br />
        <input type="hidden"  name="tipo" value='3'  >
				<div class="form-group has-feedback {{ $errors->has('nombres') ? ' has-error' : '' }}">
				    <div class="input-group">
					    <span class="input-group-addon" ><span class="icon icon-user"></span></span>
  						<input type="text" class="form-control" name="nombres" value="{{ $datos->name }}" placeholder="Nombres" >
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
  						<input type="text" class="form-control" name="apellidos" value="{{ old('apellidos') }}" placeholder="Apellidos" >
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
					  	<input type="text" class="form-control" name="email" value="{{ $datos->email }}" placeholder="Email" autocomplete="off">
  						@if ($errors->has('email'))
  						  <span class="help-block">
  						      <strong>{{ $errors->first('email') }}</strong>
  					    </span>
  					  @endif
					  </div>
				</div>
				<div class="form-group has-feedback {{ $errors->has('password') ? ' has-error' : '' }}">
						<div class="input-group">
							<span class="input-group-addon" ><span class="icon icon-lock"></span></span>
							<input type="password" class="form-control" placeholder="Contraseña" name="password"  autocomplete="off" >
								@if ($errors->has('password'))
								 <span class="help-block">
										 <strong>{{ $errors->first('password') }}</strong>
									</span>
								@endif
						</div>
				</div>
				<div class="form-group has-feedback {{ $errors->has('nacio') ? ' has-error' : '' }}">
				   <div class="input-group">
					   <span class="input-group-addon" ><span class="icon icon-present"></span></span>
					   <input type="text" class="form-control datepicker" name="nacio" value="{{ old('nacio') }}" placeholder="Ingrese"  >
					   @if ($errors->has('nacio'))
						<span class="help-block">
						  <strong>{{ $errors->first('nacio') }}</strong>
						</span>
					   @endif
				   </div>
				</div>
				<div class="form-group "   >
				    <div class="input-group">
					      <span class="input-group-addon" > <span class="icon icon-symbol-female"></span>  </span>
                {!! Form::select('genero',$generos, null, ['class' => 'form-control'  ] ) !!}
					  </div>
				</div>
				<div class="form-group has-feedback {{ $errors->has('experiencia') ? ' has-error' : '' }}">
				    <div class="input-group">
					    <span class="input-group-addon" >  <span class="icon icon-pie-chart"></span> </span>
						  <input type="number" class="form-control" name="experiencia" id='experiencia' value="{{ old('experiencia') }}" placeholder="Años de experiencia" min="1" max="75" >


						@if ($errors->has('experiencia'))
							<span class="help-block">
							  <strong>{{ $errors->first('experiencia') }}</strong>
							</span>
					    @endif
					</div>
				</div>
				<div class="form-group has-feedback {{ $errors->has('estudios') ? ' has-error' : '' }}"   >
            <div class="input-group">
                <span class="input-group-addon" > <span class="icon icon-badge"></span>  </span>
                <input type="text" class="form-control" name="estudios" value="{{ old('estudios') }}" placeholder="Estudios" >
               @if ($errors->has('estudios'))
  							  <span class="help-block">
  							     <strong>{{ $errors->first('estudios') }}</strong>
  							  </span>
  					    @endif
            </div>
        </div>
				<div class="form-group "   >
						<div class="input-group">
							<span class="input-group-addon" > <span class="icon icon-heart"></span>  </span>
							 Sector de interes
							 <span class="help-block">
										{!! Form::select('lssectores[]',$sectores, null, ['class' => 'selectpicker','multiple' => true,'data-max-options' => '5','title'=>'--Selecciona--','data-selected-text-format'=>'count'    ] ) !!}
							 </span>
						</div>

				</div>
				<div class="form-group "   >
						<div class="input-group">
							<span class="input-group-addon" > <span class="icon icon-globe"></span>  </span>
							Idiomas
							<span class="help-block">
								 {!! Form::select('lsidiomas[]',$idiomas, null, ['class' => 'selectpicker','multiple' => true,'data-max-options' => '5','title'=>'--Selecciona--','data-selected-text-format'=>'count'    ] ) !!}
							</span>
						</div>
				</div>

				<div class="form-group has-feedback {{ $errors->has('reseña') ? ' has-error' : '' }}">
    		 	 <div class="input-group">
    					    <span class="input-group-addon" ><span class="icon icon-pencil"></span></span>
    						  <textarea  rows="3" cols="40" class="form-control" name="reseña" id='resena' value="{{ old('reseña') }}" placeholder="Reseña" maxlength="300">{{ old('reseña') }}</textarea>
    						  @if ($errors->has('reseña'))
      							<span class="help-block">
      							  <strong>{{ $errors->first('reseña') }}</strong>
      							</span>
    					    @endif
    			 </div>
           <div class="text-center">
             <span id='cont_resena' >0/300 caracteres </span>
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
