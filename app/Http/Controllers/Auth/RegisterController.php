<?php

namespace App\Http\Controllers\Auth;

use App\User;
use App\Http\Controllers\Controller;
use App\Http\Requests;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Foundation\Auth\RegistersUsers;
use narutimateum\Toastr\Facades\Toastr;
use Intervention\Image\ImageManagerStatic as Image;
use Illuminate\Support\Facades\Mail;
use App\Mail\WelcomeMail;

use App\Models\Genero;
use App\Models\Sector;
use App\Models\Estudio;
use App\Models\Idioma;
use App\Models\Ciudad;
use App\Models\Candidato;
use App\Models\Empleador;
use App\Models\SectorCandidato;
use App\Models\EstudioCandidato;
use App\Models\IdiomaCandidato;

class RegisterController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Register Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles the registration of new users as well as their
    | validation and creation. By default this controller uses a trait to
    | provide this functionality without requiring any additional code.
    |
    */

    use RegistersUsers;

    /**
     * Where to redirect users after registration.
     *
     * @var string
     */
    protected $redirectTo = '/home';

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {

		 $this->middleware('guest');

    }

	public function showRegistrationForm()  // sobreescribir funcion ....
    {
         $generos      = Genero::orderBy('descripcion')->pluck('descripcion', 'id');
         $sectores     = Sector::orderBy('descripcion')->pluck('descripcion', 'id');
         $estudios     = Estudio::orderBy('descripcion')->pluck('descripcion', 'id');
         $idiomas      = Idioma::orderBy('descripcion')->pluck('descripcion', 'id');
         $ciudades     = Ciudad::orderBy('descripcion')->pluck('descripcion', 'id');
	       return view('auth.register')
                ->with('generos',  $generos )
                ->with('sectores',  $sectores )
                ->with('estudios',  $estudios )
                ->with('idiomas',  $idiomas )
                ->with('ciudades',  $ciudades );
    }
    /**
     * Get a validator for an incoming registration request.
     *
     * @param  array  $data
     * @return \Illuminate\Contracts\Validation\Validator
     */
    protected function validator(array $data)
    {
        if($data['tipo']=='2' ){
           return Validator::make( $data, [
              'nombre' => 'required|min:2|max:200',
              'email' => 'required|email|max:255|unique:users',
              'password' => 'required|min:6|confirmed',
              'empresa' => 'required|min:2|max:200',
              'telefono' => 'required|max:15',
              'dir' => 'required|min:3|max:200',
              'reseña' => 'required|min:9|max:200',
              'imagen_perfl_' => 'required|image|mimes:jpeg,png,jpg|max:2048'
           ]);
        }else if($data['tipo']=='3' ){
           return Validator::make($data, [
               'nombre' => 'required|min:2|max:100',
			         'apellido' => 'required|min:2|max:100',
               'email' => 'required|email|max:100|unique:users',
               'password' => 'required|min:6|confirmed',
               'estudios' => 'required|min:3|max:200',
               'experiencia' => 'required|numeric|min:1|max:75',
               'nacio' => 'required',
               'reseña' => 'required|min:9|max:300',
               'imagen_perfl_' => 'required|image|mimes:jpeg,png,jpg|max:2048'
            ]);
        }

    }

    /**
     * Create a new user instance after a valid registration.
     *
     * @param  array  $data
     * @return User
     */
    protected function create(array $data)
    {

       if($data['tipo']=='2' ){

           $user = User::create([
                     'email' => $data['email'],
                     'name' => $data['nombre'],
                     'password' =>  bcrypt($data['password']),
                     'perfil_id' =>2,
                     'activo' =>1,
                     'push_token'=>'',
                     'url_imagen' => asset('/images/no-picture.jpg'),
                   ]);
            if($user){
                $id_usr=$user->id;
                $rp=Empleador::create([
                         'contacto' => $data['nombre'],
                         'empresa' =>  $data['empresa'],
                         'correo' => $data['email'],
                         'descripcion' => $data['reseña'],
                         'ciudad_id' =>  $data['ciudad'],
                         'telefono' =>  $data['telefono'],
                         'direccion' =>  $data['dir'],
                         'user_id' => $id_usr,
                    ]);

                if($rp){
                   $image = $data['imagen_perfl_'];
                   $ruta_destino = public_path('/images/system_imgs/usuarios/');
                   if($image!=null){
                       $img =  Image::make($image->getRealPath());
                       $ruta_img=$ruta_destino."puser_".$id_usr.'.'.$image->getClientOriginalExtension();
                       $img_local='/images/system_imgs/usuarios/puser_'.$id_usr.'.'.$image->getClientOriginalExtension();
                       $img->resize(200, 200)->save($ruta_img);
                       $file =asset($img_local);
                       $user->url_imagen=$file;
                       $user->save();
                   }
                   Toastr::info("Bienvenido a Hoy Trabajas", "Empresa", $options = ["progressBar" => false,
                              "positionClass" =>"toast-top-right",
                              "preventDuplicates"=> false,
                              "showDuration" => 300,
                              "hideDuration" => 3000,
                              "timeOut" => 5000,
                              "extendedTimeOut" => 1000,
                              "showEasing" => "swing",
                              "hideEasing"=> "linear",
                              "showMethod" => "fadeIn",
                              "hideMethod" => "fadeOut"  ] );
					        	Mail::to($user->email)->send(new WelcomeMail($user));
                    return $user;
                }else{
                  Toastr::error("Error al crear el Usuario Empresa", "Usuario..", $options = [] );
                }
            }else{
                 Toastr::error("No se pudo crear el Usuario Empresa.", "Usuario.", $options = [] );
            }

        }else if($data['tipo']=='3' ){
              $user = User::create([
                   'email' => $data['email'],
                   'name' => $data['nombre'],
                   'password' =>  bcrypt($data['password']),
                   'perfil_id' =>3,
                   'activo' =>1,
                   'push_token'=>'',
                   'url_imagen' => asset('/images/no-picture.jpg'),
              ]);
          if($user){
              $id_usr=$user->id;
              $rp=Candidato::create([
                       'nombres' => $data['nombre'],
                       'apellidos' => $data['apellido'],
                       'correo' => $data['email'],
                       'fnac' => date("Y-m-d", strtotime($data['nacio'] )),
                       'descripcion' => $data['reseña'],
                       'genero_id' => $data['genero'],
                       'experiencia' => $data['experiencia'],
                       'rate' => 0,
                       'ciudad_id' => 1,
                       'telefono' => '',
                       'direccion' => '',
                       'user_id' => $id_usr,
                  ]);

              if($rp){
                  $image = $data['imagen_perfl_'];
                  $ruta_destino = public_path('/images/system_imgs/usuarios/');
                  if($image!=null){
                      $img =  Image::make($image->getRealPath());
                      $ruta_img=$ruta_destino."puser_".$id_usr.'.'.$image->getClientOriginalExtension();
                      $img_local='/images/system_imgs/usuarios/puser_'.$id_usr.'.'.$image->getClientOriginalExtension();
                      $img->resize(200, 200)->save($ruta_img);
                      $file =asset($img_local);
                      $user->url_imagen=$file;
                      $user->save();
                  }
                  $id_candidato=$rp->id;
                  foreach( $data['lssectores'] as $selected_id){
                      SectorCandidato::create([
                           'candidato_id' => $id_candidato,
                           'sector_id' => $selected_id,
                      ]);
                  }
                  foreach( $data['lsidiomas'] as $selected_id){
                      IdiomaCandidato::create([
                           'candidato_id' => $id_candidato,
                           'idioma_id' => $selected_id,
                      ]);
                  }
                  $estudio_nv=$data['estudios'];
                  $obj_e  = Estudio::where([ ['descripcion', '=', $estudio_nv ] ] )->first();
                  $id_estu="0";
                  if($obj_e ){
                      $id_estu=$obj_e->id;
                  }else{
                      $obj_e= Estudio::create([
                           'descripcion' => $estudio_nv
                       ]);
                      $id_estu=$obj_e->id;
                  }
                  EstudioCandidato::create([
                       'candidato_id' => $id_candidato,
                       'estudio_id' => $id_estu,
                  ]);
                 Toastr::info("Bienvenido a Hoy Trabajas", "Usuario", $options = ["progressBar" => true,
                            "positionClass" =>"toast-top-right",
                            "preventDuplicates"=> false,
                            "showDuration" => 300,
                            "hideDuration" => 1000,
                            "timeOut" => 5000,
                            "extendedTimeOut" => 1000,
                            "showEasing" => "swing",
                            "hideEasing"=> "linear",
                            "showMethod" => "fadeIn",
                            "hideMethod" => "fadeOut"  ] );
					       Mail::to($user->email)->send(new WelcomeMail($user));
                 return $user;
              }else{
                Toastr::error("Error al crear el Usuario", "Usuario..", $options = [] );
              }
          }else{
               Toastr::error("No se pudo crear el Usuario.", "Usuario.", $options = [] );
          }
        }

    }


    protected function create2(array $data)
    {

      $user = User::create([
                'email' => $data['email'],
                'name' => $data['name'],
                'password' =>  bcrypt($data['password']),
                'perfil_id' =>2,
                'activo' =>1,
                'url_imagen' => asset('/images/no-picture.jpg'),
              ]);
       if($user){
           $id_usr=$user->id;
           $rp=Empleador::create([
                    'contacto' => $data['name'],
                    'empresa' =>  $data['empresa'],
                    'correo' => $data['email'],
                    'descripcion' => $data['des'],
                    'ciudad_id' =>  $data['ciudad'],
                    'telefono' =>  $data['telefono'],
                    'direccion' =>  $data['dir'],
                    'user_id' => $id_usr,
               ]);

           if($rp){
              Toastr::info("Bienvenido a Hoy Trabajas", "Empresa", $options = ["progressBar" => false,
                         "positionClass" =>"toast-top-right",
                         "preventDuplicates"=> false,
                         "showDuration" => 300,
                         "hideDuration" => 3000,
                         "timeOut" => 5000,
                         "extendedTimeOut" => 1000,
                         "showEasing" => "swing",
                         "hideEasing"=> "linear",
                         "showMethod" => "fadeIn",
                         "hideMethod" => "fadeOut"  ] );
              return $user;
           }else{
             Toastr::error("Error al crear el Usuario Empresa", "Usuario..", $options = [] );
           }
       }else{
            Toastr::error("No se pudo crear el Usuario Empresa.", "Usuario.", $options = [] );
       }

    }




}
