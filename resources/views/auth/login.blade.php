<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	<link rel="icon" href="favicon.ico" type="image/x-icon" />
    <title>{{ config('app.name') }} ::  Iniciar Sesion</title>

    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
	<link rel="stylesheet" href="{{ asset('fonts/fuentes.css') }}"  />
    <link rel="stylesheet" href="{{ asset('vendor/bootstrap/css/bootstrap.min.css') }}">
    <link rel="stylesheet" href="{{ asset('vendor/font-awesome/css/font-awesome.min.css') }} ">
    <link rel="stylesheet" href="{{ asset('vendor/ionicons/css/ionicons.min.css') }} ">
	<link rel="stylesheet" href="{{ asset('vendor/simple-line-icons/css/simple-line-icons.css') }} ">
	<link rel="stylesheet" href="{{ asset('vendor/iCheck/all.css') }} ">
    <!-- Theme style -->
    <link rel="stylesheet" href="{{ asset('theme/css/AdminLTE.css') }} " >
    <link rel="stylesheet" href="{{ asset('theme/css/skins/skin-zjft.css') }}">


</head>
<body class=" ">
<div class="fondo">
  <div class="login-box fondo_hdn">
    <div class="login-box-body fondo_hdn">
	    <div class="text-center">
			<img class="img-responsive center-block" src="{{ asset('images/logo.png') }} "  height="150px" width="150px" />
		</div>
		<div class="text-center">
			<img class="img-responsive center-block" src="{{ asset('images/logotipo.png') }} "    />
		</div>
		<div class="text-center">
			<br /><br />
		</div>

        <form method="post" action="{{ url('/login') }}"  autocomplete="off" >
            {!! csrf_field() !!}
			<div class="fondo_gris">
			    <br />

				<div class="form-group has-feedback {{ $errors->has('email') ? ' has-error' : '' }}">
				    <div class="input-group">
					    <span class="input-group-addon" id="start-date"><span class="icon icon-user"></span></span>
						<input type="text" class="form-control" name="email" value="{{ old('email') }}" placeholder="Correo" autocomplete="off">
						@if ($errors->has('email'))
						<span class="help-block">
						  <strong>{{ $errors->first('email') }}</strong>
					    </span>
					  @endif
					</div>
				</div>
				<div class="form-group has-feedback {{ $errors->has('password') ? ' has-error' : '' }}">
				    <div class="input-group">
					    <span class="input-group-addon" id="start-date"><span class="icon icon-lock"></span></span>
						<input type="password" class="form-control" placeholder="Contraseña" name="password"  autocomplete="off" >
						@if ($errors->has('password'))
						<span class="help-block">
						  <strong>{{ $errors->first('password') }}</strong>
					    </span>
					  @endif
					</div>
				</div>
				<br />
			</div>
			<div class="row">
				<div class="col-xs-12">
						<button type="submit" class="btn btn-primary btn-block btn-system02">Ingresar</button>
			    </div>
			</div>
			<div class="row">
                <div class="col-xs-8">
                    <div class="checkbox icheck">
                        <label class='clr_blanco'>
                            <input type="checkbox" name="remember"> No cerrar sesión
                        </label>
                    </div>
                </div>
                <div class="col-xs-4">

                </div>
            </div>
        </form>
		<div class="text-center">
             <a href="{{ url('/password/reset') }}" class='tit_14p' > ¿ Olvidó contraseña ? </a><br/><br/>
		</div>
		<div class="row">
			<div class="col-xs-12">
			    <a href="{{ url('/registrarxtipo') }}" class="btn btn-primary btn-block  btn-system01">Registrarme</a>
			</div>
		</div>
		<div class="text-center">
			<span class="tit_sp1" >O usa tu red social favorita  </span><br/><br/>
		</div>
		<div class="row">
			<div class="col-xs-6">
                <a href="redirectfb" class="btn btn-block  btn-facebook">Facebook</a>
            </div>
			<div class="col-xs-6">
			    <a href="redirectgp" class="btn btn-block  btn-google">Google</a>
			</div>
		</div>



    </div>
  </div>
  <footer class="main-footer2 text-color-3" style="max-height: 100px;text-align: center">
    <strong>Hoy Trabajas © 2016. Todos los derechos reservados. Design By CRIZZ. al ingresar acepta nuestros terminos y condiciones </strong>
	<div class="pull-right text-color-3">
		 Version 1.0 - [2016.12.21]
	</div>
  </footer>
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
</script>
</body>
</html>
