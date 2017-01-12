<div class="fondo">
  <div class="login-box fondo_hdn">
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
						   <a href="{{ url('/confirmarregistro3') }}" style="margin-bottom: 0px!important;" class="btn btn-primary btn-block btn-system01">Buscar Trabajo</a>
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
					<a href="{{ url('/confirmarregistro2') }}" class="btn btn-primary btn-block btn-system01">Buscar Empleados</a>
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
</div>
