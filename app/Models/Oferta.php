<?php

namespace App\Models;

use Eloquent as Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Carbon\Carbon;


class Oferta extends Model
{
    use SoftDeletes;

    public $table = 'ofertas';

    const CREATED_AT = 'created_at';
    const UPDATED_AT = 'updated_at';


    protected $dates = ['deleted_at'];


    public $fillable = [
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
     * The attributes that should be casted to native types.
     *
     * @var array
     */
    protected $casts = [
        'id' => 'integer',
        'nombre' => 'string',
        'descripcion' => 'string',
        'url_imagen' => 'string',
        'direccion' => 'string',
        'paga' => 'string',
        'sector_id' => 'integer',
        'ciudad_id' => 'integer',
        'lat' => 'string',
        'lng' => 'string',
        'empleador_id' => 'integer',
        'obs' => 'string',
        'bloqueada'=> 'boolean',
    ];


    /**
     * Validation rules
     *
     * @var array
     */
    public static $rules = [

    ];

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     **/
    public function ciudades()
    {
        return $this->belongsTo(\App\Models\Ciudad::class);
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     **/
    public function empleadores()
    {
        return $this->belongsTo(\App\Models\Empleador::class);
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     **/
    public function sectores()
    {
        return $this->belongsTo(\App\Models\Sector::class);
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     **/
    public function postulaciones()
    {
        return $this->hasMany(\App\Models\Postulacion::class);
    }
}
