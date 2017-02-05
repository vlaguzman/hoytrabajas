<?php

namespace App\Http\Controllers;

use App\DataTables\MensajeDataTable;
use App\Http\Requests;
use App\Http\Requests\CreateMensajeRequest;
use App\Http\Requests\UpdateMensajeRequest;
use App\Repositories\MensajeRepository;
use Flash;
use App\Http\Controllers\AppBaseController;
use Response;



class MensajeController extends AppBaseController
{
    /** @var  MensajeRepository */
    private $mensajeRepository;

    public function __construct(MensajeRepository $mensajeRepo)
    {
        $this->mensajeRepository = $mensajeRepo;
    }




    /**
     * Display a listing of the Mensaje.
     *
     * @param MensajeDataTable $mensajeDataTable
     * @return Response
     */
    public function index(MensajeDataTable $mensajeDataTable)
    {
        return $mensajeDataTable->render('mensajes.index');
    }

    /**
     * Show the form for creating a new Mensaje.
     *
     * @return Response
     */
    public function create()
    {
        return view('mensajes.create');
    }

    /**
     * Store a newly created Mensaje in storage.
     *
     * @param CreateMensajeRequest $request
     *
     * @return Response
     */
    public function store(CreateMensajeRequest $request)
    {
        $input = $request->all();

        $this->mensajeRepository->create($input);

        Flash::success('Mensaje saved successfully.');

        return redirect(route('mensajes.index'));
    }

    /**
     * Display the specified Mensaje.
     *
     * @param  int $id
     *
     * @return Response
     */
    public function show($id)
    {
        $mensaje = $this->mensajeRepository->findWithoutFail($id);

        if (empty($mensaje)) {
            Flash::error('Mensaje not found');

            return redirect(route('mensajes.index'));
        }

        return view('mensajes.show')->with('mensaje', $mensaje);
    }

    /**
     * Show the form for editing the specified Mensaje.
     *
     * @param  int $id
     *
     * @return Response
     */
    public function edit($id)
    {
        $mensaje = $this->mensajeRepository->findWithoutFail($id);

        if (empty($mensaje)) {
            Flash::error('Mensaje not found');

            return redirect(route('mensajes.index'));
        }

        return view('mensajes.edit')->with('mensaje', $mensaje);
    }

    /**
     * Update the specified Mensaje in storage.
     *
     * @param  int              $id
     * @param UpdateMensajeRequest $request
     *
     * @return Response
     */
    public function update($id, UpdateMensajeRequest $request)
    {
        $mensaje = $this->mensajeRepository->findWithoutFail($id);

        if (empty($mensaje)) {
            Flash::error('Mensaje not found');

            return redirect(route('mensajes.index'));
        }

        $mensaje = $this->mensajeRepository->update($request->all(), $id);

        Flash::success('Mensaje updated successfully.');

        return redirect(route('mensajes.index'));
    }

    /**
     * Remove the specified Mensaje from storage.
     *
     * @param  int $id
     *
     * @return Response
     */
    public function destroy($id)
    {
        $mensaje = $this->mensajeRepository->findWithoutFail($id);

        if (empty($mensaje)) {
            Flash::error('Mensaje not found');

            return redirect(route('mensajes.index'));
        }

        $this->mensajeRepository->delete($id);

        Flash::success('Mensaje deleted successfully.');

        return redirect(route('mensajes.index'));
    }
}
