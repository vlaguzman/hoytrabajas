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
    <link rel="stylesheet" href="{{ asset('theme2/global/fonts/material-design/material-design.min.css') }} " >
    <link rel="stylesheet" href="{{ asset('theme2/global/fonts/brand-icons/brand-icons.min.css') }} " >
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
	  <link rel="stylesheet" href="{{ asset('vendor/toastr/build/toastr.css') }}">
   	<link rel="stylesheet" href="{{ asset('vendor/star-rating/star-rating-svg.css') }}">
    <link rel="stylesheet" href="{{ asset('vendor/cropperjs/cropper.css') }}">

    <script src="{{ asset('theme2/global/vendor/breakpoints/breakpoints.js') }} "></script>

     <script type="text/javascript">
        var APP_URL = {!! json_encode(url('/')) !!}
        Breakpoints();
     </script>

    @yield('css')
</head>

<body class="animsition dashboard"    >
@if (!Auth::guest())
  <nav class="site-navbar navbar navbar-default navbar-fixed-top navbar-mega navbar-inverse" role="navigation">
      <div class="navbar-header">
         <button type="button" class="navbar-toggler hamburger hamburger-close navbar-toggler-left hided" data-toggle="menubar">
            <span class="sr-only">Toggle navigation</span>
            <span class="hamburger-bar"></span>
         </button>
         <button type="button" class="navbar-toggler collapsed" data-target="#site-navbar-collapse" data-toggle="collapse">
              <i class="icon md-more" aria-hidden="true"></i>
         </button>
         <div class="navbar-brand navbar-brand-center site-gridmenu-toggle" data-toggle="gridmenu">
              <img class="navbar-brand-logo" src="{{ asset('images/logonav.png') }}" title="Remark">
              <span class="navbar-brand-text hidden-xs-down"> Remark</span>
         </div>
         <button type="button" class="navbar-toggler collapsed" data-target="#site-navbar-search" data-toggle="collapse">
             <span class="sr-only">Toggle Search</span>
             <i class="icon md-search" aria-hidden="true"></i>
         </button>
      </div>
      <div class="navbar-container container-fluid">
          <div class="collapse navbar-collapse navbar-collapse-toolbar" id="site-navbar-collapse">
              <ul class="nav navbar-toolbar">
                <li class="nav-item hidden-float" id="toggleMenubar">
                  <a class="nav-link" data-toggle="menubar" href="#" role="button">
                    <i class="icon hamburger hamburger-arrow-left">
                        <span class="sr-only">Toggle menubar</span>
                        <span class="hamburger-bar"></span>
                      </i>
                  </a>
                </li>
              </ul>

              <ul class="nav navbar-toolbar navbar-right navbar-toolbar-right">

                @include('layouts.notificaciones')
                <li class="nav-item" id="toggleChat">
                  <a class="nav-link" data-toggle="site-sidebar" href="javascript:void(0)" title="Chat" data-url="site-sidebar.tpl">
                     <i class="icon md-comment" aria-hidden="true"></i>
                  </a>
                </li>

                <li class="nav-item dropdown">
                   <a class="nav-link navbar-avatar" data-toggle="dropdown" href="#" aria-expanded="false" data-animation="scale-up" role="button">
                     <span class="avatar avatar-online">
                        <img src="global/portraits/5.jpg" alt="...">
                        <i></i>
                     </span>
                   </a>
                   <div class="dropdown-menu" role="menu">
                      <a class="dropdown-item" href="javascript:void(0)" role="menuitem"><i class="icon md-account" aria-hidden="true"></i> Perfil</a>
                      <a class="dropdown-item" href="javascript:void(0)" role="menuitem"><i class="icon md-settings" aria-hidden="true"></i> Preferencias </a>
                      <div class="dropdown-divider"></div>
                      <a class="dropdown-item" href="{!! url('/logout') !!}" onclick="event.preventDefault(); if (confirm('Confirma que desea salir?') ) { document.getElementById('logout-form').submit(); } " role="menuitem"><i class="icon md-power" aria-hidden="true"></i> Salir</a>
                      <form id="logout-form" action="{{ url('/logout') }}" method="POST" style="display: none;">
                            {{ csrf_field() }}
                      </form>
                  </div>
                </li>

              </ul>

              <div class="navbar-brand navbar-brand-center">
                <a href="#">
                  <img class="navbar-brand-logo" src="{{ asset('images/logonav.png') }}" title="Remark">
                </a>
              </div>

          </div>


      </div>

  </nav>

  <div class="wrapper">

        @include('layouts.sidebar')
        <div class="content-wrapper">
            @yield('content')
        </div>


        <footer class="main-footer text-color-3" style="max-height: 100px;text-align: center">
              <strong>Hoy Trabajas  © 2016. Todos los derechos reservados. Design By CRIZZ. </strong>
      			  <div class="pull-right">
      			     <strong> Version 1.2 - [2017.02.20]</strong>
      			 </div>
        </footer>
    </div>
  @endif
