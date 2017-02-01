<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateMembresiaspreciosTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('membresias_precios', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('membresia_id');
            $table->smallInteger('duracion');
			$table->dateTime('desde');
			$table->dateTime('hasta');
			$table->decimal('precio', 10, 2);	
            $table->timestamps();
			$table->softDeletes();
			$table->foreign('membresia_id')->references('id')->on('membresias')->onDelete('cascade')->onUpdate('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('membresias_precios');
    }
}
