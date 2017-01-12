<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

use App\User;
use App\Models\Oferta;
use App\Models\Candidato;
use App\Models\Empleador;
use App\Models\Membresia;
use App\Models\MembresiaCandidato;
use App\Models\MembresiaEmpleador;
use App\Models\MembresiaPrecio;
use App\Models\Postulacion;



class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $tt_usuarios     =  User::all()->count();
    		$tt_ofertas      =  Oferta::all()->count();
    		$tt_membresias_1 =  MembresiaCandidato::all()->count();
    		$tt_membresias_2 =  MembresiaEmpleador::all()->count();
        $validar=$this->getFechaSys();
        $id_usr=Auth::user()->id;
        $tipo_=Auth::user()->perfil_id;
        $lista="";
         if($tipo_==2 ){
            $obj=Empleador::where([ ['user_id', '=',$id_usr] ] )->first();
            $lista= Oferta::where([ ['empleador_id', '=',$obj->id ]  ,['desde', '<=',$validar ],['hasta', '>=',$validar ] ] )
                        ->orderBy('created_at', 'desc')->get();
        }else{
          $lista= Oferta::where([ ['desde', '<=',$validar ],['hasta', '>=',$validar ] ] )
                      ->orderBy('created_at', 'desc')->get();
        }
		    return view('home')
		           ->with('tt_usuarios', $tt_usuarios)
			         ->with('tt_ofertas', $tt_ofertas)
			         ->with('tt_membresias_1', $tt_membresias_1)
               ->with('tt_membresias_2', $tt_membresias_2)
               ->with('ofertas',  $lista );
    }
    /* opciones del menu principal */
    public function membresia(){
          $validar=$this->getFechaSys();
          $id_usr=Auth::user()->id;
          $tipo_=Auth::user()->perfil_id;
          if($tipo_==3 ){
              $id_=Candidato::where([ ['user_id', '=',$id_usr] ] )->first();
              $item= MembresiaCandidato::where([ ['candidato_id', '=',$id_->id ],['desde', '<=',$validar ],['hasta', '>=',$validar ] ] )->first();
              if ($item) {
                        $segundos=strtotime($item->hasta) - strtotime('now');
                        $vigencia=intval($segundos/60/60/24);
                       return view('zvistas.membresia3a')
                            ->with('afiliado', true )
                            ->with('msg', $vigencia );
              }else{
                   $membresia=Membresia::where([ ['candidato', '=', 1] ] )->first();
                   $id_membresia=$membresia->id;
                   $item= MembresiaPrecio::where([ ['membresia_id', '=',$id_membresia ],['desde', '<=',$validar ],['hasta', '>=',$validar ] ] )->first();
                   return view('zvistas.membresia3')
                         ->with('afiliado', false )
                         ->with('msg', $item->precio );
              }
          }
    }

    public function mistrabajos(){
          $id_usr=Auth::user()->id;
          $obj=Candidato::where([ ['user_id', '=',$id_usr] ] )->first();
          $prop_=$obj->id;
          $lista1 = DB::select( DB::raw("SELECT O.* FROM ofertas O,postulaciones P
		                WHERE P.oferta_id=O.id and P.estatus_id='1' and P.candidato_id='". $prop_  ."'  ") );
          $lista2 = DB::select( DB::raw("SELECT O.* FROM ofertas O,postulaciones P
        		        WHERE P.oferta_id=O.id and P.estatus_id='2' and P.candidato_id='". $prop_  ."'  ") );
          $lista3 = DB::select( DB::raw("SELECT O.* FROM ofertas O,postulaciones P
                		WHERE P.oferta_id=O.id and P.estatus_id='3' and P.candidato_id='". $prop_  ."'  ") );
          return view('zvistas.mistrabajos')
                 ->with('ofertas1',  $lista1 )
                 ->with('ofertas2',  $lista2 )
                 ->with('ofertas3',  $lista3 );
    }
    public function mistrabajadores(){
          $id_usr=Auth::user()->id;
          $obj=Empleador::where([ ['user_id', '=',$id_usr] ] )->first();
          $prop_=$obj->id;
          $lista1 = DB::select( DB::raw("SELECT DISTINCT P.id as pid,E.id,E.nombres,E.apellidos,
            		    E.created_at as ago,U.url_imagen,E.telefono,E.correo,E.descripcion,E.experiencia,E.rate
            				FROM ofertas O,postulaciones P,candidatos E,users U
            		    WHERE P.estatus_id ='1' and P.oferta_id=O.id and O.empleador_id='". $prop_  ."'
            				and P.candidato_id=E.id and E.user_id=U.id ") );
          $lista2 = DB::select( DB::raw("SELECT DISTINCT E.id,E.nombres ,E.apellidos,
             		    E.created_at as ago,U.url_imagen,E.telefono,E.correo,E.descripcion,E.experiencia,E.rate
             		    FROM ofertas O,postulaciones P,candidatos E,users U
             		    WHERE P.estatus_id ='2' and P.oferta_id=O.id and O.empleador_id='". $prop_   ."'
             				and P.candidato_id=E.id and E.user_id=U.id ") );
         $lista3 = DB::select( DB::raw("SELECT DISTINCT E.id,E.nombres,E.apellidos,
             		   E.created_at as ago,U.url_imagen,E.telefono,E.correo,E.descripcion,E.experiencia,E.rate
             		   FROM ofertas O,postulaciones P,candidatos E,users U
             		   WHERE P.estatus_id ='3' and P.oferta_id=O.id and O.empleador_id='". $prop_  ."'
             		   and P.candidato_id=E.id and E.user_id=U.id ") );
          return view('zvistas.mistrabajadores')
                 ->with('empleados1',  $lista1 )
                 ->with('empleados2',  $lista2 )
                 ->with('empleados3',  $lista3 );
    }


    public function ofertasactivas(){
          $validar=Util::getFechaSys();
          $lista= Oferta::where([ ['desde', '<=',$validar ],['hasta', '>=',$validar ] ] )
                      ->orderBy('created_at', 'desc')->get();
          return view('zvistas.ofertas')
                 ->with('ofertas',  $lista );
    }
    public function terminos(){
          return view('zvistas.terminos');
    }


    private function getFechaSys(){
         date_default_timezone_set('America/Bogota');
         $fecha_ = date("Y-m-d", time());
         $hora_=  date("H:i:s", time());
         return $fecha_.$hora_;
     }



}
