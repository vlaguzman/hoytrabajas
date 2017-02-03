<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Filesystem\Filesystem;
use App\DataTables\ChatDataTable;
use App\Http\Requests;
use App\Http\Requests\CreateChatRequest;
use App\Http\Requests\UpdateChatRequest;
use App\Repositories\ChatRepository;
use Flash;
use App\Http\Controllers\AppBaseController;
use Response;
use Carbon\Carbon;
use App\User;
use App\Models\Postulacion;
use App\Models\Usuario;
use App\Models\Candidato;
use App\Models\Empleador;
use App\Models\Mensaje;
use App\Models\Oferta;



class ChatController extends AppBaseController
{
    /** @var  ChatRepository */
    private $chatRepository;

    public function __construct(ChatRepository $chatRepo)
    {
        $this->chatRepository = $chatRepo;
    }


    public function vchat()
    {
        $validar=$this->getFechaSys();
        $id_usr=Auth::user()->id;
        $tipo_=Auth::user()->perfil_id;
        $lista="";
        if($tipo_==2 ){
          $obj=Empleador::where([ ['user_id', '=',$id_usr] ] )->first();
          $prop_ =$obj->id;
            $lista  = Postulacion::select('users.id','users.url_imagen','candidatos.nombres as des','candidatos.created_at',
                    'candidatos.correo','candidatos.descripcion','candidatos.telefono' )
                      ->where([ ['ofertas.empleador_id', '=',$prop_ ] ] )
                      ->whereIn('postulaciones.estatus_id', [1, 2])
                      ->join('ofertas','postulaciones.oferta_id','=','ofertas.id')
                      ->join('candidatos','postulaciones.candidato_id','=','candidatos.id')
                      ->join('users','candidatos.user_id','=','users.id')
                      ->distinct('users.id')
                      ->orderBy('nombres', 'asc')->get();

       }else if($tipo_==3 ){
            $obj=Candidato::where([ ['user_id', '=',$id_usr] ] )->first();
            $prop_ =$obj->id;
              $lista  = Postulacion::select('users.id','users.url_imagen','empleadores.empresa as des','empleadores.created_at',
                       'empleadores.correo','empleadores.descripcion','empleadores.telefono' )
                        ->where([ ['postulaciones.candidato_id', '=',$prop_ ] ] )
                        ->whereIn('postulaciones.estatus_id', [1, 2])
                        ->join('ofertas','postulaciones.oferta_id','=','ofertas.id')
                        ->join('empleadores','ofertas.empleador_id','=','empleadores.id')
                        ->join('users','empleadores.user_id','=','users.id')
                        ->distinct('users.id')
                        ->orderBy('empresa', 'asc')->get();
       }
       $historico=null;
       $ofertas=null;
        return view('zvistas.chat')
                ->with('usuarios', $lista)
                ->with('chat_with', 'n')
                ->with('chat_with_id', '0')
                ->with('inicio', true)
                ->with('ofertas', $ofertas)
                ->with('historico', $historico);
    }

