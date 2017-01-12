@extends('layouts.app')

@section('content')
    <section class="content-header">
        <h1>
            Estudio Candidato
        </h1>
   </section>
   <div class="content">
       @include('adminlte-templates::common.errors')
       <div class="box box-primary">
           <div class="box-body">
               <div class="row">
                   {!! Form::model($estudioCandidato, ['route' => ['estudioCandidatos.update', $estudioCandidato->id], 'method' => 'patch']) !!}

                        @include('estudio_candidatos.fields')

                   {!! Form::close() !!}
               </div>
           </div>
       </div>
   </div>
@endsection