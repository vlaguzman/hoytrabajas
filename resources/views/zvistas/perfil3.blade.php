<?php
	   use Carbon\Carbon;
     use App\Models\Candidato;
     use App\Models\Usuario;
     use App\Models\Ciudad;
     Carbon::setLocale(config('app.locale'));
		 $carbon = new Carbon($datos->fnac, 'America/Bogota');
		 $dt = Carbon::now();
		 $fnacx=$carbon->format('d/m/Y');
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
        <input type="hidden"  name="tipo" value='3'  >
				<div class="form-group has-feedback {{ $errors->has('nombres') ? ' has-error' : '' }}">
				    <div class="input-group">
					    <span class="input-group-addon" ><span class="icon icon-user"></span></span>
  						<input type="text" class="form-control" name="nombres" value="{{ $datos->nombres }}" placeholder="Nombres" >
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
  						<input type="text" class="form-control" name="apellidos" value="{{ $datos->apellidos }}" placeholder="Apellidos" >
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
					  	<input type="text" class="form-control" name="email" value="{{ $datos->correo }}" placeholder="Email" autocomplete="off">
  						@if ($errors->has('email'))
  						  <span class="help-block">
  						      <strong>{{ $errors->first('email') }}</strong>
  					    </span>
  					  @endif
					  </div>
				</div>
				<div class="form-group has-feedback {{ $errors->has('nacio') ? ' has-error' : '' }}">
				    <div class="input-group">
					    <span class="input-group-addon" ><span class="icon icon-present"></span></span>
							<input type="text" class="form-control datepicker" name="nacio" value="{{ $fnacx  }}" placeholder="Ingrese"  >
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
								<span class="help-block">
                   {!! Form::select('genero',$generos, $datos->genero_id, ['class' => 'selectpicker'  ] ) !!}
								</span>
					  </div>
				</div>
				<div class="form-group has-feedback {{ $errors->has('experiencia') ? ' has-error' : '' }}">
				    <div class="input-group">
					    <span class="input-group-addon" ><span class="icon icon-pie-chart"></span></span>
					  	<input type="number" class="form-control" name="experiencia" id='experiencia2' value="{{ $datos->experiencia }}" placeholder="Años de experiencia" min="1" max="75" >
							<span class="input-group-addon" >  <span  >Años</span> </span>
							 @if ($errors->has('experiencia'))
								  <span class="help-block">
								     <strong>{{ $errors->first('experiencia') }}</strong>
								  </span>
						    @endif
					 </div>
				</div>
				<div class="form-group "   >
            <div class="input-group">
              <span class="input-group-addon" > <span class="icon icon-badge"></span>  </span>
              Estudios
            </div>
            <ul>
              @foreach($lsestudios as $item)
                    <li>{{ $item->descripcion }}</li>
              @endforeach
           </ul>
					<div class="form-group has-feedback {{ $errors->has('estudios') ? ' has-error' : '' }}"   >
	 	             <div class="input-group">
	 	                 <span class="input-group-addon" >  </span>
	 	                 <input type="text" class="form-control" name="estudios" value="{{ old('estudios') }}" placeholder="Ingresar otro estudio" >
	 	                @if ($errors->has('estudios'))
	 	   							  <span class="help-block">
	 	   							     <strong>{{ $errors->first('estudios') }}</strong>
	 	   							  </span>
	 	   					    @endif
	 	             </div>
	 	        </div>
        </div>
        <div class="form-group "   >
            <div class="input-group">
               <span class="input-group-addon" > <span class="icon icon-heart"></span>  </span>
               Sectores de interes
            </div>
            <ul>
            @foreach($lsintereses as $item)
               <li>{{ $item->descripcion }}</li>
            @endforeach
           </ul>
        </div>
				<div class="form-group "   >
            <div class="input-group">

								 {!! Form::select('lssectores[]',$sectores, null, ['class' => 'selectpicker','multiple' => true,'data-max-options' => '5','title'=>'--Selecciona sector --','data-selected-text-format'=>'count'    ] ) !!}
            </div>
        </div>
        <div class="form-group "   >
            <div class="input-group">
              <span class="input-group-addon" > <span class="icon icon-globe"></span>  </span>
              Idiomas
            </div>
            <ul>
            @foreach($lsidiomas as $item)
                  <li>{{ $item->descripcion }}</li>
            @endforeach
           </ul>

        </div>
				<div class="form-group "   >
            <div class="input-group">

									{!! Form::select('lsidiomas[]',$idiomas, null, ['class' => 'selectpicker','multiple' => true,'data-max-options' => '5','title'=>'--Selecciona idioma--','data-selected-text-format'=>'count'   ] ) !!}

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
							<button type="submit" class="btn btn-primary btn-block btn-system01">Actualizar</button>
					</div>
			 </div>
    </form>
		</div>
  </div>
</div>
</div>
@endsection
