<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	<link rel="icon" href="favicon.ico" type="image/x-icon" />
    <title>{{ config('app.name') }} :: Resetear contraseña</title>

    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
	<link rel="stylesheet" href="{{ asset('fonts/fuentes.css') }}"  />
    <link rel="stylesheet" href="{{ asset('vendor/bootstrap/css/bootstrap.min.css') }}">
    <link rel="stylesheet" href="{{ asset('vendor/font-awesome/css/font-awesome.min.css') }} ">
    <link rel="stylesheet" href="{{ asset('vendor/ionicons/css/ionicons.min.css') }} ">
	<link rel="stylesheet" href="{{ asset('vendor/iCheck/all.css') }} ">
    <!-- Theme style -->
    <link rel="stylesheet" href="{{ asset('theme/css/AdminLTE.css') }} " >
    <link rel="stylesheet" href="{{ asset('theme/css/skins/skin-zjft.css') }}">
	
   
</head>
<body class="hold-transition login-page">
<div class="login-5050">
</div>
<div class="login-box">
    

    <div class="login-box-body">
		<div class="text-center">
			<img class="img-responsive center-block" src="{{ asset('theme/img/logo.png') }} "  height="150px" width="150px" />
		</div>
        <p class="login-box-msg">Ingrese el email para reestablecer su cuenta</p>

        @if (session('status'))
            <div class="alert alert-success">
                {{ session('status') }}
            </div>
        @endif

        <form method="post" action="{{ url('/password/email') }}">
            {!! csrf_field() !!}

            <div class="form-group has-feedback {{ $errors->has('email') ? ' has-error' : '' }}">
                <input type="email" class="form-control" name="email" value="{{ old('email') }}" placeholder="Email">
                <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
                @if ($errors->has('email'))
                    <span class="help-block">
                    <strong>{{ $errors->first('email') }}</strong>
                </span>
                @endif
            </div>

            <div class="row">
                <div class="col-md-12">
                    <button type="submit" class="btn btn-primary btn-block btn-flat">
                        <i class="fa fa-btn fa-envelope"></i> Enviar email de reestablecimiento
                    </button>
                </div>
            </div>

        </form>

    </div>
</div>
<script src="{{ asset('vendor/jquery/jquery-2.2.4.min.js') }} "></script>
<script src="{{ asset('vendor/bootstrap/js/bootstrap.min.js') }} "></script>
<script src="{{ asset('theme/js/app.min.js') }}"></script>
</body>
</html>
