@extends('layouts.app')

@section('content')
    <section class="content-header">
        <h1>
            Idioma Candidato
        </h1>
   </section>
   <div class="content">
       @include('adminlte-templates::common.errors')
       <div class="box box-primary">
           <div class="box-body">
               <div class="row">
                   {!! Form::model($idiomaCandidato, ['route' => ['idiomaCandidatos.update', $idiomaCandidato->id], 'method' => 'patch']) !!}

                        @include('idioma_candidatos.fields')

                   {!! Form::close() !!}
               </div>
           </div>
       </div>
   </div>
@endsection