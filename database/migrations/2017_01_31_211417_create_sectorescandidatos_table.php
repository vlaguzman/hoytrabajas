<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateSectorescandidatosTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('sectores_candidatos', function (Blueprint $table) {
            $table->increments('id');
			$table->integer('sector_id')->unsigned();
            $table->integer('candidato_id')->unsigned();
            $table->timestamps();
			$table->softDeletes();
            $table->unique(['sector_id', 'candidato_id']);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('sectores_candidatos');
    }
}
