<?php

namespace App\Repositories;

use App\Models\Perfil;
use InfyOm\Generator\Common\BaseRepository;

class PerfilRepository extends BaseRepository
{
    /**
     * @var array
     */
    protected $fieldSearchable = [
        'descripcion'
    ];

    /**
     * Configure the Model
     **/
    public function model()
    {
        return Perfil::class;
    }
}
