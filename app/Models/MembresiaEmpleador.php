<?php

namespace App\Models;

use Eloquent as Model;
use Illuminate\Database\Eloquent\SoftDeletes;

/**
 * @SWG\Definition(
 *      definition="MembresiaEmpleador",
 *      required={""},
 *      @SWG\Property(
 *          property="id",
 *          description="id",
 *          type="integer",
 *          format="int32"
 *      ),
 *      @SWG\Property(
 *          property="pagado",
 *          description="pagado",
 *          type="number",
 *          format="float"
 *      ),
 *      @SWG\Property(
 *          property="empleador_id",
 *          description="empleador_id",
 *          type="integer",
 *          format="int32"
 *      ),
 *      @SWG\Property(
 *          property="membresia_id",
 *          description="membresia_id",
 *          type="integer",
 *          format="int32"
 *      )
 * )
 */
class MembresiaEmpleador extends Model
{
    use SoftDeletes;

    public $table = 'membresias_empleadores';
    
    const CREATED_AT = 'created_at';
    const UPDATED_AT = 'updated_at';


    protected $dates = ['deleted_at'];


    public $fillable = [
        'pagado',
        'desde',
        'hasta',
        'empleador_id',
        'membresia_id'
    ];

    /**
     * The attributes that should be casted to native types.
     *
     * @var array
     */
    protected $casts = [
        'id' => 'integer',
        'empleador_id' => 'integer',
        'membresia_id' => 'integer'
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
    public function empleadore()
    {
        return $this->belongsTo(\App\Models\Empleador::class);
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     **/
    public function membresia()
    {
        return $this->belongsTo(\App\Models\Membresia::class);
    }
}
