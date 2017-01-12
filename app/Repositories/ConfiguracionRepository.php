<?php

namespace App\Repositories;

use App\Models\Configuracion;
use InfyOm\Generator\Common\BaseRepository;

class ConfiguracionRepository extends BaseRepository
{
    /**
     * @var array
     */
    protected $fieldSearchable = [
        'user_id',
        'email',
        'push'
    ];

    /**
     * Configure the Model
     **/
    public function model()
    {
        return Configuracion::class;
    }
}
