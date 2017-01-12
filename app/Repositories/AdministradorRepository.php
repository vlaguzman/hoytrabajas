<?php

namespace App\Repositories;

use App\Models\Administrador;
use InfyOm\Generator\Common\BaseRepository;

class AdministradorRepository extends BaseRepository
{
    /**
     * @var array
     */
    protected $fieldSearchable = [
        'nombres',
        'apellidos',
        'telefono',
        'correo',
        'user_id'
    ];

    /**
     * Configure the Model
     **/
    public function model()
    {
        return Administrador::class;
    }
}
