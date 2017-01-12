<!-- Id Field -->
<div class="form-group">
    {!! Form::label('id', 'Id:') !!}
    <p>{!! $usuario->id !!}</p>
</div>

<!-- Name Field -->
<div class="form-group">
    {!! Form::label('name', 'Name:') !!}
    <p>{!! $usuario->name !!}</p>
</div>

<!-- Email Field -->
<div class="form-group">
    {!! Form::label('email', 'Email:') !!}
    <p>{!! $usuario->email !!}</p>
</div>

<!-- Password Field -->
<div class="form-group">
    {!! Form::label('password', 'Password:') !!}
    <p>{!! $usuario->password !!}</p>
</div>

<!-- Remember Token Field -->
<div class="form-group">
    {!! Form::label('remember_token', 'Remember Token:') !!}
    <p>{!! $usuario->remember_token !!}</p>
</div>

<!-- Perfil Id Field -->
<div class="form-group">
    {!! Form::label('perfil_id', 'Perfil Id:') !!}
    <p>{!! $usuario->perfil_id !!}</p>
</div>

<!-- Activo Field -->
<div class="form-group">
    {!! Form::label('activo', 'Activo:') !!}
    <p>{!! $usuario->activo !!}</p>
</div>

<!-- Url Imagen Field -->
<div class="form-group">
    {!! Form::label('url_imagen', 'Url Imagen:') !!}
    <p>{!! $usuario->url_imagen !!}</p>
</div>

<!-- Created At Field -->
<div class="form-group">
    {!! Form::label('created_at', 'Created At:') !!}
    <p>{!! $usuario->created_at !!}</p>
</div>

<!-- Updated At Field -->
<div class="form-group">
    {!! Form::label('updated_at', 'Updated At:') !!}
    <p>{!! $usuario->updated_at !!}</p>
</div>

<!-- Deleted At Field -->
<div class="form-group">
    {!! Form::label('deleted_at', 'Deleted At:') !!}
    <p>{!! $usuario->deleted_at !!}</p>
</div>

