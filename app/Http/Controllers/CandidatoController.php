<?php

namespace App\Http\Controllers;

use App\DataTables\CandidatoDataTable;
use App\Http\Requests;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

use App\Http\Requests\CreateCandidatoRequest;
use App\Http\Requests\UpdateCandidatoRequest;
use App\Repositories\CandidatoRepository;
use Flash;
use App\Http\Controllers\AppBaseController;
use Response;
use App\Models\Candidato;
use App\Models\SectorCandidato;
use App\Models\EstudioCandidato;
use App\Models\IdiomaCandidato;



class CandidatoController extends AppBaseController
{
    /** @var  CandidatoRepository */
    private $candidatoRepository;

    public function __construct(CandidatoRepository $candidatoRepo)
    {
        $this->candidatoRepository = $candidatoRepo;
    }


    public function filtrar(Request $request){
          $nom  = $request->input('nombre');
          $exp  = $request->input('exp');
          $fna  = date("Y-m-d", strtotime( $request->input('fnac') ) );
          $parametros=array();
          $crits_="";

          if($nom !="" ){
              $crits_ = " AND E.nombres like ''". $nom."%' ";
          }
          if($exp>0){
             $crits_ = " AND E.experiencia >= ". $exp ." ";
          }
          /*if($fna){
             $parametros= array( array("fnac",">=", $fna ) );
          }*/
          /*$lst = $request->input('lsgeneros');
          if( $lst !=null){
              $generos=array();
             foreach( $lst as $selected_id){
                 $generos= array($selected_id);
             }
             $parametros= array( array("genero_id","in", $generos ) );
          }*/

          /*$lista= Candidato::where([ ['nombres', 'like',$nom ] ] )
		            ->where($parametros)
		            ->orderBy('rate', 'desc')->get();*/
        /*  $lista= Candidato::where([ ['nombres', 'like', $nom ] ] )
      		            ->orderBy('rate', 'desc')->get();*/
          $lista = DB::select( DB::raw("SELECT E.id,E.nombres,E.apellidos,E.created_at as ago,
                  U.url_imagen,E.telefono,E.correo,E.descripcion,E.experiencia,E.rate
                  FROM candidatos E,users U
                  WHERE E.user_id=U.id  ". $crits_  ." ORDER BY E.rate DESC, E.created_at ASC  ") );

          return view('zvistas.listaempleados')
                     ->with('p1',  $nom )
                      ->with('empleados',  $lista );

    }

    /**
     * Display a listing of the Candidato.
     *
     * @param CandidatoDataTable $candidatoDataTable
     * @return Response
     */
    public function index(CandidatoDataTable $candidatoDataTable)
    {
        return $candidatoDataTable->render('candidatos.index');
    }

    /**
     * Show the form for creating a new Candidato.
     *
     * @return Response
     */
    public function create()
    {
        return view('candidatos.create');
    }

    /**
     * Store a newly created Candidato in storage.
     *
     * @param CreateCandidatoRequest $request
     *
     * @return Response
     */
    public function store(CreateCandidatoRequest $request)
    {
        $input = $request->all();

        $candidato = $this->candidatoRepository->create($input);

        Flash::success('Candidato saved successfully.');

        return redirect(route('candidatos.index'));
    }

    /**
     * Display the specified Candidato.
     *
     * @param  int $id
     *
     * @return Response
     */
    public function show($id)
    {
        $candidato = $this->candidatoRepository->findWithoutFail($id);

        if (empty($candidato)) {
            Flash::error('Candidato not found');

            return redirect(route('candidatos.index'));
        }
        $lista1  = SectorCandidato::select(array('sectores.descripcion'   ))
                          ->leftJoin('sectores','sectores_candidatos.sector_id','=','sectores.id')
                          ->where([ ['candidato_id', '=',$candidato->id ] ] )
                          ->orderBy('sectores_candidatos.created_at', 'desc')->get();
       $lista2  = IdiomaCandidato::select(array('idiomas.descripcion'   ))
                          ->leftJoin('idiomas','idiomas_candidatos.idioma_id','=','idiomas.id')
                          ->where([ ['candidato_id', '=',$candidato->id ] ] )
                          ->orderBy('idiomas_candidatos.created_at', 'desc')->get();
       $lista3  = EstudioCandidato::select(array('estudios.descripcion'   ))
                          ->leftJoin('estudios','estudios_candidatos.estudio_id','=','estudios.id')
                          ->where([ ['candidato_id', '=',$candidato->id ] ] )
                          ->orderBy('estudios_candidatos.created_at', 'desc')->get();
        return view('candidatos.show')
              ->with('intereses', $lista1)
              ->with('idiomas', $lista2)
              ->with('estudios', $lista3)
              ->with('candidato', $candidato);
    }

    /**
     * Show the form for editing the specified Candidato.
     *
     * @param  int $id
     *
     * @return Response
     */
    public function edit($id)
    {
        $candidato = $this->candidatoRepository->findWithoutFail($id);

        if (empty($candidato)) {
            Flash::error('Candidato not found');

            return redirect(route('candidatos.index'));
        }

        return view('candidatos.edit')->with('candidato', $candidato);
    }

    /**
     * Update the specified Candidato in storage.
     *
     * @param  int              $id
     * @param UpdateCandidatoRequest $request
     *
     * @return Response
     */
    public function update($id, UpdateCandidatoRequest $request)
    {
        $candidato = $this->candidatoRepository->findWithoutFail($id);

        if (empty($candidato)) {
            Flash::error('Candidato not found');

            return redirect(route('candidatos.index'));
        }

        $candidato = $this->candidatoRepository->update($request->all(), $id);

        Flash::success('Candidato updated successfully.');

        return redirect(route('candidatos.index'));
    }

    /**
     * Remove the specified Candidato from storage.
     *
     * @param  int $id
     *
     * @return Response
     */
    public function destroy($id)
    {
        $candidato = $this->candidatoRepository->findWithoutFail($id);

        if (empty($candidato)) {
            Flash::error('Candidato not found');

            return redirect(route('candidatos.index'));
        }

        $this->candidatoRepository->delete($id);

        Flash::success('Candidato deleted successfully.');

        return redirect(route('candidatos.index'));
    }
}
