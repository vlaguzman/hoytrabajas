<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreatePostulacionesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('postulaciones', function (Blueprint $table) {
            $table->increments('id');
			$table->integer('oferta_id')->unsigned();
            $table->integer('candidato_id')->unsigned();
			$table->integer('estatus_id')->unsigned();
            $table->timestamps();
			$table->softDeletes();
			$table->unique(['oferta_id', 'candidato_id']);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('postulaciones');
    }
}
