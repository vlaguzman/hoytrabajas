   <section class="content">
	  <section class="content-header">
      <h1>
        Inicio
        <small>Control panel</small>
      </h1>
    </section>
	<div class="row">
	   <br/> <br/>
	</div>
		<div class="row">

			<div class="col-lg-3 col-xs-6">
			  <div class="small-box bg-yellow">
				<div class="inner">
				  <h3>{{ $tt_usuarios }} </h3>
				  <p>Usuarios Registrados</p>
				</div>
				<div class="icon">
				  <i class="ion ion-person-add"></i>
				</div>
				<a href="{!! route('usuarios.index') !!}" class="small-box-footer">Detalles <i class="fa fa-arrow-circle-right"></i></a>
			  </div>
			</div>

			<div class="col-lg-3 col-xs-6">
			  <div class="small-box bg-red">
				<div class="inner">
				  <h3>{{ $tt_ofertas }}</h3>
				  <p>Ofertas Registradas</p>
				</div>
				<div class="icon">
				  <i class="ion-ios-people"></i>
				</div>
				<a href="{!! route('ofertas.index') !!}" class="small-box-footer">Detalles <i class="fa fa-arrow-circle-right"></i></a>
			  </div>
			</div>

			<div class="col-lg-3 col-xs-6">
			  <!-- small box -->
			  <div class="small-box bg-blue">
				<div class="inner">
				  <h3>{{ $tt_membresias_1 }}</h3>
				  <p>Membresias Empleados</p>
				</div>
				<div class="icon">
				  <i class="ion-android-list"></i>
				</div>
				<a href="{!! route('membresiaCandidatos.index') !!}" class="small-box-footer">Detalles <i class="fa fa-arrow-circle-right"></i></a>
			  </div>
			</div>
			<!-- ./col -->
			<div class="col-lg-3 col-xs-6">
			  <!-- small box -->
			  <div class="small-box bg-green">
				<div class="inner">
				  <h3>{{ $tt_membresias_2 }}</h3>
				  <p>Membresias Empleadores</p>
				</div>
				<div class="icon">
				  <i class="ion-compose"></i>
				</div>
				<a href="{!! route('membresiaEmpleadors.index') !!}" class="small-box-footer">Detalles <i class="fa fa-arrow-circle-right"></i></a>
			  </div>
			</div>
		</div>
	</section>