    public function historico($id){
        Carbon::setLocale(config('app.locale'));
        $de_=$id;
        $validar=$this->getFechaSys();
        $id_usr=Auth::user()->id;
        $tipo_=Auth::user()->perfil_id;
        $lista="";
        $ofertas="";
        if($tipo_==2 ){
             $obj=Empleador::where([ ['user_id', '=',$id_usr] ] )->first();
             $prop_=$obj->id;
            $lista  = Postulacion::select('users.id','users.url_imagen','candidatos.nombres as des','candidatos.created_at',
                        'candidatos.correo','candidatos.descripcion','candidatos.telefono' )
                        ->where([ ['ofertas.empleador_id', '=',$prop_ ] ] )
                        ->whereIn('postulaciones.estatus_id', [1, 2])
                        ->join('ofertas','postulaciones.oferta_id','=','ofertas.id')
                        ->join('candidatos','postulaciones.candidato_id','=','candidatos.id')
                        ->join('users','candidatos.user_id','=','users.id')
                        ->distinct('users.id')
                        ->orderBy('nombres', 'asc')->get();

            $obj=Candidato::where([ ['user_id', '=',$de_] ] )->first();
            $cw_=' Con '.$obj->nombres.' '.$obj->apellidos;
            $validar=$this->getFechaSys();
            $ofertas =Oferta::where([ ['empleador_id', '=',$prop_ ],['desde', '<=',$validar ],['hasta', '>=',$validar ] ] )->orderBy('created_at', 'desc')->get();

        }else if($tipo_==3 ){
             $obj=Candidato::where([ ['user_id', '=',$id_usr] ] )->first();
             $prop_=$obj->id;
               $lista  = Postulacion::select('users.id','users.url_imagen','empleadores.empresa as des','empleadores.created_at',
                             'empleadores.correo','empleadores.descripcion','empleadores.telefono' )
                             ->where([ ['postulaciones.candidato_id', '=',$prop_ ] ] )
                             ->whereIn('postulaciones.estatus_id', [1, 2])
                             ->join('ofertas','postulaciones.oferta_id','=','ofertas.id')
                             ->join('empleadores','ofertas.empleador_id','=','empleadores.id')
                             ->join('users','empleadores.user_id','=','users.id')
                             ->distinct('users.id')
                             ->orderBy('empresa', 'asc')->get();
               $obj=Empleador::where([ ['user_id', '=',$de_] ] )->first();
               $cw_=' Con '.$obj->contacto.'--> '.$obj->empresa;
        }

        $a  = Mensaje::select('mensajes.id','mensajes.mensaje','mensajes.deuser_id','mensajes.parauser_id','mensajes.leido',
                      'mensajes.created_at','mensajes.updated_at','users.url_imagen','users.name' )
                      ->where([ ['mensajes.parauser_id', '=', $id_usr  ] ] )
                      ->where([ ['mensajes.deuser_id', '=', $de_    ] ] )
                      ->join('users','mensajes.deuser_id','=','users.id');

       $b  = Mensaje::select('mensajes.id','mensajes.mensaje','mensajes.deuser_id','mensajes.parauser_id','mensajes.leido',
                    'mensajes.created_at','mensajes.updated_at','users.url_imagen','users.name' )
                    ->where([ ['mensajes.parauser_id', '=', $de_    ] ] )
                    ->where([ ['mensajes.deuser_id', '=', $id_usr   ] ] )
                    ->join('users','mensajes.deuser_id','=','users.id');
        $historico= $a->union($b)->orderBy('created_at', 'asc')->get();
        return view('zvistas.chat')
                ->with('inicio', false)
                ->with('usuarios', $lista)
                ->with('chat_with', $cw_)
                ->with('chat_with_id', $id)
                ->with('ofertas', $ofertas)
                ->with('historico', $historico);
    }

    public function enviarmensaje(Request $request){
           Carbon::setLocale(config('app.locale'));
           date_default_timezone_set('America/Bogota');
           $de_      = Auth::user()->id;
           $para_    = $request->input('para');
           $msg_     = $request->input('msg');
           $obj_para = Usuario::where([ ['id', '=',$para_] ] )->first();
      		 if (!empty($obj_para)) {
                $ruta_destino = public_path('/images/system_imgs/chats/'.$para_.'/');
              //  Filesystem::makeDirectory($ruta_destino);
                $obj = Mensaje::create([
                						'deuser_id' => intval($de_),
                						'parauser_id' => intval($para_),
                						'mensaje' => $msg_,
                						'recivido'=> 0,
                						'leido'=> 0,
          			       ]);
          			if($obj){
                  //$carbon = new Carbon($obj->created_at, 'America/Bogota');
                  $RP="<div class='activity-row activity-row1'  >
                         <div class='col-xs-3 activity-img'>
                             <img src='". Auth::user()->url_imagen ."' class='img-responsive avatarxx1' />
                             <span>". date('H:i')  ."</span>
                         </div>
                        <div class='col-xs-5 activity-img1'>
                          <div class='activity-desc-sub'>
                             <h5>". Auth::user()->name ."</h5>
                             <p> ".  $msg_ ."</p>
                          </div>
                       </div>
                      <div class='col-xs-4 activity-desc1'></div>
                      <div class='clearfix'> </div>
                   </div>";
          				 return $RP;
          			}
            }
          $RP="<div class='activity-row activity-row1'  >
                    <div class='col-xs-3 activity-img'>
                        <img src='". Auth::user()->url_imagen ."' class='img-responsive avatarxx1' />
                        <span>". date('H:i')  ."</span>
                    </div>
                   <div class='col-xs-5 activity-img1'>
                     <div class='activity-desc-sub'>
                        <h5>". Auth::user()->name ."</h5>
                        <p> Mensaje no enviado </p>
                     </div>
                  </div>
                 <div class='col-xs-4 activity-desc1'></div>
                 <div class='clearfix'> </div>
              </div>";
        return $RP;
    }

