<?php

namespace App\Http\Controllers;

use App\DataTables\MembresiaEmpleadorDataTable;
use Illuminate\Support\Facades\Auth;
use App\Http\Requests;
use App\Http\Requests\CreateMembresiaEmpleadorRequest;
use App\Http\Requests\UpdateMembresiaEmpleadorRequest;
use App\Repositories\MembresiaEmpleadorRepository;
use Flash;
use App\Http\Controllers\AppBaseController;
use Response;
use narutimateum\Toastr\Facades\Toastr;

use App\Models\Membresia;
use App\Models\MembresiaPrecio;
use App\Models\MembresiaEmpleador;
use App\Models\Empleador;
use App\Models\Genero;
use App\Models\Sector;
use App\Models\Estudio;
use App\Models\Idioma;
use App\Models\Ciudad;

class MembresiaEmpleadorController extends AppBaseController
{
    /** @var  MembresiaEmpleadorRepository */
    private $membresiaEmpleadorRepository;

    public function __construct(MembresiaEmpleadorRepository $membresiaEmpleadorRepo)
    {
        $this->membresiaEmpleadorRepository = $membresiaEmpleadorRepo;
    }
    private function getFechaSys(){
        date_default_timezone_set('America/Bogota');
        $fecha_ = date("Y-m-d", time());
        $hora_=  date("H:i:s", time());
        return $fecha_.$hora_;
    }
     public function registrar(){
           $id_usr=Auth::user()->id;
           $obj=Empleador::where([ ['user_id', '=',$id_usr] ] )->first();
           $id=$obj->id;
           $validar=$this->getFechaSys();
           $generos      = Genero::orderBy('descripcion')->pluck('descripcion', 'id');
           $sectores     = Sector::orderBy('descripcion')->pluck('descripcion', 'id');
           $estudios     = Estudio::orderBy('descripcion')->pluck('descripcion', 'id');
           $idiomas      = Idioma::orderBy('descripcion')->pluck('descripcion', 'id');
           $ciudades     = Ciudad::orderBy('descripcion')->pluck('descripcion', 'id');
            $item= MembresiaEmpleador::where([ ['empleador_id', '=',$id ],['desde', '<=',$validar ],['hasta', '>=',$validar ] ] )->first();
            if ($item===false) {
                $membresia=Membresia::where([ ['empleador', '=', 1] ]   )->first();
                $id_membresia=$membresia->id;
                $item= MembresiaPrecio::where([ ['membresia_id', '=',$id_membresia ],['desde', '<=',$validar ],['hasta', '>=',$validar ] ] )->first();
                $hora_=  date("H:i:s", time());
                $desde_ = date("Y-m-d", time())." ".$hora_;
                $fecha = date('Y-m-j')." ".$hora_ ;
                $nuevafecha = strtotime ( '+'. $item->duracion .' day' , strtotime ( $fecha ) ) ;
                $hasta_ = date ( 'Y-m-j' , $nuevafecha )." ".$hora_;
                $precio_membresia=$item->precio;
                $obj = MembresiaEmpleador::create([
                      'pagado' =>$precio_membresia,
                      'empleador_id' => intval($id),
                      'membresia_id' => intval($id_membresia),
                      'desde' => $desde_,
                      'hasta' => $hasta_,
                      ]);
                    if($obj===true ){
                        return view('zvistas.buscarempleados')
                              ->with('generos',  $generos )
                              ->with('sectores',  $sectores )
                              ->with('estudios',  $estudios )
                              ->with('idiomas',  $idiomas )
                              ->with('ciudades',  $ciudades );
                    }
                return view('zvistas.membresia2')
                        ->with('afiliado', false )
                        ->with('msg', $precio_membresia );
           }else{
               return view('zvistas.buscarempleados')
                         ->with('generos',  $generos )
                         ->with('sectores',  $sectores )
                         ->with('estudios',  $estudios )
                         ->with('idiomas',  $idiomas )
                         ->with('ciudades',  $ciudades );
           }

          //return Redirect::back();
    }
    public function validar(){
          $validar=$this->getFechaSys();
          $id_usr=Auth::user()->id;
          $tipo_=Auth::user()->perfil_id;
          if($tipo_==2 ){
              $obj  = Empleador::where([ ['user_id', '=',$id_usr] ] )->first();
              $item = MembresiaEmpleador::where([ ['empleador_id', '=',$obj->id ],['desde', '<=',$validar ],['hasta', '>=',$validar ] ] )->first();
              if ($item) {
                      $generos      = Genero::orderBy('descripcion')->pluck('descripcion', 'id');
                      $sectores     = Sector::orderBy('descripcion')->pluck('descripcion', 'id');
                      $estudios     = Estudio::orderBy('descripcion')->pluck('descripcion', 'id');
                      $idiomas      = Idioma::orderBy('descripcion')->pluck('descripcion', 'id');
                      $ciudades     = Ciudad::orderBy('descripcion')->pluck('descripcion', 'id');
                     return view('zvistas.buscarempleados')
                             ->with('generos',  $generos )
                             ->with('sectores',  $sectores )
                             ->with('estudios',  $estudios )
                             ->with('idiomas',  $idiomas )
                             ->with('ciudades',  $ciudades );
              }else{//sin membresia
                   $membresia=Membresia::where([ ['empleador', '=', 1] ] )->first();
                   $id_membresia=$membresia->id;
                   $item= MembresiaPrecio::where([ ['membresia_id', '=',$id_membresia ],['desde', '<=',$validar ],['hasta', '>=',$validar ] ] )->first();
                   return view('zvistas.membresia2')
                         ->with('afiliado', false )
                         ->with('msg', $item->precio );
              }
          }
    }

