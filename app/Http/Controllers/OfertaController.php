<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use App\Http\Requests;
use App\DataTables\OfertaDataTable;
use App\Http\Requests\CreateOfertaRequest;
use App\Http\Requests\UpdateOfertaRequest;
use App\Repositories\OfertaRepository;
use App\Http\Controllers\AppBaseController;

use Flash;
use Response;
use Carbon\Carbon;
use Intervention\Image\ImageManagerStatic as Image;
use narutimateum\Toastr\Facades\Toastr;
use Appitventures\Phpgmaps\Phpgmaps;

use App\Models\Oferta;
use App\Models\Ciudad;
use App\Models\Sector;
use App\Models\Empleador;
use App\Models\Mensaje;
use App\Models\Postulacion;


class OfertaController extends AppBaseController
{
    /** @var  OfertaRepository */
    private $ofertaRepository;

    public function __construct(OfertaRepository $ofertaRepo)
    {
        $this->ofertaRepository = $ofertaRepo;
    }

    public function misofertas(){
        $id_usr=Auth::user()->id;
        $obj=Empleador::where([ ['user_id', '=',$id_usr] ] )->first();
        $prop_=$obj->id;
        $validar=$this->getFechaSys();
        $lista1 =Oferta::where([ ['empleador_id', '=',$prop_ ],['desde', '<=',$validar ],['hasta', '>=',$validar ] ] )
  		         ->orderBy('created_at', 'desc')->get();
        $lista2 = Oferta::where([ ['empleador_id', '=',$prop_ ], ['hasta', '<',$validar ] ] )
  				     ->orderBy('created_at', 'desc')->get();

        return view('zvistas.misofertas')
               ->with('ofertas1',  $lista1 )
               ->with('ofertas2',  $lista2 );
    }


    /*  funciones agregadas ... **/
      public function crearoferta(){
            $sectores     = Sector::orderBy('descripcion')->pluck('descripcion', 'id');
            $ciudades     = Ciudad::orderBy('descripcion')->pluck('descripcion', 'id');
            $url_img=asset('/images/ofertadef.png');

          return view('zvistas.crearoferta')
                ->with('url_img_', $url_img )
               ->with('sectores', $sectores )
               ->with('ciudades',  $ciudades );

      }

