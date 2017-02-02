<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateAdministradoresTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('administradores', function (Blueprint $table) {
                $table->increments('id');
      			$table->string('nombres',100);
      			$table->string('apellidos',100);
      			$table->string('telefono',15);
      			$table->string('correo',100);
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
        Schema::dropIfExists('administradores');
    }
}
