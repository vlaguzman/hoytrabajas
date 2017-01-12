<?php
	   use Carbon\Carbon;
     use App\Models\Usuario;
     use App\Models\Ciudad;
     use App\Models\Genero;
     use App\Models\Sector;
     use App\Models\SectorCandidato;

     Carbon::setLocale(config('app.locale'));

?>
<div class="fondo">
  <div class="register-box ">
    <div class="register-box-body ">
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
			   <img class="img-responsive center-block" src="{{ Usuario::find( $candidato->user_id )->first()->url_imagen   }} "  />
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
			<div class="fondo_gris">
			    <br />
				<div class="form-group">
				    <div class="input-group">
					     <span class="input-group-addon" ><span class="icon icon-user"></span></span>
						    {!! $candidato->nombres !!} {!! $candidato->apellidos !!}
				  	</div>
				</div>
				<div class="form-group ">
				    <div class="input-group">
					    <span class="input-group-addon" ><span class="icon icon-envelope"></span></span>
						  <p>{!! $candidato->correo !!}</p>
				  	</div>
				</div>
				<div class="form-group has-feedback {{ $errors->has('fnac') ? ' has-error' : '' }}">
				    <div class="input-group">
					    <span class="input-group-addon" ><span class="icon icon-present"></span></span>
					  	<p>{{  date('d-m-Y', strtotime($candidato->fnac ) )  }}</p>
					</div>
				</div>
				<div class="form-group "   >
				    <div class="input-group">
					    <span class="input-group-addon" > <span class="icon icon-symbol-female"></span>  </span>
              <p> {{ Genero::find( $candidato->genero_id )->first()->descripcion   }}   </p>
					</div>
				</div>
				<div class="form-group">
				    <div class="input-group">
					    <span class="input-group-addon" ><span class="icon icon-pie-chart"></span></span>
						  <p>{!! $candidato->experiencia !!} Años</p>
					</div>
				</div>
        <div class="form-group "   >
            <div class="input-group">
              <span class="input-group-addon" > <span class="icon icon-heart"></span>  </span>
              Sectores de interes
          </div>
             <ul>
             @foreach($intereses as $item)
                <li>{{ $item->descripcion }}</li>
             @endforeach
            </ul>
        </div>
        <div class="form-group "   >
            <div class="input-group">
              <span class="input-group-addon" > <span class="icon icon-badge"></span>  </span>
              Estudios
            </div>
            <ul>
              @foreach($estudios as $item)
                    <li>{{ $item->descripcion }}</li>
              @endforeach
           </ul>
        </div>
        <div class="form-group "   >
            <div class="input-group">
              <span class="input-group-addon" > <span class="icon icon-globe"></span>  </span>
              Idiomas
            </div>
            <ul>
            @foreach($idiomas as $item)
                  <li>{{ $item->descripcion }}</li>
            @endforeach
           </ul>
        </div>
        <div class="form-group ">
				    <div class="input-group">
					    <span class="input-group-addon" ><span class="icon icon-pencil"></span></span>
					   	  <p>{!! $candidato->descripcion !!}</p>
					</div>
				</div>
				<br />
		  </div>
			  <div class="row">
					<div class="col-xs-12">
							<button type="submit" class="btn btn-primary btn-block btn-system01">Aceptar</button>
					</div>
			 </div>

    </div>
  </div>
</div>