      public function registraroferta(Request $request){
          $id_usr=Auth::user()->id;
          $obj_e  = Empleador::where([ ['user_id', '=',$id_usr] ] )->first();
          $file=asset('/images/ofertadef.png');
          $image = $request->file('upload_img_');
          date_default_timezone_set('America/Bogota');
    			$hora_=  date("H:i:s", time());
    			$desde_ = date("Y-m-d", time())." ".$hora_;
    			$fecha = date('Y-m-j')." ".$hora_ ;
    			$nuevafecha = strtotime ( '+1 month' , strtotime ( $fecha ) ) ;
    			$hasta_ = date ( 'Y-m-j' , $nuevafecha )." ".$hora_;
          $obj = Oferta::create([
							'nombre' => $request->input('tit'),
							'descripcion' => $request->input('des'),
							'direccion' => $request->input('dire'),
							'paga' => $request->input('pago'),
							'desde' => date("Y-m-d H:i:s", strtotime( $desde_ )),
							'hasta' => date("Y-m-d H:i:s", strtotime( $hasta_ )),
							'url_imagen' => $file,
							'ciudad_id' => intval($request->input('ciudad')),
              'sector_id' => intval($request->input('sector')),
              'empleador_id' => intval($obj_e->id),
              'obs' => '',
              'lat' => $request->input('lat'),
              'lng' => $request->input('lng'),
              'bloqueada' => false,
				    ]);

        if($obj){
            Toastr::info("Oferta creada correctamente", "Procesado", $options = [] );
            $id_=$obj->id;
            $ruta_destino = public_path('/images/system_imgs/ofertas/');
            if($image!==null){
                $img =  Image::make($image->getRealPath());
                $ruta_img=$ruta_destino."ioferta_".$id_.'.'.$image->getClientOriginalExtension();
                $img_local='/images/system_imgs/ofertas/ioferta_'.$id_.'.'.$image->getClientOriginalExtension();
                $img->resize(400, 400)->save($ruta_img);
                $file =asset($img_local);
                $oferta= Oferta::find($id_);
                $oferta->url_imagen=$file;
                $oferta->save();
                Mensaje::NotificacionAll('Nueva oferta creada','oferta',$obj->descripcion,$obj->id,$oferta->url_imagen );
                Toastr::info("Imagen oferta agregada correctamente", "Procesado", $options = [] );
            }
         }else{
            Toastr::error("No se pudo procesar", "Error...", $options = [] );
         }
         return redirect(route('ofertas.index'));
      }
      public function actualizarFoto(Request $request){
             $file=asset('/images/ofertadef.png');
             $id_ = $request->input('id');
             $obj=Oferta::find($id_);
             if (!empty($obj)) {
                  $image = $request->file('image');
                  $ruta_destino = public_path('/images/system_imgs/ofertas/');
                  $img =  Image::make($image->getRealPath());
                  $ruta_img=$ruta_destino."ioferta_".$id_.'.'.$image->getClientOriginalExtension();
                  $img_local='/images/system_imgs/ofertas/ioferta_'.$id_.'.'.$image->getClientOriginalExtension();
                /*  $img->resize(300, 200, function ($constraint) {
                     $constraint->aspectRatio();
                  })->save($ruta_img);*/
                  $img->resize(400, 400)->save($ruta_img);
                  $file =asset($img_local);
                  $obj->url_imagen = $file;
                  $obj->save();
                  Toastr::info("Imagen de la oferta actualizada", "Oferta", $options = [] );
                  return "Imagen de la oferta actualizada";
              }
              Toastr::info("No se pudo cargar la imagen", "Oferta", $options = [] );
              return "No se pudo cargar la imagen";
      }


      private function getFechaSys(){
          date_default_timezone_set('America/Bogota');
          $fecha_ = date("Y-m-d", time());
          $hora_=  date("H:i:s", time());
          return $fecha_.$hora_;
      }
    /* ************************************  */
    /**
     * Display a listing of the Oferta.
     *
     * @param OfertaDataTable $ofertaDataTable
     * @return Response
     */
    public function index(OfertaDataTable $ofertaDataTable)
    {
        return $ofertaDataTable->render('ofertas.index');
    }

    /**
     * Show the form for creating a new Oferta.
     *
     * @return Response
     */
    public function create()
    {
        return view('ofertas.create');
    }

    /**
     * Store a newly created Oferta in storage.
     *
     * @param CreateOfertaRequest $request
     *
     * @return Response
     */
    public function store(CreateOfertaRequest $request)
    {
        $input = $request->all();

        $oferta = $this->ofertaRepository->create($input);

        Flash::success('Oferta saved successfully.');

        return redirect(route('ofertas.index'));
    }

