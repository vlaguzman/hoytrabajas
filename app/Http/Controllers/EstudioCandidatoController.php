<?php

namespace App\Http\Controllers;

use App\DataTables\EstudioCandidatoDataTable;
use App\Http\Requests;
use App\Http\Requests\CreateEstudioCandidatoRequest;
use App\Http\Requests\UpdateEstudioCandidatoRequest;
use App\Repositories\EstudioCandidatoRepository;
use Flash;
use App\Http\Controllers\AppBaseController;
use Response;

class EstudioCandidatoController extends AppBaseController
{
    /** @var  EstudioCandidatoRepository */
    private $estudioCandidatoRepository;

    public function __construct(EstudioCandidatoRepository $estudioCandidatoRepo)
    {
        $this->estudioCandidatoRepository = $estudioCandidatoRepo;
    }

    /**
     * Display a listing of the EstudioCandidato.
     *
     * @param EstudioCandidatoDataTable $estudioCandidatoDataTable
     * @return Response
     */
    public function index(EstudioCandidatoDataTable $estudioCandidatoDataTable)
    {
        return $estudioCandidatoDataTable->render('estudio_candidatos.index');
    }

    /**
     * Show the form for creating a new EstudioCandidato.
     *
     * @return Response
     */
    public function create()
    {
        return view('estudio_candidatos.create');
    }

    /**
     * Store a newly created EstudioCandidato in storage.
     *
     * @param CreateEstudioCandidatoRequest $request
     *
     * @return Response
     */
    public function store(CreateEstudioCandidatoRequest $request)
    {
        $input = $request->all();

        $estudioCandidato = $this->estudioCandidatoRepository->create($input);

        Flash::success('Estudio Candidato saved successfully.');

        return redirect(route('estudioCandidatos.index'));
    }

    /**
     * Display the specified EstudioCandidato.
     *
     * @param  int $id
     *
     * @return Response
     */
    public function show($id)
    {
        $estudioCandidato = $this->estudioCandidatoRepository->findWithoutFail($id);

        if (empty($estudioCandidato)) {
            Flash::error('Estudio Candidato not found');

            return redirect(route('estudioCandidatos.index'));
        }

        return view('estudio_candidatos.show')->with('estudioCandidato', $estudioCandidato);
    }

    /**
     * Show the form for editing the specified EstudioCandidato.
     *
     * @param  int $id
     *
     * @return Response
     */
    public function edit($id)
    {
        $estudioCandidato = $this->estudioCandidatoRepository->findWithoutFail($id);

        if (empty($estudioCandidato)) {
            Flash::error('Estudio Candidato not found');

            return redirect(route('estudioCandidatos.index'));
        }

        return view('estudio_candidatos.edit')->with('estudioCandidato', $estudioCandidato);
    }

    /**
     * Update the specified EstudioCandidato in storage.
     *
     * @param  int              $id
     * @param UpdateEstudioCandidatoRequest $request
     *
     * @return Response
     */
    public function update($id, UpdateEstudioCandidatoRequest $request)
    {
        $estudioCandidato = $this->estudioCandidatoRepository->findWithoutFail($id);

        if (empty($estudioCandidato)) {
            Flash::error('Estudio Candidato not found');

            return redirect(route('estudioCandidatos.index'));
        }

        $estudioCandidato = $this->estudioCandidatoRepository->update($request->all(), $id);

        Flash::success('Estudio Candidato updated successfully.');

        return redirect(route('estudioCandidatos.index'));
    }

    /**
     * Remove the specified EstudioCandidato from storage.
     *
     * @param  int $id
     *
     * @return Response
     */
    public function destroy($id)
    {
        $estudioCandidato = $this->estudioCandidatoRepository->findWithoutFail($id);

        if (empty($estudioCandidato)) {
            Flash::error('Estudio Candidato not found');

            return redirect(route('estudioCandidatos.index'));
        }

        $this->estudioCandidatoRepository->delete($id);

        Flash::success('Estudio Candidato deleted successfully.');

        return redirect(route('estudioCandidatos.index'));
    }
}
