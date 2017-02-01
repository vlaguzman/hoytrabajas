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
            $table->integer('idioma_id');
            $table->integer('candidato_id');
            $table->timestamps();
			$table->softDeletes();
			$table->foreign('idioma_id')->references('id')->on('idiomas')->onDelete('cascade')->onUpdate('cascade');
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
        Schema::dropIfExists('idiomas_candidatos');
    }
}