    /**
     * Display the specified Oferta.
     *
     * @param  int $id
     *
     * @return Response
     */
    public function show($id)
    {
        $oferta = $this->ofertaRepository->findWithoutFail($id);

        if (empty($oferta)) {
            Flash::error('Oferta not found');

            return redirect(route('ofertas.index'));
        }
        $id_usr=Auth::user()->id;
        $obj=Empleador::where([ ['user_id', '=',$id_usr] ] )->first();
        $lista1="";
        $lista2="";
        $lista3="";
        if($obj){
          $prop_=$obj->id;
          $lista1  = Postulacion::select('users.id as userid','users.url_imagen','postulaciones.created_at as fpostulacion ','candidatos.*' )
                    ->where([ ['ofertas.empleador_id', '=',$prop_ ] ] )
                    ->where([ ['ofertas.id', '=',$oferta->id] ] )
                    ->where([ ['postulaciones.estatus_id', '=',1 ] ] )
                    ->join('ofertas','postulaciones.oferta_id','=','ofertas.id')
                    ->join('candidatos','postulaciones.candidato_id','=','candidatos.id')
                    ->join('users','candidatos.user_id','=','users.id')
                    ->distinct('users.id')
                    ->orderBy('nombres', 'asc')->get();
         $lista2  = Postulacion::select('users.id as userid','users.url_imagen','postulaciones.created_at as fpostulacion ','candidatos.*' )
                    ->where([ ['ofertas.empleador_id', '=',$prop_ ] ] )
                    ->where([ ['ofertas.id', '=',$oferta->id] ] )
                    ->where([ ['postulaciones.estatus_id', '=',2 ] ] )
                    ->join('ofertas','postulaciones.oferta_id','=','ofertas.id')
                    ->join('candidatos','postulaciones.candidato_id','=','candidatos.id')
                    ->join('users','candidatos.user_id','=','users.id')
                    ->distinct('users.id')
                    ->orderBy('nombres', 'asc')->get();
        $lista3  = Postulacion::select('users.id as userid','users.url_imagen','postulaciones.created_at as fpostulacion ','candidatos.*' )
                  ->where([ ['ofertas.empleador_id', '=',$prop_ ] ] )
                  ->where([ ['ofertas.id', '=',$oferta->id] ] )
                  ->where([ ['postulaciones.estatus_id', '=',3 ] ] )
                  ->join('ofertas','postulaciones.oferta_id','=','ofertas.id')
                  ->join('candidatos','postulaciones.candidato_id','=','candidatos.id')
                  ->join('users','candidatos.user_id','=','users.id')
                  ->distinct('users.id')
                  ->orderBy('nombres', 'asc')->get();

        }else{


        }


        return view('ofertas.show')
              ->with('empleados1',  $lista1 )
              ->with('empleados2',  $lista2 )
              ->with('empleados3',  $lista3 )
              ->with('oferta', $oferta);

    }

    /**
     * Show the form for editing the specified Oferta.
     *
     * @param  int $id
     *
     * @return Response
     */
    public function edit($id)
    {
        $oferta = $this->ofertaRepository->findWithoutFail($id);

        if (empty($oferta)) {
            Flash::error('Oferta not found');

            return redirect(route('ofertas.index'));
        }
        $sectores     = Sector::orderBy('descripcion')->pluck('descripcion', 'id');
        $ciudades     = Ciudad::orderBy('descripcion')->pluck('descripcion', 'id');

        $config = array();
        $config['apiKey'] = 'AIzaSyA1c5fXxWdutyXZPPBHZTKHvJbyo1yAVDY';
        $config['zoom'] = '16';
        //$config['center'] = 'auto';
        $config['center'] = '4.6482837,-74.2478935 ';
        \Gmaps::initialize($config);
        $marker = array();
        $marker['position'] = '4.6482837, -74.2478935';
        $marker['draggable'] = TRUE;
        $marker['animation'] = 'DROP';
        \Gmaps::add_marker($marker);
        $map = \Gmaps::create_map();

        return view('ofertas.edit')
                   ->with('sectores', $sectores)
                   ->with('ciudades', $ciudades)
                   ->with('oferta', $oferta);
    }

    /**
     * Update the specified Oferta in storage.
     *
     * @param  int              $id
     * @param UpdateOfertaRequest $request
     *
     * @return Response
     */
    public function update($id, UpdateOfertaRequest $request)
    {
        $oferta = $this->ofertaRepository->findWithoutFail($id);

        if (empty($oferta)) {
            Flash::error('Oferta not found');

            return redirect(route('ofertas.index'));
        }

        $oferta = $this->ofertaRepository->update($request->all(), $id);

        Flash::success('Oferta updated successfully.');

        return redirect(route('ofertas.index'));
    }

    /**
     * Remove the specified Oferta from storage.
     *
     * @param  int $id
     *
     * @return Response
     */
    public function destroy($id)
    {
        $oferta = $this->ofertaRepository->findWithoutFail($id);

        if (empty($oferta)) {
            Flash::error('Oferta not found');

            return redirect(route('ofertas.index'));
        }

        $this->ofertaRepository->delete($id);

        Flash::success('Oferta deleted successfully.');

        return redirect(route('ofertas.index'));
    }
}
