<?php

namespace App\Repositories;

use App\Models\PostulacionEstatus;
use InfyOm\Generator\Common\BaseRepository;

class PostulacionEstatusRepository extends BaseRepository
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
        return PostulacionEstatus::class;
    }
}
