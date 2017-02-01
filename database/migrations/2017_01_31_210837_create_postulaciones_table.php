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
			$table->integer('oferta_id');
            $table->integer('candidato_id');
			$table->integer('estatus_id');
            $table->timestamps();
			$table->softDeletes();
			$table->foreign('oferta_id')->references('id')->on('ofertas')->onDelete('cascade')->onUpdate('cascade');
			$table->foreign('candidato_id')->references('id')->on('candidatos')->onDelete('cascade')->onUpdate('cascade');
			$table->foreign('estatus_id')->references('id')->on('postulacion_estatus')->onDelete('cascade')->onUpdate('cascade');
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
