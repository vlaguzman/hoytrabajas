<?php

namespace App\Repositories;

use App\Models\EstudioCandidato;
use InfyOm\Generator\Common\BaseRepository;

class EstudioCandidatoRepository extends BaseRepository
{
    /**
     * @var array
     */
    protected $fieldSearchable = [
        'estudio_id',
        'candidato_id'
    ];

    /**
     * Configure the Model
     **/
    public function model()
    {
        return EstudioCandidato::class;
    }
}
