@extends('layouts.app')
@section('content')
<section class="content">
	<div class="row">
	   <br/>
	</div>
	<div class="row">
	   <div class="col-md-1">
	   </div>
	   <div class="col-md-10">
			 <form method="post" action="{{ url('/filtrarempleados') }}"    >
 				 {!! csrf_field() !!}
			 	<div class="container-fluid">
						<div class="row">
							<div class="col-md-1">
							</div>
							<div class="col-md-10 f_white">
								 <div class="text-center">
									 <h3 class='tit_mb1' >Buscar trabajadores </h3>
								 </div>
							</div>
							<div class="col-md-1">

							</div>
						</div>
				<div class="row fondo_gris">
					      <div class="col-md-12">
					        <br/>
		            </div>
				</div>
				<div class="fondo_gris">
						<br />
					<div class="form-group">
							 <div class="input-group">
									<span class="input-group-addon" ><span class="icon icon-user"></span></span>
								  Nombre
							 </div>
							 <input type="text" class="form-control" name="nombre" value="" placeholder="buscar por empleado" >
					</div>
					<div class="form-group "   >
					    <div class="input-group">
						      <span class="input-group-addon" > <span class="icon icon-location-pin"></span>  </span>
	                Ciudad
						</div>
						 	{!! Form::select('lsciudades[]',$ciudades, null, ['class' => 'form-control','multiple' => true   ] ) !!}
					</div>
					<div class="form-group "   >
					    <div class="input-group">
						     <span class="input-group-addon" > <span class="icon icon-symbol-female"></span> </span>
	               Genero
						  </div>
							{!! Form::select('lsgeneros[]',$generos, null, ['class' => 'form-control','multiple' => true,'title'=>'--Seleccione--'    ] ) !!}
					</div>
					<div class="form-group ">
							<div class="input-group">
								 <span class="input-group-addon" ><span class="icon icon-pie-chart"></span></span>
							   Experiencia
						  </div>
							<input type="number" class="form-control" name="exp" value="" placeholder="Experiencia" >
					</div>
					<div class="form-group "   >
							<div class="input-group">
								<span class="input-group-addon" > <span class="icon icon-heart"></span>  </span>
							 Sector de interes
						</div>
							{!! Form::select('lssectores[]',$sectores, null, ['class' => 'form-control','multiple' => true ,'title'=>'--Seleccione--'   ] ) !!}
					</div>
					<div class="form-group "   >
	            <div class="input-group">
	              <span class="input-group-addon" > <span class="icon icon-globe"></span>  </span>
	              Idiomas
	            </div>
	            {!! Form::select('lsidiomas[]',$idiomas, null, ['class' => 'form-control','multiple' => true,'title'=>'--Seleccione--'    ] ) !!}
	        </div>
					<div class="form-group">
							<div class="input-group">
								 <span class="input-group-addon" ><span class="icon icon-present"></span></span>
							   <input type="date" class="form-control" name="fnac" value=""  >
						 </div>
					</div>
					<br />
				</div>
					<div class="row">
						<div class="col-xs-12">
								<button type="submit" class="btn btn-primary btn-block btn-system01">Buscar</button>
						</div>
				 </div>
			 </div>
	   </form>

	   </div>
    <div class="col-md-1">
	   </div>
	</div>
</section>
@endsection
