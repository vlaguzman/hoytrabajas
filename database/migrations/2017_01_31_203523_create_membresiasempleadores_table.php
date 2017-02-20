<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateMembresiasempleadoresTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('membresias_empleadores', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('membresia_id')->unsigned();
            $table->integer('empleador_id')->unsigned();
			$table->dateTime('desde');
			$table->dateTime('hasta');
			$table->decimal('pagado', 10, 2);	
			$table->string('nro_factura',50);	
			$table->string('nro_aprobacion',100);
			$table->string('estatus',100);
            $table->timestamps();
			$table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('membresias_empleadores');
    }
}
