<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Mail;
use App\Mail\WelcomeMail;
use Intervention\Image\ImageManagerStatic as Image;
use narutimateum\Toastr\Facades\Toastr;
use Carbon\Carbon;
use App\User;
use App\Models\Usuario;
use App\Models\Administrador;
use App\Models\Empleador;
use App\Models\Candidato;
use App\Models\Genero;
use App\Models\Sector;
use App\Models\Estudio;
use App\Models\Idioma;
use App\Models\Ciudad;
use App\Models\SectorCandidato;
use App\Models\EstudioCandidato;
use App\Models\IdiomaCandidato;

class EdtPerfilController extends Controller
{

    public function confr3(){

        $obj=Auth::user();
        $ciudades     = Ciudad::orderBy('descripcion')->pluck('descripcion', 'id');
        $generos      = Genero::orderBy('descripcion')->pluck('descripcion', 'id');
        $sectores     = Sector::orderBy('descripcion')->pluck('descripcion', 'id');
        $estudios     = Estudio::orderBy('descripcion')->pluck('descripcion', 'id');
        $idiomas      = Idioma::orderBy('descripcion')->pluck('descripcion', 'id');
        return view('zvistas.confirmarregister3')
                  ->with('datos',     $obj)
                  ->with('generos',   $generos )
                  ->with('sectores',  $sectores )
                  ->with('estudios',  $estudios )
                  ->with('idiomas',   $idiomas  )
                  ->with('ciudades',  $ciudades );
    }
    public function confr2(){
        $obj=Auth::user();
        $ciudades     = Ciudad::orderBy('descripcion')->pluck('descripcion', 'id');
        return view('zvistas.confirmarregister2')
                 ->with('datos',     $obj)
                 ->with('ciudades',  $ciudades );
    }

