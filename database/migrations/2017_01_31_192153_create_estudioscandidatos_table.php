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
			$table->integer('estudio_id')->unsigned();
            $table->integer('candidato_id')->unsigned();
            $table->timestamps();
      		$table->softDeletes();
            $table->unique(['estudio_id', 'candidato_id']);
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
