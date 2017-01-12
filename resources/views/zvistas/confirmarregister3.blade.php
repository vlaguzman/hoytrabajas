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
              <img class="img-responsive center-block" src="{{ $datos->url_imagen  }} "  />
           </div>
			    <div class="col-md-4">
			        <button class='btn_image f_primary'  >
				          <img class="img-responsive center-block" src="{{ asset('images/camerap.png') }} "  />
			   	    </button>
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
				<div class="form-group has-feedback {{ $errors->has('fnac') ? ' has-error' : '' }}">
				    <div class="input-group">
					    <span class="input-group-addon" ><span class="icon icon-present"></span></span>
						  <input type="date" class="form-control" name="fnac" value="{{ old('fnac')  }}"  >
  						@if ($errors->has('fnac'))
    							<span class="help-block">
    							    <strong>{{ $errors->first('fnac') }}</strong>
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
				<div class="form-group has-feedback {{ $errors->has('exp') ? ' has-error' : '' }}">
				    <div class="input-group">
					    <span class="input-group-addon" ><span class="icon icon-pie-chart"></span></span>
					  	<input type="number" class="form-control" name="exp" value="{{ old('exp') }}" placeholder="Experiencia" >
							 @if ($errors->has('exp'))
								  <span class="help-block">
								     <strong>{{ $errors->first('exp') }}</strong>
								  </span>
						    @endif
					 </div>
				</div>

        <div class="form-group "   >
            <div class="input-group">
               <span class="input-group-addon" > <span class="icon icon-heart"></span>  </span>
               Sectores de interes
            </div>
            {!! Form::select('lssectores[]',$sectores, null, ['class' => 'form-control','multiple' => true   ] ) !!}

        </div>
        <div class="form-group "   >
            <div class="input-group">
              <span class="input-group-addon" > <span class="icon icon-badge"></span>  </span>
              Estudios
            </div>
              {!! Form::select('lsestudios[]',$estudios, null, ['class' => 'form-control','multiple' => true   ] ) !!}
        </div>
        <div class="form-group "   >
            <div class="input-group">
              <span class="input-group-addon" > <span class="icon icon-globe"></span>  </span>
              Idiomas
            </div>
               {!! Form::select('lsidiomas[]',$idiomas, null, ['class' => 'form-control','multiple' => true   ] ) !!}
        </div>
        <div class="form-group has-feedback {{ $errors->has('descripcion') ? ' has-error' : '' }}">
				    <div class="input-group">
					    <span class="input-group-addon" ><span class="icon icon-pencil"></span></span>
						<input type="text" class="form-control" name="descripcion" value="{{ old('descripcion') }}" placeholder="Reseña" >
						@if ($errors->has('descripcion'))
							<span class="help-block">
							  <strong>{{ $errors->first('descripcion') }}</strong>
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