    public function show()
    {
        $id_usr=Auth::user()->id;
        $tipo_usr=Auth::user()->perfil_id;
        $ciudades     = Ciudad::orderBy('descripcion')->pluck('descripcion', 'id');
        if($tipo_usr==1){
           $obj  = Administrador::where([ ['user_id', '=',$id_usr] ] )->first();
           return view('zvistas.perfil1')
                 ->with('datos',  $obj);
        }else if($tipo_usr==2){
           $obj  = Empleador::where([ ['user_id', '=',$id_usr] ] )->first();

           return view('zvistas.perfil2')
                  ->with('datos',     $obj)
                  ->with('ciudades',  $ciudades );
        }else if($tipo_usr==3){
            $generos      = Genero::orderBy('descripcion')->pluck('descripcion', 'id');
            $sectores     = Sector::orderBy('descripcion')->pluck('descripcion', 'id');
            $estudios     = Estudio::orderBy('descripcion')->pluck('descripcion', 'id');
            $idiomas      = Idioma::orderBy('descripcion')->pluck('descripcion', 'id');
            $obj=Candidato::where([ ['user_id', '=',$id_usr] ] )->first();
            $id_candidato=$obj->id;
            $lista1  = SectorCandidato::select(array('sectores.descripcion'   ))
                              ->leftJoin('sectores','sectores_candidatos.sector_id','=','sectores.id')
                              ->where([ ['candidato_id', '=',$id_candidato] ] )
                              ->orderBy('sectores_candidatos.created_at', 'desc')->get();
           $lista2  = IdiomaCandidato::select(array('idiomas.descripcion'   ))
                              ->leftJoin('idiomas','idiomas_candidatos.idioma_id','=','idiomas.id')
                              ->where([ ['candidato_id', '=',$id_candidato ] ] )
                              ->orderBy('idiomas_candidatos.created_at', 'desc')->get();
           $lista3  = EstudioCandidato::select(array('estudios.descripcion'   ))
                              ->leftJoin('estudios','estudios_candidatos.estudio_id','=','estudios.id')
                              ->where([ ['candidato_id', '=',$id_candidato ] ] )
                              ->orderBy('estudios_candidatos.created_at', 'desc')->get();
            return view('zvistas.perfil3')
                     ->with('datos',     $obj)
                     ->with('lsintereses', $lista1)
                     ->with('lsidiomas',   $lista2)
                     ->with('lsestudios',  $lista3)
                     ->with('generos',   $generos )
                     ->with('sectores',  $sectores )
                     ->with('estudios',  $estudios )
                     ->with('idiomas',   $idiomas )
                     ->with('ciudades',  $ciudades );
        }
    }
    public function guardar(Request $request){
        $id_usr=Auth::user()->id;
        $tipo= $request->input('tipo');

        if($tipo==1){
              $v = Validator::make($request->all(), [
                 'nombres' => 'required|max:100',
                 'apellidos' => 'required|max:100',
                 'email' => 'required|email|max:100',
                 'telefono' => 'required'


              ]);
              if ($v->fails()){
                  return redirect()->back()->withErrors($v->errors());
              }
              $obj=Administrador::where([ ['user_id', '=',$id_usr] ] )->first();
              $obj->nombres=$request->input('nombres');
              $obj->apellidos=$request->input('apellidos');
              $obj->correo=$request->input('email');
              $obj->telefono=$request->input('telefono');

              $rp=$obj->save();
        }else if($tipo==2){
              $v = Validator::make($request->all(), [
                 'nombre' => 'required|max:200',
                 'empresa' => 'required|max:200',
                 'email' => 'required|email|max:100',
                 'telefono' => 'required|min:8|max:15',
                 'direccion' => 'required|max:200',
                 'reseña' => 'required|max:300',

              ]);

              if ($v->fails()){
                  return redirect()->back()->withErrors($v->errors());
              }
              $obj=Empleador::where([ ['user_id', '=',$id_usr] ] )->first();
              $obj->contacto=$request->input('nombre');
              $obj->empresa=$request->input('empresa');
              $obj->correo=$request->input('email');
              $obj->descripcion=$request->input('reseña');
              $obj->telefono=$request->input('telefono');
              $obj->direccion=$request->input('direccion');
              $obj->ciudad_id=$request->input('ciudad');
              $rp=$obj->save();
        }else if($tipo==3){
              $v = Validator::make($request->all(), [
                 'nombres' => 'required|max:100',
                 'apellidos' => 'required|max:100',
                 'email' => 'required|email|max:100',
                 'nacio'=> 'required|date',
                 'experiencia' => 'required|numeric',
                 'telefono' => 'required|min:8|max:15',
                 'reseña' => 'required|max:300'
              ]);
              if ($v->fails()){
                  return redirect()->back()->withErrors($v->errors());
              }
              $obj=Candidato::where([ ['user_id', '=',$id_usr] ] )->first();
              $id_candidato=$obj->id;
              $obj->nombres=$request->input('nombres');
              $obj->apellidos=$request->input('apellidos');
              $obj->telefono=$request->input('telefono');
              $obj->fnac=  date("Y-m-d", strtotime(  $request->input('nacio')  ));
              $obj->correo=$request->input('email');
              $obj->descripcion=$request->input('reseña');
              $obj->experiencia=$request->input('experiencia');
              $obj->genero_id=$request->input('genero');
              $rp=$obj->save();
              if($rp){

                  $lst = $request->input('lssectores');
                  if( $lst !== null  ){
					if(count($lst)>0){  
                     foreach( $lst as $selected_id){
						   SectorCandidato::updateOrCreate([
								'candidato_id' => $id_candidato,
								'sector_id' => $selected_id,
						   ]);
                       }
					 } 
                  }

                  $lst = $request->input('lsidiomas');
                  if( $lst !== null  ){
					if(count($lst)>0){    
						foreach( $lst  as $selected_id){
							IdiomaCandidato::updateOrCreate([
							   'candidato_id' => $id_candidato,
							   'idioma_id' => $selected_id,
						   ]);
						}
					}	
                  }

                  $estudio_nv= $request->input('estudios');
                  $obj_e  = Estudio::where([ ['descripcion', '=', $estudio_nv ] ] )->first();
                  $id_estu="0";
                  if($obj_e ){
                      $id_estu=$obj_e->id;
                  }else{
                      if($estudio_nv!=''){
                          $obj_e= Estudio::create(['descripcion' => $estudio_nv]);
                          $id_estu=$obj_e->id;
                      }
                  }
                  if( $id_estu!="0"){
                      EstudioCandidato::updateOrCreate([
                           'candidato_id' => $id_candidato,
                           'estudio_id' => $id_estu,
                      ]);
                  }



              }
        }
		$options = [];
        Toastr::info("Perfil actualizado", "Procesado", $options );
        return back()->withInput();
    }

