<?php

namespace App\Http\Controllers;

use App\DataTables\PostulacionDataTable;
use App\Http\Requests;
use Illuminate\Support\Facades\Auth;
use App\Http\Requests\CreatePostulacionRequest;
use App\Http\Requests\UpdatePostulacionRequest;
use App\Repositories\PostulacionRepository;
use Flash;
use App\Http\Controllers\AppBaseController;
use Response;
use Illuminate\Support\Facades\Mail;
use App\Mail\AceptadoMail;

use narutimateum\Toastr\Facades\Toastr;
use App\Models\Oferta;
use App\Models\Postulacion;
use App\Models\Candidato;
use App\Models\Empleador;
use App\Models\Mensaje;
use App\User;

class PostulacionController extends AppBaseController
{
    /** @var  PostulacionRepository */
    private $postulacionRepository;

    public function __construct(PostulacionRepository $postulacionRepo)
    {
        $this->postulacionRepository = $postulacionRepo;
    }

    public function verificar($id_){
        $id_usr=Auth::user()->id;
        $obj=Candidato::where([ ['user_id', '=',$id_usr] ] )->first();
        if($obj){
            $emp_ =$obj->id;
            $postulacion=Postulacion::where([ ['oferta_id', '=', $id_ ],['candidato_id', '=',$emp_  ]   ] )->first();
            if (!empty($postulacion)) {
                return true;
            }
        }
        return false;
    }

    public function registrar($id_){
        $id_usr=Auth::user()->id;
        $url_perfil=Auth::user()->url_imagen;
        $obj=Candidato::where([ ['user_id', '=',$id_usr] ] )->first();
        if($obj){
            $emp_ =$obj->id;
            $postulacion=Postulacion::where([ ['oferta_id', '=', $id_ ],['candidato_id', '=',$emp_  ]   ] )->first();
            if (!empty($postulacion)) {
                Toastr::error("Ya tienes una postulacion pendiente para etsa oferta", "Duplicado", $options = [] );
            }else{
                $obj = Postulacion::create([
                        'estatus_id' => 1,
                        'oferta_id' => intval($id_),
                        'candidato_id' => intval($emp_),
                         ]);
                if(!empty($obj)  ){
                     $obj1=Oferta::where([ ['id', '=',$id_] ] )->first();
                     $obj2=Empleador::where([ ['id', '=',$obj1->empleador_id ] ] )->first();
                     $user=User::where([ ['id', '=',$obj2->user_id ] ] )->first();
                     Mensaje::Notificacion($user->id, 'Nueva postulacion','candidato','Se ha postulado un nuevo candidato para tu publicacion',$emp_,$url_perfil );
                     Toastr::success("Postulado exitosamente!", "Prcoesado", $options = [] );
                }else{
                    Toastr::error("No se pudo procesar la postulacion, intente mas tarde", "Error...", $options = [] );
                }
            }
        }else{
           Toastr::error("Opcion solo disponible para candidatos ", "Error...", $options = [] );
        }

        return back()->withInput();
     }
   public function aprobar($id_){
        $postulacion=Postulacion::find($id_);
          if (!empty($postulacion)) {
             $postulacion->estatus_id=2;
             if($postulacion->save()){
                 $obj=Candidato::where([ ['id', '=',$postulacion->candidato_id] ] )->first();
        				 $user=User::where([ ['id', '=',$obj->user_id ] ] )->first();
        				 Mail::to($user->email)->send(new AceptadoMail($user));
                 Mensaje::Notificacion($user->id,'Postulacion aceptada','oferta','Has sido aceptado para una postulacion',$postulacion->oferta_id,'http://www.hoytrabajas.com/htw/public/images/aceptar.png' );
        				 Toastr::info("Empleado Aceptado!", "Prcoesado", $options = ["progressBar" => false,
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
                 return back()->withInput();
             }
        }
        Toastr::error("No se pudo procesar la postulacion id='". $id_ ."', intente mas tarde", "Error...", $options = [] );
        return back()->withInput();
    }
  public function rechazar($id_){
      $postulacion=Postulacion::find($id_);
        if (!empty($postulacion)) {
            $postulacion->estatus_id=3;
            if($postulacion->save()){
                  $obj=Candidato::where([ ['id', '=',$postulacion->candidato_id] ] )->first();
                  $user=User::where([ ['id', '=',$obj->user_id ] ] )->first();
                  Mensaje::Notificacion($user->id,'Postulacion rechazada','oferta','Has sido rechazado para una postulacion',$postulacion->oferta_id,'http://www.hoytrabajas.com/htw/public/images/rechazar.png' );
                  Toastr::success("Empleado rechazado!", "Prcoesado", $options = [] );
                  return back()->withInput();
            }
       }
      Toastr::error("No se pudo procesar la postulacion, intente mas tarde", "Error...", $options = [] );
      return back()->withInput();
   }


    /**
     * Display a listing of the Postulacion.
     *
     * @param PostulacionDataTable $postulacionDataTable
     * @return Response
     */
    public function index(PostulacionDataTable $postulacionDataTable)
    {
        return $postulacionDataTable->render('postulacions.index');
    }

    /**
     * Show the form for creating a new Postulacion.
     *
     * @return Response
     */
    public function create()
    {
        return view('postulacions.create');
    }

    /**
     * Store a newly created Postulacion in storage.
     *
     * @param CreatePostulacionRequest $request
     *
     * @return Response
     */
    public function store(CreatePostulacionRequest $request)
    {
        $input = $request->all();

        $postulacion = $this->postulacionRepository->create($input);

        Flash::success('Postulacion saved successfully.');

        return redirect(route('postulacions.index'));
    }

    /**
     * Display the specified Postulacion.
     *
     * @param  int $id
     *
     * @return Response
     */
    public function show($id)
    {
        $postulacion = $this->postulacionRepository->findWithoutFail($id);

        if (empty($postulacion)) {
            Flash::error('Postulacion not found');

            return redirect(route('postulacions.index'));
        }

        return view('postulacions.show')->with('postulacion', $postulacion);
    }

    /**
     * Show the form for editing the specified Postulacion.
     *
     * @param  int $id
     *
     * @return Response
     */
    public function edit($id)
    {
        $postulacion = $this->postulacionRepository->findWithoutFail($id);

        if (empty($postulacion)) {
            Flash::error('Postulacion not found');

            return redirect(route('postulacions.index'));
        }

        return view('postulacions.edit')->with('postulacion', $postulacion);
    }

    /**
     * Update the specified Postulacion in storage.
     *
     * @param  int              $id
     * @param UpdatePostulacionRequest $request
     *
     * @return Response
     */
    public function update($id, UpdatePostulacionRequest $request)
    {
        $postulacion = $this->postulacionRepository->findWithoutFail($id);

        if (empty($postulacion)) {
            Flash::error('Postulacion not found');

            return redirect(route('postulacions.index'));
        }

        $postulacion = $this->postulacionRepository->update($request->all(), $id);

        Flash::success('Postulacion updated successfully.');

        return redirect(route('postulacions.index'));
    }

    /**
     * Remove the specified Postulacion from storage.
     *
     * @param  int $id
     *
     * @return Response
     */
    public function destroy($id)
    {
        $postulacion = $this->postulacionRepository->findWithoutFail($id);

        if (empty($postulacion)) {
            Flash::error('Postulacion not found');

            return redirect(route('postulacions.index'));
        }

        $this->postulacionRepository->delete($id);

        Flash::success('Postulacion deleted successfully.');

        return redirect(route('postulacions.index'));
    }
}
