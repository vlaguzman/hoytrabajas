<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>{{ config('app.name') }} ::   </title>
	  <link rel="icon" href="favicon.ico" type="image/x-icon" />
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
	  <meta name="csrf-token" content="{{ csrf_token() }}">
	  <link rel="stylesheet" href="{{ asset('fonts/fuentes.css') }}"  />
    <!--
       <link rel="stylesheet" href="{{ asset('vendor/bootstrap/css/bootstrap.min.css') }}">
        <link rel="stylesheet" href="{{ asset('theme/css/AdminLTE.css') }} " >
        <link rel="stylesheet" href="{{ asset('theme/css/skins/skin-zjft.css') }}">
     -->
    <link rel="stylesheet" href="{{ asset('theme2/global/css/bootstrap.min.css') }} " >
    <link rel="stylesheet" href="{{ asset('theme2/global/css/bootstrap-extend.min.css') }} " >
    <link rel="stylesheet" href="{{ asset('theme2/assets/css/site.css') }} " >
    <link rel="stylesheet" href="{{ asset('theme2/global/vendor/animsition/animsition.css') }} " >
    <link rel="stylesheet" href="{{ asset('theme2/global/vendor/asscrollable/asScrollable.css') }} " >
    <link rel="stylesheet" href="{{ asset('theme2/global/vendor/switchery/switchery.css') }} " >
    <link rel="stylesheet" href="{{ asset('theme2/global/vendor/intro-js/introjs.css') }} " >
    <link rel="stylesheet" href="{{ asset('theme2/global/vendor/slidepanel/slidePanel.css') }} " >
    <link rel="stylesheet" href="{{ asset('theme2/global/vendor/flag-icon-css/flag-icon.css') }} " >
    <link rel="stylesheet" href="{{ asset('theme2/global/vendor/waves/waves.css') }} " >
    <link rel="stylesheet" href="{{ asset('theme2/global/vendor/chartist/chartist.css') }} " >
    <link rel="stylesheet" href="{{ asset('theme2/global/vendor/jvectormap/jquery-jvectormap.css') }} " >
    <link rel="stylesheet" href="{{ asset('theme2/global/vendor/chartist-plugin-tooltip/chartist-plugin-tooltip.css') }} " >
    <link rel="stylesheet" href="{{ asset('theme2/assets/examples/css/dashboard/v1.css') }} " >
    <link rel="stylesheet" href="{{ asset('theme2/global/vendor/chartist/chartist.css') }} " >

    <link rel="stylesheet" href="{{ asset('vendor/font-awesome/css/font-awesome.min.css') }} ">
    <link rel="stylesheet" href="{{ asset('vendor/ionicons/css/ionicons.min.css') }} ">
	  <link rel="stylesheet" href="{{ asset('vendor/linearicons/icon-font.min.css') }} ">
	  <link rel="stylesheet" href="{{ asset('vendor/simple-line-icons/css/simple-line-icons.css') }} ">
	  <link rel="stylesheet" href="{{ asset('vendor/iCheck/all.css') }} ">
	  <link rel="stylesheet" href="{{ asset('vendor/select2/dist/css/select2.min.css') }} ">
    <link rel="stylesheet" href="{{ asset('vendor/bootstrap-select/css/bootstrap-select.css') }}">
	  <link rel="stylesheet" href="{{ asset('vendor/jquery-ui/jquery-ui.css') }}">
	  <link rel="stylesheet" href="{{ asset('vendor/jquery.steps/css/jquery.steps.css') }}">
	  <link rel="stylesheet" href="{{ asset('vendor/fullcalendar/dist/fullcalendar.min.css') }} "/>
    <link rel="stylesheet" href="{{ asset('vendor/fullcalendar/dist/fullcalendar.print.css') }} " media="print" />
    <link rel="stylesheet" href="{{ asset('vendor/bootstrap-datepicker/css/bootstrap-datepicker.css') }}">
	  <link rel="stylesheet" href="{{asset('vendor/toastr/build/toastr.css') }}">
   	<link rel="stylesheet" href="{{asset('vendor/star-rating/star-rating-svg.css') }}">
    <link rel="stylesheet" href="{{asset('vendor/cropperjs/cropper.css') }}">



     <script type="text/javascript">
        var APP_URL = {!! json_encode(url('/')) !!}
     </script>

    @yield('css')
</head>

