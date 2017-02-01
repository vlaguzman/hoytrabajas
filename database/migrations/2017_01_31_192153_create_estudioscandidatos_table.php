<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateEstudioscandidatosTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('estudios_candidatos', function (Blueprint $table) {
            $table->increments('id');
			$table->integer('estudio_id');
            $table->integer('candidato_id');
            $table->timestamps();
			$table->softDeletes();
			$table->foreign('estudio_id')->references('id')->on('estudios')->onDelete('cascade')->onUpdate('cascade');
            $table->foreign('candidato_id')->references('id')->on('candidatos')->onDelete('cascade')->onUpdate('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('estudios_candidatos');
    }
}
