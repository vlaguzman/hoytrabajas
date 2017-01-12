<?php

namespace App\Repositories;

use App\Models\Oferta;
use InfyOm\Generator\Common\BaseRepository;

class OfertaRepository extends BaseRepository
{
    /**
     * @var array
     */
    protected $fieldSearchable = [
        'nombre',
        'descripcion',
        'url_imagen',
        'direccion',
        'paga',
        'desde',
        'hasta',
        'sector_id',
        'ciudad_id',
        'lat',
        'lng',
        'empleador_id',
        'bloqueada',
        'obs'
    ];

    /**
     * Configure the Model
     **/
    public function model()
    {
        return Oferta::class;
    }
}
