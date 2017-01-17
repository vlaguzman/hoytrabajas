<?php
	   use Carbon\Carbon;
     use App\Models\Usuario;
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
								<img id='img_perfil' class="profile-picture-1  img-responsive center-block" src="{{   Usuario::where([ ['id', '=',$administrador->user_id] ] )->first()->url_imagen   }} "  />
            </div>
			<div class="col-md-4">

      </div>
		</div>
		<div class="row f_primary">
				<br />
		</div>
  <div class="row">
	 <div class="fondo_gris">
			    <br />
        <div class="form-group">
  				    <div class="input-group">
  					    <span class="input-group-addon" ><span class="icon icon-user"></span></span>
    						<p>{!! $administrador->nombres !!}</p>
  					 </div>
  			</div>
				<div class="form-group">
  				    <div class="input-group">
  					    <span class="input-group-addon" ><span class="icon icon-user"></span></span>
    						<p>{!! $administrador->apellidos !!}</p>
  					 </div>
  			</div>
				<div class="form-group">
				    <div class="input-group">
					    <span class="input-group-addon" ><span class="icon icon-envelope"></span></span>
						  <p>{!! $administrador->correo !!}</p>
					</div>
				</div>
        <div class="form-group has-feedback {{ $errors->has('telefono') ? ' has-error' : '' }}">
            <div class="input-group">
              <span class="input-group-addon" ><span class="icon icon-phone"></span></span>
              <p>{!! $administrador->telefono !!}</p>
          </div>
        </div>
				<br />
		  </div>
    </div>
</div>

  </div>
</div>
