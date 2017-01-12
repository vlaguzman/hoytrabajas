<aside class="main-sidebar" id="sidebar-wrapper">
   <div ></div>
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
        <div class="user-panel hidden-xs hidden-sm">
            <div class="center-block ">
                <img id='img_perfilg' src="{{  Auth::user()->url_imagen  }} " class="profile-picture-1 img-responsive center-block"  width="94px" alt="User Image"/>
            </div>
            <div class="text-center text-color-5 hidden-xs hidden-sm">
                @if (Auth::guest())
                    <p  ><strong>{{ config('app.name') }}</strong></p>
                @else
				            <strong>{{ Auth::user()->name }}</strong>
                @endif
                <!-- Status -->
                <p class='text-color-5' >
				   <strong>
					{{ Auth::user()->getDes_Perfil() }}
				    </strong>
				 </p>

            </div>
			<div class="text-center text-color-5 hidden-xs hidden-sm">

            </div>
        </div>
        <!-- Sidebar Menu -->
        <ul class="sidebar-menu">
		        @if ( Auth::user()->perfil_id =='0' )
                    @include('layouts.menu0')
		        @elseif ( Auth::user()->perfil_id =='1' )
                    @include('layouts.menu1')
				@elseif ( Auth::user()->perfil_id =='2' )
                    @include('layouts.menu2')
				@elseif ( Auth::user()->perfil_id =='3' )
                    @include('layouts.menu3')
                @endif
        </ul>
        <!-- /.sidebar-menu -->
    </section>
    <!-- /.sidebar -->
</aside>
