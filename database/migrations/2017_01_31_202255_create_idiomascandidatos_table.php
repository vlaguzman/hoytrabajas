<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateIdiomascandidatosTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('idiomas_candidatos', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('idioma_id')->unsigned();
            $table->integer('candidato_id')->unsigned();
            $table->timestamps();
		    $table->softDeletes();
            $table->unique(['idioma_id', 'candidato_id']);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('idiomas_candidatos');
    }
}
