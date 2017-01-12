@extends('layouts.app')

@section('content')
    <section class="content-header">
        <h1>
            Postulacion Estatus
        </h1>
   </section>
   <div class="content">
       @include('adminlte-templates::common.errors')
       <div class="box box-primary">
           <div class="box-body">
               <div class="row">
                   {!! Form::model($postulacionEstatus, ['route' => ['postulacionEstatuses.update', $postulacionEstatus->id], 'method' => 'patch']) !!}

                        @include('postulacion_estatuses.fields')

                   {!! Form::close() !!}
               </div>
           </div>
       </div>
   </div>
@endsection