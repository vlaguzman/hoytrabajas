<?php

namespace App\Http\Controllers;


use App\Http\Controllers\Controller;
use App\Models\Ciudad;


class RegisterController2 extends Controller
{


    public function __construct()
    {
        $this->middleware('guest');
    }
    public function showRegistrationForm()
      {
           $ciudades      = Ciudad::orderBy('descripcion')->pluck('descripcion', 'id');
  	       return view('auth.register2')
                  ->with('ciudades',  $ciudades );
      }

}