<!--
    <script src="{{ asset('vendor/jquery/jquery-2.2.4.min.js') }} "></script>
    <script src="{{ asset('vendor/bootstrap/js/bootstrap.min.js') }} "></script>
    -->
    <script src="{{ asset('theme2/global/vendor/babel-external-helpers/babel-external-helpers.js') }}"></script>
    <script src="{{ asset('theme2/global/vendor/jquery/jquery.js') }}"></script>
    <script src="{{ asset('theme2/global/vendor/tether/tether.js') }}"></script>
    <script src="{{ asset('theme2/global/vendor/bootstrap/bootstrap.js') }}"></script>
    <script src="{{ asset('theme2/global/vendor/animsition/animsition.js') }}"></script>
    <script src="{{ asset('theme2/global/vendor/mousewheel/jquery.mousewheel.js') }}"></script>
    <script src="{{ asset('theme2/global/vendor/asscrollbar/jquery-asScrollbar.js') }}"></script>
    <script src="{{ asset('theme2/global/vendor/asscrollable/jquery-asScrollable.js') }}"></script>
    <script src="{{ asset('theme2/global/vendor/waves/waves.js') }}"></script>
    <script src="{{ asset('theme2/global/vendor/switchery/switchery.min.js') }}"></script>
    <script src="{{ asset('theme2/global/vendor/intro-js/intro.js') }}"></script>
    <script src="{{ asset('theme2/global/vendor/screenfull/screenfull.js') }}"></script>
    <script src="{{ asset('theme2/global/vendor/slidepanel/jquery-slidePanel.js') }}"></script>
    <script src="{{ asset('theme2/global/vendor/chartist/chartist.min.js') }}"></script>
    <script src="{{ asset('theme2/global/vendor/chartist-plugin-tooltip/chartist-plugin-tooltip.min.js') }}"></script>
    <script src="{{ asset('theme2/global/vendor/jvectormap/jquery-jvectormap.min.js') }}"></script>
    <script src="{{ asset('theme2/global/vendor/jvectormap/maps/jquery-jvectormap-world-mill-en.js') }}"></script>
    <script src="{{ asset('theme2/global/vendor/matchheight/jquery.matchHeight-min.js') }}"></script>
    <script src="{{ asset('theme2/global/vendor/peity/jquery.peity.min.js') }}"></script>
    <script src="{{ asset('theme2/global/js/State.js') }}"></script>
    <script src="{{ asset('theme2/global/js/Component.js') }}"></script>
    <script src="{{ asset('theme2/global/js/Plugin.js') }}"></script>
    <script src="{{ asset('theme2/global/js/Base.js') }}"></script>
    <script src="{{ asset('theme2/global/js/Config.js') }}"></script>
    <script src="{{ asset('theme2/assets/js/Section/Menubar.js') }}"></script>
    <script src="{{ asset('theme2/assets/js/Section/Sidebar.js') }}"></script>
    <script src="{{ asset('theme2/assets/js/Section/PageAside.js') }}"></script>
    <script src="{{ asset('theme2/assets/js/Plugin/menu.js') }}"></script>
    <script src="{{ asset('theme2/global/js/config/colors.js') }}"></script>
    <script src="{{ asset('theme2/assets/js/config/tour.js') }}"></script>
    <script>
         Config.set('assets', 'assets');
    </script>
    <script src="{{ asset('theme2/assets/js/Site.js') }}"></script>
    <script src="{{ asset('theme2/global/js/Plugin/asscrollable.js') }}"></script>
    <script src="{{ asset('theme2/global/js/Plugin/slidepanel.js') }}"></script>
    <script src="{{ asset('theme2/global/js/Plugin/switchery.js') }}"></script>
    <script src="{{ asset('theme2/global/js/Plugin/matchheight.js') }}"></script>
    <script src="{{ asset('theme2/global/js/Plugin/jvectormap.js') }}"></script>
    <script src="{{ asset('theme2/global/js/Plugin/peity.js') }}"></script>
    <script src="{{ asset('theme2/assets/examples/js/dashboard/v1.js') }}"></script>


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

<!--
    <script src="{{ asset('theme/js/app.js') }}"></script>
	  <script src="{{ asset('js/app/edit_perfil.js') }} "></script>
-->






	@include('Alerts::alerts')
	{!! Toastr::render() !!}
    @yield('scripts')
</body>
</html>
