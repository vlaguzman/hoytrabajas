<?php
	   use Carbon\Carbon;
     use App\Models\Departamento;
     Carbon::setLocale(config('app.locale'));

?>

<!-- Departamento Id Field -->
<div class="form-group col-sm-6">
    {!! Form::label('departamento_id', 'Departamento:') !!}
    {!! Form::select('departamento_id',$departamentos, null, ['class' => 'form-control'  ] ) !!}
</div>
<div class="form-group col-sm-6">
    {!! Form::label('descripcion', 'Descripcion:') !!}
    {!! Form::text('descripcion', null, ['class' => 'form-control']) !!}
</div>

<!-- Submit Field -->
<div class="form-group col-sm-12">
    {!! Form::submit('Guardar', ['class' => 'btn btn-primary']) !!}
    <a href="{!! route('ciudads.index') !!}" class="btn btn-default"><i class="icon ion-android-arrow-back"></i></a>
</div>
