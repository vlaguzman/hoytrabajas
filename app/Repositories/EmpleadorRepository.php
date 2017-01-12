<?php

namespace App\Repositories;

use App\Models\Empleador;
use InfyOm\Generator\Common\BaseRepository;

class EmpleadorRepository extends BaseRepository
{
    /**
     * @var array
     */
    protected $fieldSearchable = [
        'contacto',
        'empresa',
        'telefono',
        'correo',
        'descripcion',
        'direccion',
        'ciudad_id',
        'user_id'
    ];

    /**
     * Configure the Model
     **/
    public function model()
    {
        return Empleador::class;
    }
}
