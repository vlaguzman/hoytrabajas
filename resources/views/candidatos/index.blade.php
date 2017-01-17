@extends('layouts.app')

@section('content')
    <section class="content-header">
        <h1 class="pull-left">Empleados</h1>
    </section>
    <div class="content">
        <div class="clearfix"></div>

        {!! Alert::render() !!}

        <div class="clearfix"></div>
        <div class="box box-primary">
            <div class="box-body">
                    @include('candidatos.table')
            </div>
        </div>
    </div>
@endsection
