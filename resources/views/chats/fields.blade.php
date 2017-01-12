<!-- Name Field -->
<div class="form-group col-sm-6">
    {!! Form::label('name', 'Name:') !!}
    {!! Form::text('name', null, ['class' => 'form-control']) !!}
</div>

<!-- Lasttest Field -->
<div class="form-group col-sm-6">
    {!! Form::label('lasttest', 'Lasttest:') !!}
    {!! Form::text('lasttest', null, ['class' => 'form-control']) !!}
</div>

<!-- Ago Field -->
<div class="form-group col-sm-6">
    {!! Form::label('ago', 'Ago:') !!}
    {!! Form::date('ago', null, ['class' => 'form-control']) !!}
</div>

<!-- Face Field -->
<div class="form-group col-sm-6">
    {!! Form::label('face', 'Face:') !!}
    {!! Form::text('face', null, ['class' => 'form-control']) !!}
</div>

<!-- User Id Field -->
<div class="form-group col-sm-6">
    {!! Form::label('user_id', 'User Id:') !!}
    {!! Form::number('user_id', null, ['class' => 'form-control']) !!}
</div>

<!-- Submit Field -->
<div class="form-group col-sm-12">
    {!! Form::submit('Guardar', ['class' => 'btn btn-primary']) !!}
    <a href="{!! route('chats.index') !!}" class="btn btn-default"><i class="icon ion-android-arrow-back"></i></a>
</div>
