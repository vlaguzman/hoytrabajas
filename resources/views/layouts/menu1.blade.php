<li class="header">Principal</li>
<li class="treeview">
    <li class="treeview">
		<a href="{!! url('/home') !!}">
			<i class="icon icon-home"></i> <span> Inicio</span>
		</a>
	</li>
	<li class="treeview">
     <a href="{!! url('/verperfil') !!}">
        <i class="icon icon-user"></i> <span> Perfil</span>
     </a>
	</li>
	<li class="treeview">
        <a href="#">
            <i class="icon icon-people"></i> <span>Usuarios</span>
            <span class="pull-right-container">
                <i class="fa fa-angle-left pull-right"></i>
            </span>
        </a>
		   <ul class="treeview-menu">
           <li class="{{ Request::is('administradors*') ? 'active' : '' }}"  >
				        <a href="{{ route('administradors.index', '1') }}"><i class="icon icon-arrow-right-circle"></i> Administradores</a>
			     </li>
           <li class="{{ Request::is('empleadors*') ? 'active' : '' }}">
               <a href="{!! route('empleadors.index') !!}"><i class="icon icon-arrow-right-circle"></i> Empleadores</a>
           </li>
           <li class="{{ Request::is('candidatos*') ? 'active' : '' }}">
       		   	<a href="{!! route('candidatos.index') !!}"><i class="icon icon-arrow-right-circle"></i> Empleados</a>
       		 </li>
      </ul>
  </li>
  <li class="treeview">
    <a href="#">
        <i class="icon icon-layers"></i> <span>Registros</span>
        <span class="pull-right-container">
            <i class="fa fa-angle-left pull-right"></i>
        </span>
    </a>
    <ul class="treeview-menu">
        <li class="treeview">
           <a href="#">
               <i class="icon icon-location-pin"></i> <span>Geograficos</span>
               <span class="pull-right-container">
                 <i class="fa fa-angle-left pull-right"></i>
               </span>
           </a>
           <ul class="treeview-menu">
               <li class="{{ Request::is('pais*') ? 'active' : '' }}"    ><a href="{!! route('pais.index') !!}"><span class="lnr lnr-location"></span> Paises</a></li>
               <li class="{{ Request::is('departamentos*') ? 'active' : '' }}" ><a href="{!! route('departamentos.index') !!}"><span class="lnr lnr-location"></span> Departamentos</a></li>
               <li class="{{ Request::is('ciudads*') ? 'active' : '' }}" ><a href="{!! route('ciudads.index') !!}"><span class="lnr lnr-location"></span> Ciudades</a></li>
           </ul>
       </li>
       <li class="treeview">
         <li class="{{ Request::is('sectors*') ? 'active' : '' }}">
            <a href="{!! route('sectors.index') !!}"><i class="icon icon-star"></i><span> Sectores Interes</span></a>
         </li>
       </li>
       <li class="treeview">
         <li class="{{ Request::is('idiomas*') ? 'active' : '' }}">
            <a href="{!! route('idiomas.index') !!}"><i class="icon icon-globe"></i><span> Idiomas</span></a>
         </li>
       </li>
       <li class="treeview">
         <li class="{{ Request::is('estudios*') ? 'active' : '' }}">
            <a href="{!! route('estudios.index') !!}"><i class="icon icon-graduation"></i><span> Estudios</span></a>
         </li>
       </li>
       <li class="treeview">
         <li class="{{ Request::is('generos*') ? 'active' : '' }}">
            <a href="{!! route('generos.index') !!}"><i class="icon icon-symbol-male"></i><span> Generos</span></a>
         </li>
       </li>
    </ul>
  </li>
</li>
<li class="header">Administracion</li>
	<li class="treeview">
	    <a href="#">
            <i class="icon icon-trophy"></i> <span>Membresias</span>
            <span class="pull-right-container">
               <i class="fa fa-angle-left pull-right"></i>
            </span>
    </a>
		 <ul class="treeview-menu">
            <li class="{{ Request::is('membresias*') ? 'active' : '' }}"    ><a href="{!! route('membresias.index') !!}"><span class="icon icon-compass"></span> Listado</a></li>
            <li class="{{ Request::is('membresiaPrecios*') ? 'active' : '' }}" ><a href="{!! route('membresiaPrecios.index') !!}"><span class="icon icon-compass"></span> Precios</a></li>
         </ul>
    </li>

    <li class="treeview">
  		<li class="{{ Request::is('ofertas*') ? 'active' : '' }}">
  			<a href="{!! route('ofertas.index') !!}"><i class="icon icon-plus"></i><span> Ofertas</span></a>
  		</li>
    </li>
<li class="header">Finanzas</li>
  <li class="treeview">
     <li class="treeview">
  		<li class="{{ Request::is('membresiaCandidatos*') ? 'active' : '' }}">
  			  <a href="{!! route('membresiaCandidatos.index') !!}"><i class="icon icon-wallet"></i> <span> Pagos Empleados </span>  </a>
  		</li>
	</li>
	<li class="treeview">
        <li class="{{ Request::is('membresiaEmpleadors*') ? 'active' : '' }}">
  			  <a href="{!! route('membresiaEmpleadors.index') !!}"><i class="icon icon-wallet"></i> <span> Pagos Empresas </span> </a>
  		</li>
	</li>	
  </li>
  