<body class="hold-transition skin-blue fixed sidebar-mini"    >
@if (!Auth::guest())
    <div class="wrapper">
        <!-- Main Header -->
        <header class="main-header">
            <!--
            <a href="#" class="logo">
				 <div class="hidden-sm hidden-md"><b >{{ config('app.name') }}</b> </div>
            </a> -->
		      <a class="logo" href="{!! url('/logout') !!}" onclick="event.preventDefault(); if (confirm('Confirma que desea salir?') ) { document.getElementById('logout-form').submit(); } " >
			      <i class="icon icon-power " aria-hidden="true"></i>
			    </a>
		    	<form id="logout-form" action="{{ url('/logout') }}" method="POST" style="display: none;">
                {{ csrf_field() }}
          </form>
            <!-- Header Navbar -->
            <nav class="navbar navbar-static-top" role="navigation">
                <!-- Sidebar toggle button-->
                <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
                    <span class="sr-only">Toggle navigation</span>
                </a>
                <!-- Navbar Right Menu -->
              <div class="navbar-custom-menu">
                  <ul class="nav navbar-nav">
        					    @include('layouts.notificaciones')
        						  <div class="pull-right image">
        						     <img src="{{ asset('images/logonav.png') }}" class="img-responsive"  height='140px' width='200px' alt=""/>
        					  	</div>
        					</ul>
              </div>
            </nav>
        </header>

        <!-- Left side column. contains the logo and sidebar -->
        @include('layouts.sidebar')
        <!-- Content Wrapper. Contains page content -->
        <div class="content-wrapper">
             <br/>
            @yield('content')
        </div>

        <!-- Main Footer -->
        <footer class="main-footer text-color-3" style="max-height: 100px;text-align: center">
            <strong>Hoy Trabajas  © 2016. Todos los derechos reservados. Design By CRIZZ. </strong>
			 <div class="pull-right">
			     <strong> Version 1.1 - [2017.02.03]</strong>
			 </div>
        </footer>

    </div>
@else
    <nav class="navbar navbar-default navbar-static-top">
        <div class="container">
            <div class="navbar-header">

                <!-- Collapsed Hamburger -->
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                        data-target="#app-navbar-collapse">
                    <span class="sr-only">Toggle Navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>

                <!-- Branding Image -->
                <a class="navbar-brand" href="{!! url('/') !!}">
                   {{ config('app.name') }}
                </a>
            </div>

            <div class="collapse navbar-collapse" id="app-navbar-collapse">
                <!-- Left Side Of Navbar -->
                <ul class="nav navbar-nav">
                    <li><a href="{!! url('/home') !!}">Inicio</a></li>
                </ul>

                <!-- Right Side Of Navbar -->
                <ul class="nav navbar-nav navbar-right">
                    <!-- Authentication Links -->
                    <li><a href="{!! url('/login') !!}">Login</a></li>
                    <li><a href="{!! url('/register') !!}">Register</a></li>
                </ul>
            </div>
        </div>
    </nav>
    @endif

    <script src="{{ asset('vendor/jquery/jquery-2.2.4.min.js') }} "></script>
    <script src="{{ asset('vendor/bootstrap/js/bootstrap.min.js') }} "></script>
    <script src="{{ asset('vendor/iCheck/icheck.min.js') }}"></script>
	  <script src="{{ asset('vendor/select2/dist/js/select2.min.js') }}"></script>
	  <script src="{{ asset('vendor/moment/min/moment.min.js') }} "></script>
	  <script src="{{ asset('vendor/jquery-ui/jquery-ui.min.js') }}"></script>
    <script src="{{ asset('vendor/fullcalendar/dist/fullcalendar.min.js') }}"></script>
	  <script src="{{ asset('vendor/fullcalendar/dist/locale/es.js') }}"></script>
	  <script src="{{ asset('vendor/jquery.steps/jquery.steps.js') }} "></script>
	  <script src="{{ asset('vendor/toastr/build/toastr.min.js') }}"  ></script>
    <script src="{{ asset('vendor/star-rating/jquery.star-rating-svg.js') }}"  ></script>
    <script src="{{ asset('vendor/slimScroll/jquery.slimscroll.min.js') }}"  ></script>
    <script src="{{ asset('vendor/jquery.countdown/jquery.countdown.min.js') }}"  ></script>
    <script src="{{ asset('vendor/bootstrap-datepicker/js/bootstrap-datepicker.js') }} "></script>
    <script src="{{ asset('vendor/bootstrap-datepicker/locales/bootstrap-datepicker.es.min.js') }}"></script>
    <script src="{{ asset('vendor/bootstrap-select/js/bootstrap-select.js') }} "></script>
    <script src="{{ asset('vendor/bootstrap-select/js/i18n/defaults-es_ES.min.js') }} "></script>
    <script src="{{ asset('vendor/cropperjs/cropper.min.js') }} "></script>


    <script src="{{ asset('theme/js/app.js') }}"></script>
	  <script src="{{ asset('js/app/edit_perfil.js') }} "></script>

	@include('Alerts::alerts')
	{!! Toastr::render() !!}
    @yield('scripts')
</body>
</html>
