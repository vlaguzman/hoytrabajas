<?php

namespace App\Http\Controllers;

use App\DataTables\AdministradorDataTable;
use App\Http\Requests;
use App\Http\Requests\CreateAdministradorRequest;
use App\Http\Requests\UpdateAdministradorRequest;
use App\Repositories\AdministradorRepository;
use Flash;
use App\Http\Controllers\AppBaseController;
use Response;
use narutimateum\Toastr\Facades\Toastr;
use Illuminate\Support\Facades\Mail;
use App\Mail\WelcomeAdmMail;

use App\User;
use App\Models\Administrador;

class AdministradorController extends AppBaseController
{
    /** @var  AdministradorRepository */
    private $administradorRepository;

    public function __construct(AdministradorRepository $administradorRepo)
    {
        $this->administradorRepository = $administradorRepo;
    }

    /**
     * Display a listing of the Administrador.
     *
     * @param AdministradorDataTable $administradorDataTable
     * @return Response
     */
    public function index(AdministradorDataTable $administradorDataTable)
    {
        return $administradorDataTable->render('administradors.index');
    }

    /**
     * Show the form for creating a new Administrador.
     *
     * @return Response
     */
    public function create()
    {
        return view('administradors.create');
    }

    /**
     * Store a newly created Administrador in storage.
     *
     * @param CreateAdministradorRequest $request
     *
     * @return Response
     */

     private function randKey($str='', $long=0){
        $key = null;
        $str = str_split($str);
        $start = 0;
        $limit = count($str)-1;
        for($x=0; $x<$long; $x++){
            $key .= $str[rand($start, $limit)];
        }
        return $key;
    }

    public function store(CreateAdministradorRequest $request){
        $input = $request->all();
    		$correo=$request->input('correo');
    		$user = User::whereEmail( $correo )->first();
    		if (!$user) {
          $psw= $this->randKey('ABCDEZ1234',10);
    			$user = User::create([
                    'email' => $correo,
                    'name' => $request->input('nombres').' '.$request->input('apellidos'),
          					'password' => bcrypt($psw),
          					'perfil_id' =>1,
          					'activo' =>1,
          					'url_imagen' => asset('/images/no-picture.jpg'),
                 ]);
    			 if($user){
    				 $id_usr=$user->id;
    				 $rp=Administrador::create([
    						'nombres' => $request->input('nombres'),
    						'apellidos' => $request->input('apellidos'),
    						'telefono' => $request->input('telefono'),
    						'correo' => $request->input('correo'),
    						'user_id' => $id_usr
               ]);
    				   if($rp){
    					     //Flash::success('Administrador creado.');
                   Toastr::info("Administrador creado, se ha enviado un email al correo del usuario", "Creado", $options = [] );
                   Mail::to($user->email)->send(new WelcomeAdmMail($user,$psw ));
    					     return redirect(route('administradors.index'));
    				   }else{
    					   Flash::error('Error al crear el Administrador .');
    				   }
    			 }else{
    				  Flash::error('No se pudo crear el usaurio Administrador.');
    			 }
    			//$administrador = $this->administradorRepository->create($input);
    		}else{
    			   Flash::error('Usuario '. $correo .', ya esta registrado.');
    		}
        return view('administradors.create');
    }

    /**
     * Display the specified Administrador.
     *
     * @param  int $id
     *
     * @return Response
     */
    public function show($id)
    {
        $administrador = $this->administradorRepository->findWithoutFail($id);

        if (empty($administrador)) {
            Flash::error('Administrador not found');

            return redirect(route('administradors.index'));
        }

        return view('administradors.show')->with('administrador', $administrador);
    }

    /**
     * Show the form for editing the specified Administrador.
     *
     * @param  int $id
     *
     * @return Response
     */
    public function edit($id)
    {
        $administrador = $this->administradorRepository->findWithoutFail($id);

        if (empty($administrador)) {
            Flash::error('Administrador not found');

            return redirect(route('administradors.index'));
        }

        return view('administradors.edit')->with('administrador', $administrador);
    }

    /**
     * Update the specified Administrador in storage.
     *
     * @param  int              $id
     * @param UpdateAdministradorRequest $request
     *
     * @return Response
     */
    public function update($id, UpdateAdministradorRequest $request)
    {
        $administrador = $this->administradorRepository->findWithoutFail($id);

        if (empty($administrador)) {
            Flash::error('Administrador not found');

            return redirect(route('administradors.index'));
        }

        $administrador = $this->administradorRepository->update($request->all(), $id);

        Flash::success('Administrador actualizado.');

        return redirect(route('administradors.index'));
    }

    /**
     * Remove the specified Administrador from storage.
     *
     * @param  int $id
     *
     * @return Response
     */
    public function destroy($id)
    {
        $administrador = $this->administradorRepository->findWithoutFail($id);

        if (empty($administrador)) {
            Flash::error('Administrador no encontrado');

            return redirect(route('administradors.index'));
        }

        $this->administradorRepository->delete($id);

        Flash::success('Administrador eliminado.');

        return redirect(route('administradors.index'));
    }
}
