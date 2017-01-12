<?php

namespace App\Repositories;

use App\Models\IdiomaCandidato;
use InfyOm\Generator\Common\BaseRepository;

class IdiomaCandidatoRepository extends BaseRepository
{
    /**
     * @var array
     */
    protected $fieldSearchable = [
        'idioma_id',
        'candidato_id'
    ];

    /**
     * Configure the Model
     **/
    public function model()
    {
        return IdiomaCandidato::class;
    }
}
