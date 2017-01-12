@extends('layouts.app')

@section('content')
    <section class="content-header">
        <h1>
            Perfil
        </h1>
   </section>
   <div class="content">
       @include('adminlte-templates::common.errors')
       <div class="box box-primary">
           <div class="box-body">
               <div class="row">
                   {!! Form::model($perfil, ['route' => ['perfils.update', $perfil->id], 'method' => 'patch']) !!}

                        @include('perfils.fields')

                   {!! Form::close() !!}
               </div>
           </div>
       </div>
   </div>
@endsection