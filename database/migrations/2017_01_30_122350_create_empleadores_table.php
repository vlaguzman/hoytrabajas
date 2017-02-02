<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateEmpleadoresTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('empleadores', function (Blueprint $table) {
            $table->increments('id');
			$table->string('contacto',100);
			$table->string('empresa',200);
			$table->string('telefono',15);
			$table->string('correo',100);
			$table->string('descripcion',300);
			$table->string('direccion',300);
			$table->integer('ciudad_id')->unsigned();
            $table->integer('user_id')->unsigned();
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
        Schema::dropIfExists('empleadores');
    }
}
