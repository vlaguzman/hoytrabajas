<?php

namespace App\Http\Controllers;

use App\DataTables\PostulacionEstatusDataTable;
use App\Http\Requests;
use App\Http\Requests\CreatePostulacionEstatusRequest;
use App\Http\Requests\UpdatePostulacionEstatusRequest;
use App\Repositories\PostulacionEstatusRepository;
use Flash;
use App\Http\Controllers\AppBaseController;
use Response;

class PostulacionEstatusController extends AppBaseController
{
    /** @var  PostulacionEstatusRepository */
    private $postulacionEstatusRepository;

    public function __construct(PostulacionEstatusRepository $postulacionEstatusRepo)
    {
        $this->postulacionEstatusRepository = $postulacionEstatusRepo;
    }

    /**
     * Display a listing of the PostulacionEstatus.
     *
     * @param PostulacionEstatusDataTable $postulacionEstatusDataTable
     * @return Response
     */
    public function index(PostulacionEstatusDataTable $postulacionEstatusDataTable)
    {
        return $postulacionEstatusDataTable->render('postulacion_estatuses.index');
    }

    /**
     * Show the form for creating a new PostulacionEstatus.
     *
     * @return Response
     */
    public function create()
    {
        return view('postulacion_estatuses.create');
    }

    /**
     * Store a newly created PostulacionEstatus in storage.
     *
     * @param CreatePostulacionEstatusRequest $request
     *
     * @return Response
     */
    public function store(CreatePostulacionEstatusRequest $request)
    {
        $input = $request->all();

        $this->postulacionEstatusRepository->create($input);

        Flash::success('Postulacion Estatus saved successfully.');

        return redirect(route('postulacionEstatuses.index'));
    }

    /**
     * Display the specified PostulacionEstatus.
     *
     * @param  int $id
     *
     * @return Response
     */
    public function show($id)
    {
        $postulacionEstatus = $this->postulacionEstatusRepository->findWithoutFail($id);

        if (empty($postulacionEstatus)) {
            Flash::error('Postulacion Estatus not found');

            return redirect(route('postulacionEstatuses.index'));
        }

        return view('postulacion_estatuses.show')->with('postulacionEstatus', $postulacionEstatus);
    }

    /**
     * Show the form for editing the specified PostulacionEstatus.
     *
     * @param  int $id
     *
     * @return Response
     */
    public function edit($id)
    {
        $postulacionEstatus = $this->postulacionEstatusRepository->findWithoutFail($id);

        if (empty($postulacionEstatus)) {
            Flash::error('Postulacion Estatus not found');

            return redirect(route('postulacionEstatuses.index'));
        }

        return view('postulacion_estatuses.edit')->with('postulacionEstatus', $postulacionEstatus);
    }

    /**
     * Update the specified PostulacionEstatus in storage.
     *
     * @param  int              $id
     * @param UpdatePostulacionEstatusRequest $request
     *
     * @return Response
     */
    public function update($id, UpdatePostulacionEstatusRequest $request)
    {
        $postulacionEstatus = $this->postulacionEstatusRepository->findWithoutFail($id);

        if (empty($postulacionEstatus)) {
            Flash::error('Postulacion Estatus not found');

            return redirect(route('postulacionEstatuses.index'));
        }

        $postulacionEstatus = $this->postulacionEstatusRepository->update($request->all(), $id);

        Flash::success('Postulacion Estatus updated successfully.');

        return redirect(route('postulacionEstatuses.index'));
    }

    /**
     * Remove the specified PostulacionEstatus from storage.
     *
     * @param  int $id
     *
     * @return Response
     */
    public function destroy($id)
    {
        $postulacionEstatus = $this->postulacionEstatusRepository->findWithoutFail($id);

        if (empty($postulacionEstatus)) {
            Flash::error('Postulacion Estatus not found');

            return redirect(route('postulacionEstatuses.index'));
        }

        $this->postulacionEstatusRepository->delete($id);

        Flash::success('Postulacion Estatus deleted successfully.');

        return redirect(route('postulacionEstatuses.index'));
    }
}
