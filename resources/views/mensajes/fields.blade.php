<!-- Deuser Id Field -->
<div class="form-group col-sm-6">
    {!! Form::label('deuser_id', 'Deuser Id:') !!}
    {!! Form::number('deuser_id', null, ['class' => 'form-control']) !!}
</div>

<!-- Parauser Id Field -->
<div class="form-group col-sm-6">
    {!! Form::label('parauser_id', 'Parauser Id:') !!}
    {!! Form::number('parauser_id', null, ['class' => 'form-control']) !!}
</div>

<!-- Mensaje Field -->
<div class="form-group col-sm-12 col-lg-12">
    {!! Form::label('mensaje', 'Mensaje:') !!}
    {!! Form::textarea('mensaje', null, ['class' => 'form-control']) !!}
</div>

<!-- Submit Field -->
<div class="form-group col-sm-12">
    {!! Form::submit('Guardar', ['class' => 'btn btn-primary']) !!}
    <a href="{!! route('mensajes.index') !!}" class="btn btn-default"><i class="icon ion-android-arrow-back"></i></a>
</div>
