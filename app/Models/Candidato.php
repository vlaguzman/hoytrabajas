<?php

namespace App\Models;

use Eloquent as Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Candidato extends Model
{
    use SoftDeletes;

    public $table = 'candidatos';
    
    const CREATED_AT = 'created_at';
    const UPDATED_AT = 'updated_at';


    protected $dates = ['deleted_at'];


    public $fillable = [
        'nombres',
        'apellidos',
        'fnac',
        'telefono',
        'correo',
        'descripcion',
        'direccion',
        'experiencia',
        'rate',
        'genero_id',
        'ciudad_id',
        'user_id'
    ];

    /**
     * The attributes that should be casted to native types.
     *
     * @var array
     */
    protected $casts = [
        'id' => 'integer',
        'nombres' => 'string',
        'apellidos' => 'string',
        'fnac' => 'date',
        'telefono' => 'string',
        'correo' => 'string',
        'descripcion' => 'string',
        'direccion' => 'string',
        'experiencia' => 'integer',
        'rate' => 'integer',
        'genero_id' => 'integer',
        'ciudad_id' => 'integer',
        'user_id' => 'integer'
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
    public function ciudade()
    {
        return $this->belongsTo(\App\Models\Ciudad::class);
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     **/
    public function genero()
    {
        return $this->belongsTo(\App\Models\Genero::class);
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     **/
    public function user()
    {
        return $this->belongsTo(\App\Models\Usuario::class);
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     **/
    public function estudiosCandidatos()
    {
        return $this->hasMany(\App\Models\EstudioCandidato::class);
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     **/
    public function idiomasCandidatos()
    {
        return $this->hasMany(\App\Models\IdiomaCandidato::class);
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     **/
    public function membresiasCandidatos()
    {
        return $this->hasMany(\App\Models\MembresiaCandidato::class);
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     **/
    public function postulaciones()
    {
        return $this->hasMany(\App\Models\Postulacion::class);
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     **/
    public function sectoresCandidatos()
    {
        return $this->hasMany(\App\Models\SectorCandidato::class);
    }
}
