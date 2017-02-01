<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateOfertasTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('ofertas', function (Blueprint $table) {
            $table->increments('id');
			$table->string('nombre',100);
            $table->string('descripcion',250);	
			$table->string('url_imagen',500);
            $table->string('direccion',300);	
			$table->string('lat',50);
            $table->string('lng',50);	
			$table->string('paga',50);
			$table->string('obs',200);
            $table->dateTime('desde');
			$table->dateTime('hasta');	
			$table->integer('empleador_id');
			$table->integer('sector_id');
			$table->integer('ciudad_id');
			$table->boolean('bloqueada');
            $table->timestamps();
			$table->softDeletes();
			$table->foreign('empleador_id')->references('id')->on('empleadores')->onDelete('cascade')->onUpdate('cascade');
			$table->foreign('sector_id')->references('id')->on('sectores')->onDelete('cascade')->onUpdate('cascade');
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
        Schema::dropIfExists('ofertas');
    }
}
