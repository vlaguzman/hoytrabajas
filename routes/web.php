<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/
Auth::routes();
Route::get('/', function () {
    //return view('welcome');
	return redirect()->route('login');
});
Route::get('/registrarxtipo', function () {
    return view('tiporegistro');
});
Route::get('/registrar2', 'RegisterController2@showRegistrationForm');
Route::get('/redirectfb', 'SocialAuthController@redirectfb');
Route::get('/callbackfb', 'SocialAuthController@callbackfb');
Route::get('/redirectgp', 'SocialAuthController@redirectgp');
Route::get('/callbackgp', 'SocialAuthController@callbackgp');

Route::group(['middleware' => 'auth'], function(){
  Route::get('/home', 'HomeController@index');
	Route::get('/membresia', 'HomeController@membresia');
	Route::get('/buscartrabajadores', 'MembresiaEmpleadorController@validar');
	Route::post('/filtrarempleados', 'CandidatoController@filtrar');

	Route::get('/crearoferta', 'OfertaController@crearoferta');
	Route::any('/registraroferta', 'OfertaController@registraroferta');
	Route::get('/misofertas', 'OfertaController@misofertas');
	Route::get('/ofertasactivas', 'HomeController@ofertasactivas');
	Route::get('/mistrabajos', 'HomeController@mistrabajos');
	Route::get('/mistrabajadores', 'HomeController@mistrabajadores');
  Route::get('/terminos', 'HomeController@terminos');

  Route::get('/verperfil', 'EdtPerfilController@show');
	Route::get('/confirmarregistro2', 'EdtPerfilController@confr2');
  Route::get('/confirmarregistro3', 'EdtPerfilController@confr3');
  Route::post('/guardarconfirmarregistro', 'EdtPerfilController@confirmar');
  Route::post('/guardarperfil', 'EdtPerfilController@guardar');

  Route::any('/comprarmembresia2', 'MembresiaEmpleadorController@registrar');
  Route::any('/comprarmembresia3', 'MembresiaCandidatoController@registrar');
  Route::any('/chat', 'ChatController@vchat');
  Route::any('msgs/{id}/historico',['as' => 'msgs.historico', 'uses' => 'ChatController@historico']);
  Route::any('enviarmensaje', 'ChatController@enviarmensaje');
	Route::any('enviaroferta', 'ChatController@enviaroferta');

  Route::any('recibirmensaje', 'ChatController@recibirmensaje');
  Route::any('leermensajes', 'ChatController@marcarnotificacionesleidas');

  Route::any('postulacion/{id}/registrar',['as' => 'postulacion.registrar', 'uses' => 'PostulacionController@registrar']);
  Route::any('postulacion/{id}/aprobar',['as' => 'postulacion.aprobar', 'uses' => 'PostulacionController@aprobar']);
 	Route::any('postulacion/{id}/rechazar',['as' => 'postulacion.rechazar', 'uses' => 'PostulacionController@rechazar']);
  Route::any('postulacion/{id}/verificar',['as' => 'postulacion.verificar', 'uses' => 'PostulacionController@verificar']);

	Route::any('actualizarfoto', 'EdtPerfilController@actualizarFoto');
	Route::any('actualizarfoferta', 'OfertaController@actualizarFoto');

	Route::post('message', function(Request $request) {
        $user = Auth::user();
				$message = Mensaje::create([
						'parauser_id' => $user->id,
						'mensaje' => $request->input('message')
		    ]);
		    event(new ChatMessageWasReceived($message, $user));
   });



  Route::resource('administradors', 'AdministradorController');
	Route::resource('candidatos', 'CandidatoController');
	Route::resource('chats', 'ChatController');
	Route::resource('configuracions', 'ConfiguracionController');
	Route::resource('perfils', 'PerfilController');
	Route::resource('usuarios', 'UsuarioController');
	Route::resource('generos', 'GeneroController');
	Route::resource('empleadors', 'EmpleadorController');
	Route::resource('idiomas', 'IdiomaController');
	Route::resource('idiomaCandidatos', 'IdiomaCandidatoController');
	Route::resource('estudios', 'EstudioController');
	Route::resource('estudioCandidatos', 'EstudioCandidatoController');
	Route::resource('pais', 'PaisController');
	Route::resource('departamentos', 'DepartamentoController');
	Route::resource('ofertas', 'OfertaController');
	Route::resource('ciudads', 'CiudadController');
	Route::resource('sectors', 'SectorController');
	Route::resource('sectorCandidatos', 'SectorCandidatoController');
	Route::resource('postulacions', 'PostulacionController');
	Route::resource('postulacionEstatuses', 'PostulacionEstatusController');
	Route::resource('membresias', 'MembresiaController');
	Route::resource('membresiaPrecios', 'MembresiaPrecioController');
	Route::resource('membresiaCandidatos', 'MembresiaCandidatoController');
	Route::resource('membresiaEmpleadors', 'MembresiaEmpleadorController');
	Route::resource('mensajes', 'MensajeController');
});
