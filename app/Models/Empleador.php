<?php

namespace App\Models;

use Eloquent as Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Empleador extends Model
{
    use SoftDeletes;

    public $table = 'empleadores';
    
    const CREATED_AT = 'created_at';
    const UPDATED_AT = 'updated_at';


    protected $dates = ['deleted_at'];


    public $fillable = [
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
     * The attributes that should be casted to native types.
     *
     * @var array
     */
    protected $casts = [
        'id' => 'integer',
        'contacto' => 'string',
        'empresa' => 'string',
        'telefono' => 'string',
        'correo' => 'string',
        'descripcion' => 'string',
        'direccion' => 'string',
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
    public function user()
    {
        return $this->belongsTo(\App\Models\Usuario::class);
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     **/
    public function membresiasEmpleadores()
    {
        return $this->hasMany(\App\Models\MembresiaEmpleador::class);
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     **/
    public function ofertas()
    {
        return $this->hasMany(\App\Models\Oferta::class);
    }
}
