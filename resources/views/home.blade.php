@extends('layouts.app')

@section('content')
<div class="container">
   @if ( Auth::user()->perfil_id =='0' )
          @include('zvistas.dsb0')
	 @elseif ( Auth::user()->perfil_id =='1' )
        @include('zvistas.dsb1')
	 @elseif ( Auth::user()->perfil_id =='2' )
        @include('zvistas.dsb2')
	 @elseif ( Auth::user()->perfil_id =='3' )
        @include('zvistas.dsb3')
     @endif
</div>
@endsection
