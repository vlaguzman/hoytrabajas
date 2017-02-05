<?php

namespace App\Http\Controllers;

use App\DataTables\CandidatoDataTable;
use App\Http\Requests;
use Illuminate\Http\Request;
use narutimateum\Toastr\Facades\Toastr;
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

use App\Util;

class CandidatoController extends AppBaseController
{
    /** @var  CandidatoRepository */
    private $candidatoRepository;
	private $options = ["progressBar" => false,
                         "positionClass" =>"toast-top-right",
                         "preventDuplicates"=> false,
                         "showDuration" => 300,
                         "hideDuration" => 3000,
                         "timeOut" => 5000,
                         "extendedTimeOut" => 1000,
                         "showEasing" => "swing",
                         "hideEasing"=> "linear",
                         "showMethod" => "fadeIn",
                         "hideMethod" => "fadeOut"  ];

    public function __construct(CandidatoRepository $candidatoRepo)
    {
        $this->candidatoRepository = $candidatoRepo;
    }


    public function filtrar(Request $request){
          $nom  = Util::getValor( $request->input('nombre') );
          $exp  = Util::getValor( $request->input('exp')    );
          $fna  = Util::getValor( $request->input('fnac')   );
          $nom_ ="";
          $parametros=array();
          if($nom !="" ){
              $nom_ = $nom."%";
          }
          if($exp>0){
             $parametros= array( array("experiencia",">=", $exp ) );
          }
          if($fna !="" ){
              $fna_  = date("Y-m-d", strtotime( $fna ) );
              $parametros= array( array("fnac",">=", $fna_ ) );
          }

        $lista  = Candidato::select('candidatos.id','candidatos.nombres','candidatos.apellidos','candidatos.telefono',
        		     'candidatos.correo','candidatos.descripcion','candidatos.direccion','candidatos.experiencia',
        			   'candidatos.rate','candidatos.fnac','candidatos.created_at as ago',
        			   'users.id as userid','users.url_imagen','users.email as usuario',
        			   'ciudades.descripcion as des_ciudad','generos.descripcion as des_genero')
        			   ->where([ ['nombres', 'like',$nom_  ] ] )
        			   ->where($parametros)
                 ->join('users','candidatos.user_id','=','users.id')
                 ->join('ciudades','candidatos.ciudad_id','=','ciudades.id')
        			   ->join('generos','candidatos.genero_id','=','generos.id')
        		     ->orderBy('rate', 'desc')->orderBy('candidatos.created_at', 'asc')->get();

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

        $this->candidatoRepository->create($input);

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
            Toastr::info("Candidato no encontrado", "No encontrado", $this->options  );
            return redirect()->intended('/home');
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

        $this->candidatoRepository->update($request->all(), $id);

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
