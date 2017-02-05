<?php

namespace App\Http\Controllers;

use App\DataTables\IdiomaCandidatoDataTable;
use App\Http\Requests;
use App\Http\Requests\CreateIdiomaCandidatoRequest;
use App\Http\Requests\UpdateIdiomaCandidatoRequest;
use App\Repositories\IdiomaCandidatoRepository;
use Flash;
use App\Http\Controllers\AppBaseController;
use Response;

class IdiomaCandidatoController extends AppBaseController
{
    /** @var  IdiomaCandidatoRepository */
    private $idiomaCandidatoRepository;

    public function __construct(IdiomaCandidatoRepository $idiomaCandidatoRepo)
    {
        $this->idiomaCandidatoRepository = $idiomaCandidatoRepo;
    }

    /**
     * Display a listing of the IdiomaCandidato.
     *
     * @param IdiomaCandidatoDataTable $idiomaCandidatoDataTable
     * @return Response
     */
    public function index(IdiomaCandidatoDataTable $idiomaCandidatoDataTable)
    {
        return $idiomaCandidatoDataTable->render('idioma_candidatos.index');
    }

    /**
     * Show the form for creating a new IdiomaCandidato.
     *
     * @return Response
     */
    public function create()
    {
        return view('idioma_candidatos.create');
    }

    /**
     * Store a newly created IdiomaCandidato in storage.
     *
     * @param CreateIdiomaCandidatoRequest $request
     *
     * @return Response
     */
    public function store(CreateIdiomaCandidatoRequest $request)
    {
        $input = $request->all();

        $this->idiomaCandidatoRepository->create($input);

        Flash::success('Idioma Candidato saved successfully.');

        return redirect(route('idiomaCandidatos.index'));
    }

    /**
     * Display the specified IdiomaCandidato.
     *
     * @param  int $id
     *
     * @return Response
     */
    public function show($id)
    {
        $idiomaCandidato = $this->idiomaCandidatoRepository->findWithoutFail($id);

        if (empty($idiomaCandidato)) {
            Flash::error('Idioma Candidato not found');

            return redirect(route('idiomaCandidatos.index'));
        }

        return view('idioma_candidatos.show')->with('idiomaCandidato', $idiomaCandidato);
    }

    /**
     * Show the form for editing the specified IdiomaCandidato.
     *
     * @param  int $id
     *
     * @return Response
     */
    public function edit($id)
    {
        $idiomaCandidato = $this->idiomaCandidatoRepository->findWithoutFail($id);

        if (empty($idiomaCandidato)) {
            Flash::error('Idioma Candidato not found');

            return redirect(route('idiomaCandidatos.index'));
        }

        return view('idioma_candidatos.edit')->with('idiomaCandidato', $idiomaCandidato);
    }

    /**
     * Update the specified IdiomaCandidato in storage.
     *
     * @param  int              $id
     * @param UpdateIdiomaCandidatoRequest $request
     *
     * @return Response
     */
    public function update($id, UpdateIdiomaCandidatoRequest $request)
    {
        $idiomaCandidato = $this->idiomaCandidatoRepository->findWithoutFail($id);

        if (empty($idiomaCandidato)) {
            Flash::error('Idioma Candidato not found');

            return redirect(route('idiomaCandidatos.index'));
        }

        $idiomaCandidato = $this->idiomaCandidatoRepository->update($request->all(), $id);

        Flash::success('Idioma Candidato updated successfully.');

        return redirect(route('idiomaCandidatos.index'));
    }

    /**
     * Remove the specified IdiomaCandidato from storage.
     *
     * @param  int $id
     *
     * @return Response
     */
    public function destroy($id)
    {
        $idiomaCandidato = $this->idiomaCandidatoRepository->findWithoutFail($id);

        if (empty($idiomaCandidato)) {
            Flash::error('Idioma Candidato not found');

            return redirect(route('idiomaCandidatos.index'));
        }

        $this->idiomaCandidatoRepository->delete($id);

        Flash::success('Idioma Candidato deleted successfully.');

        return redirect(route('idiomaCandidatos.index'));
    }
}
