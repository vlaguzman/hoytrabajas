<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateCandidatosTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('candidatos', function (Blueprint $table) {
            $table->increments('id');
            $table->string('nombres',100);
			$table->string('apellidos',100);
			$table->date('fnac');
			$table->string('telefono',15);
			$table->string('correo',100);
			$table->string('descripcion',300);
			$table->string('direccion',300);
			$table->smallInteger('experiencia');
			$table->smallInteger('rate');
			$table->integer('genero_id');
			$table->integer('ciudad_id');
            $table->integer('user_id')->unsigned();
            $table->timestamps();
			$table->softDeletes();
			$table->foreign('user_id')->references('id')->on('users')->onDelete('cascade')->onUpdate('cascade');
			$table->foreign('genero_id')->references('id')->on('generos')->onDelete('cascade')->onUpdate('cascade');
			$table->foreign('ciudad_id')->references('id')->on('ciudades')->onDelete('cascade')->onUpdate('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('candidatos');
    }
}
