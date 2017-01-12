<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	<link rel="icon" href="favicon.ico" type="image/x-icon" />
    <title>{{ config('app.name') }} ::  Registrarse en el sistema HOYTRABAJAS</title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
	<link rel="stylesheet" href="{{ asset('fonts/fuentes.css') }}"  />
    <link rel="stylesheet" href="{{ asset('vendor/bootstrap/css/bootstrap.min.css') }}">
    <link rel="stylesheet" href="{{ asset('vendor/font-awesome/css/font-awesome.min.css') }} ">
    <link rel="stylesheet" href="{{ asset('vendor/ionicons/css/ionicons.min.css') }} ">
	<link rel="stylesheet" href="{{ asset('vendor/simple-line-icons/css/simple-line-icons.css') }} ">
	<link rel="stylesheet" href="{{ asset('vendor/iCheck/all.css') }} ">
    <link rel="stylesheet" href="{{ asset('theme/css/AdminLTE.css') }} " >
    <link rel="stylesheet" href="{{ asset('theme/css/skins/skin-zjft.css') }}">

</head>
<body class="">
<div class="fondo">
  <div class="register-box fondo_hdn">
    <div class="register-box-body fondo_hdn">
      <form method="post" action="{{ url('/register') }}"  enctype="multipart/form-data"  >
         {!! csrf_field() !!}
      	  <div class="text-center">
      		   	<img class="img-responsive center-block" src="{{ asset('images/logonav.png') }} "  height="150px" width="150px" />
      		</div>
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
			      <img id='set_imagen' class="profile-picture-1 img-responsive center-block" src="{{ asset('images/avatar.png') }} "  />
        </div>
        <div class="col-md-4">
          <a  href="#"  class='btn_image f_primary'  >
              <img id='set_cperfil' class="img-responsive center-block" src="{{ asset('images/camerap.png') }} "  />
          </a>
          <input type="file" name="imagen_perfl_" id="upload_img_" accept="image/*" >
       </div>
		</div>
		<div class="row f_primary">
				<br />
        @if ($errors->has('imagen_perfl_'))
          <span class="help-block">
             <h5 class='tit_imagen_invalida' >{{ $errors->first('imagen_perfl_') }}</h5>
          </span>
        @endif
		</div>
			<div class="fondo_gris">
			    <br />
				<div class="form-group has-feedback {{ $errors->has('nombre') ? ' has-error' : '' }}">
				    <div class="input-group">
					    <span class="input-group-addon" ><span class="icon icon-user"></span></span>
						<input type="text" class="form-control" name="nombre" value="{{ old('nombre') }}" placeholder="Nombre" >
            <input type="hidden"  name="tipo" value='2'  >
						@if ($errors->has('nombre'))
							<span class="help-block">
							  <strong>{{ $errors->first('nombre') }}</strong>
							</span>
					    @endif
					</div>
				</div>
				<div class="form-group has-feedback {{ $errors->has('email') ? ' has-error' : '' }}">
				    <div class="input-group">
					    <span class="input-group-addon" ><span class="icon icon-envelope"></span></span>
						<input type="text" class="form-control" name="email" value="{{ old('email') }}" placeholder="Email" autocomplete="off">
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
				<div class="form-group has-feedback {{ $errors->has('password_confirmation') ? ' has-error' : '' }}">
				    <div class="input-group">
					    <span class="input-group-addon" ><span class="icon icon-lock"></span></span>
						<input type="password" class="form-control" placeholder="Repetir Contraseña" name="password_confirmation"  autocomplete="off" >
						@if ($errors->has('password_confirmation'))
						<span class="help-block">
						  <strong>{{ $errors->first('password_confirmation') }}</strong>
					    </span>
					  @endif
					</div>
				</div>
				<div class="form-group has-feedback {{ $errors->has('empresa') ? ' has-error' : '' }}">
				    <div class="input-group">
					    <span class="input-group-addon" ><span class="icon icon-briefcase"></span></span>
						<input type="text" class="form-control" name="empresa" value="{{ old('empresa') }}" placeholder="Nombre Empresa" >
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
            <input type="text" class="form-control" name="telefono" value="{{ old('telefono') }}" placeholder="Telefono" >
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
             {!! Form::select('ciudad',$ciudades, null, ['class' => 'form-control'  ] ) !!}
					</div>
				</div>
        <div class="form-group has-feedback {{ $errors->has('dir') ? ' has-error' : '' }}">
            <div class="input-group">
              <span class="input-group-addon" ><span class="icon icon-direction"></span></span>
            <input type="text" class="form-control" name="dir" value="{{ old('dir') }}" placeholder="Direccion" >
            @if ($errors->has('dir'))
              <span class="help-block">
                <strong>{{ $errors->first('dir') }}</strong>
              </span>
              @endif
          </div>
        </div>
        <div class="form-group has-feedback {{ $errors->has('reseña') ? ' has-error' : '' }}">
				    <div class="input-group">
					    <span class="input-group-addon" ><span class="icon icon-pencil"></span></span>
						<input type="text" class="form-control" name="reseña" value="{{ old('reseña') }}" placeholder="Reseña" >
						@if ($errors->has('reseña'))
							<span class="help-block">
							  <strong>{{ $errors->first('reseña') }}</strong>
							</span>
					    @endif
					</div>
				</div>
				<br />
		  </div>
			  <div class="row">
					<div class="col-xs-12">
							<button type="submit" class="btn btn-primary btn-block btn-system01">Registrarme</button>
					</div>
			 </div>
    </form>
		<div class="row">
			<div class="col-xs-12">
			    <a href="{{ url('/login') }}" class="btn btn-primary btn-block  btn-system02">Ingresar</a>
			</div>
	  	</div>
    </div>
  </div>
</div>

<script src="{{ asset('vendor/jquery/jquery-2.2.4.min.js') }} "></script>
<script src="{{ asset('vendor/bootstrap/js/bootstrap.min.js') }} "></script>
<script src="{{ asset('vendor/iCheck/icheck.min.js') }}"></script>
<!-- AdminLTE App -->
<script src="{{ asset('theme/js/app.min.js') }}"></script>

<script>
    $(function () {
        $('input').iCheck({
            /*checkboxClass: 'icheckbox_square-blue',
            radioClass: 'iradio_square-blue',
            increaseArea: '20%' */
			checkboxClass: 'icheckbox_flat-blue',
            radioClass: 'iradio_flat-blue',
			increaseArea: '20%'
        });
    });

    $('#set_cperfil').on("click", function() {
        console.debug('Buscando imagen crear perfil...');
        $("#upload_img_").trigger('click');
    });
    $("#upload_img_").change(function(event) {
        console.debug('Cambiando imagen...');
        $.each(event.target.files, function(index, file) {
            console.debug('Seleccionado index imagen...');
             var reader = new FileReader();
             reader.onload = function(event) {
                object = {};
                object.filename = file.name;
                object.data = event.target.result;
                $("#set_imagen").attr("src",  object.data );
            };
            reader.readAsDataURL(file);
        });
    });
</script>
</body>
</html>