    public function enviaroferta(Request $request){
           Carbon::setLocale(config('app.locale'));
           date_default_timezone_set('America/Bogota');
           $de_      = Auth::user()->id;
           $para_    = $request->input('para');
           $id_oferta_     = $request->input('id');
           $obj_para = Usuario::where([ ['id', '=',$para_] ] )->first();
           $msg_='Te invito a ver esta oferta de empleo <br/><a class="button button-block btn-system03"  href="../../ofertas/'. $id_oferta_.'"  >Ir a la oferta</a>';
           if (!empty($obj_para)) {

                $obj = Mensaje::create([
                            'deuser_id' => intval($de_),
                            'parauser_id' => intval($para_),
                            'mensaje' => $msg_,
                            'recivido'=> 0,
                            'leido'=> 0,
                       ]);
                if($obj){

                  $RP="<div class='activity-row activity-row1'  >
                         <div class='col-xs-3 activity-img'>
                             <img src='". Auth::user()->url_imagen ."' class='img-responsive avatarxx1' />
                             <span>". date('H:i')  ."</span>
                         </div>
                        <div class='col-xs-5 activity-img1'>
                          <div class='activity-desc-sub'>
                             <h5>". Auth::user()->name ."</h5>
                             <p> ".  $msg_ ."</p>
                          </div>
                       </div>
                      <div class='col-xs-4 activity-desc1'></div>
                      <div class='clearfix'> </div>
                   </div>";
                   return $RP;
                }
            }
          $RP="<div class='activity-row activity-row1'  >
                    <div class='col-xs-3 activity-img'>
                        <img src='". Auth::user()->url_imagen ."' class='img-responsive avatarxx1' />
                        <span>". date('H:i')  ."</span>
                    </div>
                   <div class='col-xs-5 activity-img1'>
                     <div class='activity-desc-sub'>
                        <h5>". Auth::user()->name ."</h5>
                        <p> Oferta no enviada </p>
                     </div>
                  </div>
                 <div class='col-xs-4 activity-desc1'></div>
                 <div class='clearfix'> </div>
              </div>";
        return $RP;
    }





    public function recibirmensaje(Request $request){
       Carbon::setLocale(config('app.locale'));
        $de_ = $request->input('de');
        //$de_="10";
        if($de_==""){
          return "";
        }
        $validar=$this->getFechaSys();
        $id_usr=Auth::user()->id;
        $tipo_=Auth::user()->perfil_id;
        $lista="";
        $RP = "";
        /*$historico = DB::select( DB::raw("SELECT M.id,M.mensaje,M.deuser_id,M.parauser_id,M.created_at,M.leido,M.updated_at,U.url_imagen,U.name
          					  FROM mensajes M,users U
          		        WHERE M.parauser_id='". $id_usr  ."' and M.deuser_id='". $de_  ."' and M.recivido=0 AND  M.deuser_id=U.id  Order by M.created_at") );*/

      $historico  = Mensaje::select('mensajes.id','mensajes.mensaje','mensajes.deuser_id','mensajes.parauser_id','mensajes.leido',
                    'mensajes.created_at','mensajes.updated_at','users.url_imagen','users.name' )
                    ->where([ ['mensajes.parauser_id', '=', $id_usr  ] ] )
                    ->where([ ['mensajes.deuser_id', '=', $de_    ] ] )
                    ->where([ ['mensajes.recivido', '=', 0    ] ] )
                    ->join('users','mensajes.deuser_id','=','users.id')
                    ->orderBy('created_at', 'asc')->get();


          foreach($historico as $item){
              $carbon = new Carbon($item->created_at, 'America/Bogota');
              $RP .= "<div class='activity-row activity-row1'>
                 <div class='col-xs-2 activity-desc1'></div>
                 <div class='col-xs-7 activity-img2'>
                   <div class='activity-desc-sub1'>
                     <h5>". $item->name ."</h5>
                     <p>". $item->mensaje ."</p>
                   </div>
                 </div>
                 <div class='col-xs-3 activity-img'><img src='". $item->url_imagen ."' class='img-responsive avatarxx1' /><span>". $carbon->diffForHumans()  ."</span></div>
                 <div class='clearfix'> </div>
                </div>";
                $obj_msg = Mensaje::where([ ['id', '=', $item->id ] ] )->first();
                $obj_msg->recivido=1;
                $obj_msg->save();
              //$response .= "<option value='". $card->pkcreditcard."'>". $card->creditcard_type .' ' . substr($card->creditcard_numbercard, -4) ."</option>";
           }
           return $RP;



    }

