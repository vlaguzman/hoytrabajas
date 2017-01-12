<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Auth;
use App\DataTables\MembresiaCandidatoDataTable;
use App\Http\Requests;
use App\Http\Requests\CreateMembresiaCandidatoRequest;
use App\Http\Requests\UpdateMembresiaCandidatoRequest;
use App\Repositories\MembresiaCandidatoRepository;
use Flash;
use App\Http\Controllers\AppBaseController;
use Response;

use App\Models\Candidato;
use App\Models\Membresia;
use App\Models\MembresiaCandidato;
use App\Models\MembresiaPrecio;

class MembresiaCandidatoController extends AppBaseController
{
    /** @var  MembresiaCandidatoRepository */
    private $membresiaCandidatoRepository;

    public function __construct(MembresiaCandidatoRepository $membresiaCandidatoRepo)
    {
        $this->membresiaCandidatoRepository = $membresiaCandidatoRepo;
    }
    private function getFechaSys(){
        date_default_timezone_set('America/Bogota');
        $fecha_ = date("Y-m-d", time());
        $hora_=  date("H:i:s", time());
        return $fecha_.$hora_;
    }
     public function registrar(){
           $id_usr=Auth::user()->id;
           $obj=Candidato::where([ ['user_id', '=',$id_usr] ] )->first();
           $id=$obj->id;
           $validar=$this->getFechaSys();
           $hasta=date("Y-m-d", time());
           $item= MembresiaCandidato::where([ ['candidato_id', '=',$id ],['desde', '<=',$validar ],['hasta', '>=',$validar ] ] )->first();
           if ($item==false) {
                $membresia=Membresia::where([ ['candidato', '=', 1] ]   )->first();
                $id_membresia=$membresia->id;
                $item= MembresiaPrecio::where([ ['membresia_id', '=',$id_membresia ],['desde', '<=',$validar ],['hasta', '>=',$validar ] ] )->first();
                $hora_=  date("H:i:s", time());
                $desde_ = date("Y-m-d", time())." ".$hora_;
                $fecha = date('Y-m-j')." ".$hora_ ;
                $nuevafecha = strtotime ( '+'. $item->duracion .' day' , strtotime ( $fecha ) ) ;
                $hasta_ = date ( 'Y-m-j' , $nuevafecha )." ".$hora_;
                $hasta=$hasta_;
                $obj = MembresiaCandidato::create([
                      'pagado' => $item->precio,
                      'candidato_id' => intval($id),
                      'membresia_id' => intval($id_membresia),
                      'desde' => $desde_,
                      'hasta' => $hasta_,
                      ]);
                    if($obj){
                        //...
                    }
          }else{
              $hasta=$item->hasta;
          }
          $segundos=strtotime($hasta) - strtotime('now');
          $vigencia=intval($segundos/60/60/24);
             return view('zvistas.membresia3a')
                  ->with('afiliado', true )
                  ->with('msg', $vigencia );
    }



    /**
     * Display a listing of the MembresiaCandidato.
     *
     * @param MembresiaCandidatoDataTable $membresiaCandidatoDataTable
     * @return Response
     */
    public function index(MembresiaCandidatoDataTable $membresiaCandidatoDataTable)
    {
        return $membresiaCandidatoDataTable->render('membresia_candidatos.index');
    }

    /**
     * Show the form for creating a new MembresiaCandidato.
     *
     * @return Response
     */
    public function create()
    {
        return view('membresia_candidatos.create');
    }

    /**
     * Store a newly created MembresiaCandidato in storage.
     *
     * @param CreateMembresiaCandidatoRequest $request
     *
     * @return Response
     */
    public function store(CreateMembresiaCandidatoRequest $request)
    {
        $input = $request->all();

        $membresiaCandidato = $this->membresiaCandidatoRepository->create($input);

        Flash::success('Membresia Candidato saved successfully.');

        return redirect(route('membresiaCandidatos.index'));
    }

    /**
     * Display the specified MembresiaCandidato.
     *
     * @param  int $id
     *
     * @return Response
     */
    public function show($id)
    {
        $membresiaCandidato = $this->membresiaCandidatoRepository->findWithoutFail($id);

        if (empty($membresiaCandidato)) {
            Flash::error('Membresia Candidato not found');

            return redirect(route('membresiaCandidatos.index'));
        }

        return view('membresia_candidatos.show')->with('membresiaCandidato', $membresiaCandidato);
    }

    /**
     * Show the form for editing the specified MembresiaCandidato.
     *
     * @param  int $id
     *
     * @return Response
     */
    public function edit($id)
    {
        $membresiaCandidato = $this->membresiaCandidatoRepository->findWithoutFail($id);

        if (empty($membresiaCandidato)) {
            Flash::error('Membresia Candidato not found');

            return redirect(route('membresiaCandidatos.index'));
        }

        return view('membresia_candidatos.edit')->with('membresiaCandidato', $membresiaCandidato);
    }

    /**
     * Update the specified MembresiaCandidato in storage.
     *
     * @param  int              $id
     * @param UpdateMembresiaCandidatoRequest $request
     *
     * @return Response
     */
    public function update($id, UpdateMembresiaCandidatoRequest $request)
    {
        $membresiaCandidato = $this->membresiaCandidatoRepository->findWithoutFail($id);

        if (empty($membresiaCandidato)) {
            Flash::error('Membresia Candidato not found');

            return redirect(route('membresiaCandidatos.index'));
        }

        $membresiaCandidato = $this->membresiaCandidatoRepository->update($request->all(), $id);

        Flash::success('Membresia Candidato updated successfully.');

        return redirect(route('membresiaCandidatos.index'));
    }

    /**
     * Remove the specified MembresiaCandidato from storage.
     *
     * @param  int $id
     *
     * @return Response
     */
    public function destroy($id)
    {
        $membresiaCandidato = $this->membresiaCandidatoRepository->findWithoutFail($id);

        if (empty($membresiaCandidato)) {
            Flash::error('Membresia Candidato not found');

            return redirect(route('membresiaCandidatos.index'));
        }

        $this->membresiaCandidatoRepository->delete($id);

        Flash::success('Membresia Candidato deleted successfully.');

        return redirect(route('membresiaCandidatos.index'));
    }
}
