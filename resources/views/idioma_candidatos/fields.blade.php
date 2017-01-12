<!-- Idioma Id Field -->
<div class="form-group col-sm-6">
    {!! Form::label('idioma_id', 'Idioma Id:') !!}
    {!! Form::number('idioma_id', null, ['class' => 'form-control']) !!}
</div>

<!-- Candidato Id Field -->
<div class="form-group col-sm-6">
    {!! Form::label('candidato_id', 'Candidato Id:') !!}
    {!! Form::number('candidato_id', null, ['class' => 'form-control']) !!}
</div>

<!-- Submit Field -->
<div class="form-group col-sm-12">
    {!! Form::submit('Guardar', ['class' => 'btn btn-primary']) !!}
    <a href="{!! route('idiomaCandidatos.index') !!}" class="btn btn-default"><i class="icon ion-android-arrow-back"></i></a>
</div>
