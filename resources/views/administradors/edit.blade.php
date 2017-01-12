@extends('layouts.app')

@section('content')
    <section class="content-header">
        <h1>
            Administrador
        </h1>
   </section>
   <div class="content">
       @include('adminlte-templates::common.errors')
       <div class="box box-primary">
           <div class="box-body">
               <div class="row">
                   {!! Form::model($administrador, ['route' => ['administradors.update', $administrador->id], 'method' => 'patch']) !!}

                        @include('administradors.fields')

                   {!! Form::close() !!}
               </div>
           </div>
       </div>
   </div>
@endsection