    public function marcarnotificacionesleidas(Request $request){
          return Mensaje::NotificacionesLeer( Auth::user()->id );
    }


    public function enviarfoto(Request $request){
      		 $file=asset('/images/no-picture.jpg');
      		 $id_ = $request->input('id');
      		/* $usuario=Usuario::find($id_);
      		 if (!empty($usuario)) {
          			$image = $request->file('image');
          			$ruta_destino = public_path('/images/system_imgs/chats/');
          			$img =  Image::make($image->getRealPath());
          			$ruta_img=$ruta_destino."puser_".$id_.'.'.$image->getClientOriginalExtension();
          			$img_local='/images/system_imgs/chats/puser_'.$id_.'.'.$image->getClientOriginalExtension();
                $img->resize(200, 200)->save($ruta_img);
          			$file =asset($img_local);
          			$usuario->url_imagen = $file;
          		  $usuario->save();
          			Toastr::info("Imagen de perfil actualizada", "Perfil", $options = [] );
          			return "Imagen de perfil actualizada";
            }
      		  Toastr::info("No se pudo cargar la imagen", "Perfil", $options = [] );
      	    return "No se pudo cargar la imagen";*/
    }


    /**
     * Display a listing of the Chat.
     *
     * @param ChatDataTable $chatDataTable
     * @return Response
     */
    public function index(ChatDataTable $chatDataTable)
    {
        return $chatDataTable->render('chats.index');
    }

    /**
     * Show the form for creating a new Chat.
     *
     * @return Response
     */
    public function create()
    {
        return view('chats.create');
    }

    /**
     * Store a newly created Chat in storage.
     *
     * @param CreateChatRequest $request
     *
     * @return Response
     */
    public function store(CreateChatRequest $request)
    {
        $input = $request->all();

        $chat = $this->chatRepository->create($input);

        Flash::success('Chat saved successfully.');

        return redirect(route('chats.index'));
    }

    /**
     * Display the specified Chat.
     *
     * @param  int $id
     *
     * @return Response
     */
    public function show($id)
    {
        $chat = $this->chatRepository->findWithoutFail($id);

        if (empty($chat)) {
            Flash::error('Chat not found');

            return redirect(route('chats.index'));
        }

        return view('chats.show')->with('chat', $chat);
    }

    /**
     * Show the form for editing the specified Chat.
     *
     * @param  int $id
     *
     * @return Response
     */
    public function edit($id)
    {
        $chat = $this->chatRepository->findWithoutFail($id);

        if (empty($chat)) {
            Flash::error('Chat not found');

            return redirect(route('chats.index'));
        }

        return view('chats.edit')->with('chat', $chat);
    }

    /**
     * Update the specified Chat in storage.
     *
     * @param  int              $id
     * @param UpdateChatRequest $request
     *
     * @return Response
     */
    public function update($id, UpdateChatRequest $request)
    {
        $chat = $this->chatRepository->findWithoutFail($id);

        if (empty($chat)) {
            Flash::error('Chat not found');

            return redirect(route('chats.index'));
        }

        $chat = $this->chatRepository->update($request->all(), $id);

        Flash::success('Chat updated successfully.');

        return redirect(route('chats.index'));
    }

    /**
     * Remove the specified Chat from storage.
     *
     * @param  int $id
     *
     * @return Response
     */
    public function destroy($id)
    {
        $chat = $this->chatRepository->findWithoutFail($id);

        if (empty($chat)) {
            Flash::error('Chat not found');

            return redirect(route('chats.index'));
        }

        $this->chatRepository->delete($id);

        Flash::success('Chat deleted successfully.');

        return redirect(route('chats.index'));
    }

    private function getFechaSys(){
         date_default_timezone_set('America/Bogota');
         $fecha_ = date("Y-m-d", time());
         $hora_=  date("H:i:s", time());
         return $fecha_.$hora_;
     }
}