    /**
     * Display a listing of the MembresiaEmpleador.
     *
     * @param MembresiaEmpleadorDataTable $membresiaEmpleadorDataTable
     * @return Response
     */
    public function index(MembresiaEmpleadorDataTable $membresiaEmpleadorDataTable)
    {
        return $membresiaEmpleadorDataTable->render('membresia_empleadors.index');
    }

    /**
     * Show the form for creating a new MembresiaEmpleador.
     *
     * @return Response
     */
    public function create()
    {
        return view('membresia_empleadors.create');
    }

    /**
     * Store a newly created MembresiaEmpleador in storage.
     *
     * @param CreateMembresiaEmpleadorRequest $request
     *
     * @return Response
     */
    public function store(CreateMembresiaEmpleadorRequest $request)
    {
        $input = $request->all();

        $this->membresiaEmpleadorRepository->create($input);

        Flash::success('Membresia Empleador saved successfully.');

        return redirect(route('membresiaEmpleadors.index'));
    }

    /**
     * Display the specified MembresiaEmpleador.
     *
     * @param  int $id
     *
     * @return Response
     */
    public function show($id)
    {
        $membresiaEmpleador = $this->membresiaEmpleadorRepository->findWithoutFail($id);

        if (empty($membresiaEmpleador)) {
            Flash::error('Membresia Empleador not found');

            return redirect(route('membresiaEmpleadors.index'));
        }

        return view('membresia_empleadors.show')->with('membresiaEmpleador', $membresiaEmpleador);
    }

    /**
     * Show the form for editing the specified MembresiaEmpleador.
     *
     * @param  int $id
     *
     * @return Response
     */
    public function edit($id)
    {
        $membresiaEmpleador = $this->membresiaEmpleadorRepository->findWithoutFail($id);

        if (empty($membresiaEmpleador)) {
            Flash::error('Membresia Empleador not found');

            return redirect(route('membresiaEmpleadors.index'));
        }

        return view('membresia_empleadors.edit')->with('membresiaEmpleador', $membresiaEmpleador);
    }

    /**
     * Update the specified MembresiaEmpleador in storage.
     *
     * @param  int              $id
     * @param UpdateMembresiaEmpleadorRequest $request
     *
     * @return Response
     */
    public function update($id, UpdateMembresiaEmpleadorRequest $request)
    {
        $membresiaEmpleador = $this->membresiaEmpleadorRepository->findWithoutFail($id);

        if (empty($membresiaEmpleador)) {
            Flash::error('Membresia Empleador not found');

            return redirect(route('membresiaEmpleadors.index'));
        }

        $membresiaEmpleador = $this->membresiaEmpleadorRepository->update($request->all(), $id);

        Flash::success('Membresia Empleador updated successfully.');

        return redirect(route('membresiaEmpleadors.index'));
    }

    /**
     * Remove the specified MembresiaEmpleador from storage.
     *
     * @param  int $id
     *
     * @return Response
     */
    public function destroy($id)
    {
        $membresiaEmpleador = $this->membresiaEmpleadorRepository->findWithoutFail($id);

        if (empty($membresiaEmpleador)) {
            Flash::error('Membresia Empleador not found');

            return redirect(route('membresiaEmpleadors.index'));
        }

        $this->membresiaEmpleadorRepository->delete($id);

        Flash::success('Membresia Empleador deleted successfully.');

        return redirect(route('membresiaEmpleadors.index'));
    }
}
