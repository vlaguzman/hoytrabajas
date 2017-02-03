
<div class="form-group col-sm-6">
    {!! Form::label('pais_id', 'Pais:') !!}
    {!! Form::select('pais_id',$paises, null, ['class' => 'form-control'  ] ) !!}
</div>
<div class="form-group col-sm-6">
    {!! Form::label('descripcion', 'Departamento:') !!}
    {!! Form::text('descripcion', null, ['class' => 'form-control']) !!}
</div>

<div class="form-group col-sm-12">
    {!! Form::submit('Guardar', ['class' => 'btn btn-primary']) !!}
    <a href="{!! route('departamentos.index') !!}" class="btn btn-default"><i class="icon ion-android-arrow-back"></i></a>
</div>
