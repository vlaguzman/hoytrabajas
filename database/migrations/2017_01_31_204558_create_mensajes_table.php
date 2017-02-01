<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateMensajesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('mensajes', function (Blueprint $table) {
            $table->increments('id');
			$table->integer('deuser_id')->unsigned();
			$table->integer('parauser_id')->unsigned();
			$table>text('mensaje');
			$table>tinyInteger('recivido');
			$table>tinyInteger('leido');
            $table->timestamps();
			$table->softDeletes();
			$table->foreign('deuser_id')->references('id')->on('users')->onDelete('cascade')->onUpdate('cascade');
			$table->foreign('parauser_id')->references('id')->on('users')->onDelete('cascade')->onUpdate('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('mensajes');
    }
}
