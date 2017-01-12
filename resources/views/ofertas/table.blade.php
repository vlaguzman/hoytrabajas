@section('css')
    @include('layouts.datatables_css')
@endsection

{!! $dataTable->table(['cellspacing'=>'0','width' => '100%','class'=> 'uk-table uk-table-hover' ] ) !!}

@section('scripts')
    @include('layouts.datatables_js')
    {!! $dataTable->scripts() !!}
@endsection