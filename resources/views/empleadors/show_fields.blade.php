
<?php
	   use Carbon\Carbon;
     use App\Models\Usuario;
     use App\Models\Ciudad;

     Carbon::setLocale(config('app.locale'));

?>
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
			          <img id='img_perfil' class="profile-picture-1  img-responsive center-block" src="{{ Usuario::where([ ['id', '=',$empleador->user_id] ] )->first()->url_imagen }} "  />
            </div>
			<div class="col-md-4">

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
          <div class="form-group ">
  				    <div class="input-group">
  					    <span class="input-group-addon" ><span class="icon icon-user"></span></span>
    						<p>{!! $empleador->contacto !!}</p>
  					 </div>
  				</div>
          <div class="form-group">
              <div class="input-group">
                <span class="input-group-addon" ><span class="icon icon-briefcase"></span></span>
                <p>{!! $empleador->empresa !!}</p>
            </div>
          </div>
				<div class="form-group ">
				    <div class="input-group">
					    <span class="input-group-addon" ><span class="icon icon-envelope"></span></span>
						 <p>{!! $empleador->correo !!}</p>
					</div>
				</div>

        <div class="form-group ">
            <div class="input-group">
              <span class="input-group-addon" ><span class="icon icon-phone"></span></span>
             <p>{!! $empleador->telefono !!}</p>
          </div>
        </div>
				<div class="form-group "   >
				    <div class="input-group">
					    <span class="input-group-addon" > <span class="icon icon-location-pin"></span>  </span>
               <p>    {!! Ciudad::where([ ['id', '=',$empleador->ciudad_id] ] )->first()->descripcion  !!}     </p>
					</div>
				</div>
        <div class="form-group ">
            <div class="input-group">
              <span class="input-group-addon" ><span class="icon icon-direction"></span></span>
              <p>{!! $empleador->direccion !!}</p>
          </div>
        </div>
        <div class="form-group ">
				    <div class="input-group">
					    <span class="input-group-addon" ><span class="icon icon-pencil"></span></span>
						  <p>{!! $empleador->descripcion !!}</p>

					</div>

				</div>
				<br />
		  </div>
    </form>
</div>
    </div>
  </div>
</div>
