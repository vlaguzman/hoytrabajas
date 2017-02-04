<?php

namespace App\Models;

use Eloquent as Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Facades\DB;

use App\Models\Notification;
use App\User;
use Carbon\Carbon;

class Mensaje extends Model
{
    use SoftDeletes;

    public $table = 'mensajes';

    const CREATED_AT = 'created_at';
    const UPDATED_AT = 'updated_at';


    protected $dates = ['deleted_at'];


    public $fillable = [
        'deuser_id',
        'parauser_id',
        'mensaje',
        'recivido',
        'leido'
    ];

    /**
     * The attributes that should be casted to native types.
     *
     * @var array
     */
    protected $casts = [
        'id' => 'integer',
        'deuser_id' => 'integer',
        'parauser_id' => 'integer',
        'mensaje' => 'string'
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
    public function user()
    {
        return $this->belongsTo(\App\Models\Usuario::class);
    }


    public static function NotificacionAll($tipo,$modelo,$msg,$url,$imagen){
         $users= User::whereIn('perfil_id', [1, 3]);
         foreach($users as $item){
              $iduser=$item->id;
               Notification::create([
                      'user_id' => intval($iduser),
                      'data' => $msg,
                      'type' => $tipo,
                      'notifiable_type' => $modelo,
                      'redirect_url' => $url,
                      'image_url' => $imagen
                ]);
          }
        return true;
    }
    public static function Notificacion($iduser,$tipo,$modelo,$msg,$url,$imagen){
         $obj = Notification::create([
                  'user_id' => intval($iduser),
                  'data' => $msg,
                  'type' => $tipo,
                  'notifiable_type' => $modelo,
                  'redirect_url' => $url,
                  'image_url' => $imagen
             ]);
          if($obj){
              return true;
          }else{
              return false;
          }
    }
    public static function NotificacionesLeer($iduser){
          Carbon::setLocale(config('app.locale'));
          $dt = Carbon::now('America/Bogota');
          $rp= DB::table('notifications')
              ->where('user_id', $iduser)
              ->whereNull('read_at')
              ->update(['read_at' => $dt->toDateTimeString() ]);
          if($rp){
             return "SI";
          } else{
             return "NO";
          }

    }
    public static function getNotificacions( $iduser ){
        return (  Notification::where([ ['user_id', '=',$iduser ] ] )->orderBy('created_at', 'desc')->get() );
    }
    public static function ttNotificacions( $iduser ){
        return (  Notification::where([ ['user_id', '=',$iduser ] ] )->count() );
    }
    public static function ttNotificacionsnews( $iduser ){
        return (  Notification::where([ ['user_id', '=',$iduser ] ,['read_at', '=',null ]   ] )->count() );
    }

}