    public function confirmar(Request $request){
        $user=Auth::user();
        $id_usr=$user->id;
        $tipo= $request->input('tipo');
        if($tipo==1){

        }else if($tipo==2){
              $v = Validator::make($request->all(), [
                 'nombre' => 'required|max:200',
                 'empresa' => 'required|max:200',
                 'email' => 'required|email|max:100',
                 'telefono' => 'required',
                 'direccion' => 'required|max:200',
                 'reseña' => 'required|max:300',
                 'password' => 'required|min:6'
              ]);

              if ($v->fails()){
                  return redirect()->back()->withErrors($v->errors());
              }
              $rp=Empleador::create([
                     'contacto' => $request->input('nombre'),
                     'empresa' =>  $request->input('empresa'),
                     'correo' => $request->input('email'),
                     'descripcion' => $request->input('reseña'),
                     'ciudad_id' =>  $request->input('ciudad'),
                     'telefono' => $request->input('telefono'),
                     'direccion' =>  $request->input('ciudad'),
                     'user_id' => $id_usr,
                ]);
                $psw=$request->input('password');
                if($rp){
                   $obj=Usuario::where([ ['id', '=',$id_usr] ] )->first();
                   if($obj){
                      $obj->perfil_id=2;
                      $obj->password=bcrypt( $psw );
                      $obj->save();
                   }
                   Mail::to($user->email)->send(new WelcomeMail($user));
                }

        }else if($tipo==3){
            $v = Validator::make($request->all(), [
               'nombres' => 'required|max:100',
               'apellidos' => 'required|max:100',
               'email' => 'required|email|max:100',
               'nacio' => 'required|date',
               'experiencia' => 'required|numeric',
               'reseña' => 'required|max:300',
               'estudios' => 'required|min:2|max:200',
               'password' => 'required|min:6',
            ]);

            if ($v->fails()){
                return redirect()->back()->withErrors($v->errors());
            }
            $rp=Candidato::create([
                 'nombres' => $request->input('nombres'),
                 'apellidos' => $request->input('apellidos'),
                 'correo' => $request->input('email'),
                 'fnac' => date("Y-m-d", strtotime(  $request->input('nacio')  )),
                 'descripcion' => $request->input('reseña'),
                 'genero_id' => $request->input('genero'),
                 'experiencia' =>$request->input('experiencia'),
                 'rate' => 0,
                 'ciudad_id' => 1,
                 'telefono' => '',
                 'direccion' => '',
                 'user_id' => $id_usr,
            ]);
            $psw=$request->input('password');
            if($rp){
                $obj=Usuario::where([ ['id', '=',$id_usr] ] )->first();
                if($obj){
                   $obj->perfil_id=3;
                   $obj->password=bcrypt( $psw );
                   $obj->save();
                }
                $id_candidato=$rp->id;
                $lst = $request->input('lssectores');
                if( $lst !== null){
				   if(count($lst)>0){    	
					   foreach( $lst as $selected_id){
						  SectorCandidato::updateOrCreate([
							   'candidato_id' => $id_candidato,
							   'sector_id' => $selected_id,
						  ]);
					   }
				   }   
                }
                $lst = $request->input('lsidiomas');
                if( $lst !== null){
				  if(count($lst)>0){  	
					  foreach( $lst  as $selected_id){
						  IdiomaCandidato::updateOrCreate([
							   'candidato_id' => $id_candidato,
							   'idioma_id' => $selected_id,
						  ]);
					  }
				   }	  
                }

                $estudio_nv= $request->input('estudios');
                $obj_e  = Estudio::where([ ['descripcion', '=', $estudio_nv ] ] )->first();
                $id_estu="0";
                if($obj_e ){
                    $id_estu=$obj_e->id;
                }else{
                    if($estudio_nv!=''){
                        $obj_e= Estudio::create(['descripcion' => $estudio_nv]);
                        $id_estu=$obj_e->id;
                    }
                }
                if( $id_estu!="0"){
                    EstudioCandidato::updateOrCreate([
                         'candidato_id' => $id_candidato,
                         'estudio_id' => $id_estu,
                    ]);
                }
                Mail::to($user->email)->send(new WelcomeMail($user));
            }
        }
		$options = [];
        Toastr::info("Perfil confirmado", "Procesado", $options );
      return redirect()->intended('/home');
    }

    public function actualizarFoto(Request $request){
		     $options = [];
      		 $file=asset('/images/no-picture.jpg');
      		 $id_ = $request->input('id');
      		 $usuario=Usuario::where([ ['id', '=',$id_] ] )->first();
      		 if (!empty($usuario)) {
          			$image = $request->file('image');
          			$ruta_destino = public_path('/images/system_imgs/usuarios/');
          			$img =  Image::make($image->getRealPath());
          			$ruta_img=$ruta_destino."puser_".$id_.'.'.$image->getClientOriginalExtension();
          			$img_local='/images/system_imgs/usuarios/puser_'.$id_.'.'.$image->getClientOriginalExtension();
                $img->resize(200, 200)->save($ruta_img);
          			$file =asset($img_local);
          			$usuario->url_imagen = $file;
          		    $usuario->save();
				    
          			Toastr::info("Imagen de perfil actualizada", "Perfil", $options  );
          			return "Imagen de perfil actualizada";
            }
      		Toastr::info("No se pudo cargar la imagen", "Perfil", $options );
      	    return "No se pudo cargar la imagen";
    }


}
