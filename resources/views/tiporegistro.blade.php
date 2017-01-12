<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	<link rel="icon" href="favicon.ico" type="image/x-icon" />
    <title>{{ config('app.name') }} ::  Seleccionar Tipo De Usuario</title>

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
<body class=" ">
<div class="fondo">
  <div class="login-box fondo_hdn">
    <div class="login-box-body fondo_hdn">
	    <div class="text-center">
			<img class="img-responsive center-block" src="{{ asset('images/logonav.png') }} "  height="150px" width="150px" />
		</div>
		<div class="text-center">
			<br />
		</div>
            {!! csrf_field() !!}
			<div class="img-fondor1 fondo_gris">
			    <div class="row">
					<div class="col-md-12">
					    <div class="text-center">
					      <h3 class='tit_sp3' >Soy Empleado </h3>
						</div>  
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
					    <div class="text-center">
					      <h4 class='tit_sp' >Busco conseguir trabajo </h4>
						</div>  
					</div>
				</div>
				<div class="row">
				    <div class="col-xs-1 "></div>
					<div class="col-md-10">
					    <div class="text-center">
					      <img class='img-responsive center-block' src="{{ asset('images/it1.png') }} "   >
						</div>  
					</div>
					<div class="col-xs-1 "></div>
				</div>
				<div class="row">
				    <div class="col-xs-1 "></div>
					<div class="col-xs-10 ">
					    <div class="text-center">
						   <a href="{{ url('/register') }}" style="margin-bottom: 0px!important;" class="btn btn-primary btn-block btn-system01">Buscar Trabajo</a>
					    </div> 
					</div>
					<div class="col-xs-1 "></div>
			    </div>
				<div class="row">
				  <div class="col-xs-12">
					  <br/>
			      </div>
			    </div>
			</div>
			<div class="img-fondor2 fondo_gris">
			    <div class="row">
					<div class="col-md-12">
					    <div class="text-center">
					      <h3 class='tit_sp3' >Soy Empleador </h3>
						</div>  
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
					    <div class="text-center">
					      <h4 class='tit_sp' >Busco conseguir trabajadores</h4>
						</div>  
					</div>
				</div>
				<div class="row">
				    <div class="col-xs-1 "></div>
					<div class="col-md-10">
					    <div class="text-center">
					      <img class='img-responsive center-block' src="{{ asset('images/it2.png') }} "   >
						</div>  
					</div>
					<div class="col-xs-1 "></div>
				</div>
				<div class="row">
				  <div class="col-xs-1 "></div>
				 <div class="col-xs-10">
					<a href="{{ url('/registrar2') }}" class="btn btn-primary btn-block btn-system01">Buscar Empleados</a>
			      </div>
				  <div class="col-xs-1 "></div>
			    </div>
				<div class="row">
				  <div class="col-xs-12">
					  <br/>
			      </div>
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
