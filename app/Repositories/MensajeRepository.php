<?php

namespace App\Repositories;

use App\Models\Mensaje;
use InfyOm\Generator\Common\BaseRepository;

class MensajeRepository extends BaseRepository
{
    /**
     * @var array
     */
    protected $fieldSearchable = [
        'deuser_id',
        'parauser_id',
        'mensaje',
        'recivido',
        'leido'
    ];

    /**
     * Configure the Model
     **/
    public function model()
    {
        return Mensaje::class;
    }
}
