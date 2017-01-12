@extends('layouts.app')

@section('content')
    <section class="content-header">
        <h1>
            Estudio Candidato
        </h1>
    </section>
    <div class="content">
        <div class="box box-primary">
            <div class="box-body">
                <div class="row" style="padding-left: 20px">
                    @include('estudio_candidatos.show_fields')
                    <a href="{!! route('estudioCandidatos.index') !!}" class="btn btn-default"><i class="icon ion-android-arrow-back"></i> </a>
                </div>
            </div>
        </div>
    </div>
@endsection
