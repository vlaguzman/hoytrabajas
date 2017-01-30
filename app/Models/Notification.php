<?php

namespace App\Models;

use Eloquent as Model;
use Illuminate\Database\Eloquent\SoftDeletes;


class Notification extends Model
{
    use SoftDeletes;

    public $table = 'notifications';

    const CREATED_AT = 'created_at';
    const UPDATED_AT = 'updated_at';


    protected $dates = ['deleted_at'];


    public $fillable = [
        'data','type','notifiable_type','user_id','image_url','redirect_url','read_at'
    ];

    /**
     * The attributes that should be casted to native types.
     *
     * @var array
     */
    protected $casts = [
          'id' => 'integer',
		  'user_id' => 'integer',
          'data' => 'string',
		      'type' => 'string',
		      'notifiable_type' => 'string',
		      'image_url' => 'string',
		      'redirect_url' => 'string'
    ];

    /**
     * Validation rules
     *
     * @var array
     */
    public static $rules = [

    ];

	public function user()
    {
        return $this->belongsTo(\App\Models\User::class);
    }
}
