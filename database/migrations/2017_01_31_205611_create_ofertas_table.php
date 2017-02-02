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
			$table->string('nombre',100)->unique();
            $table->string('descripcion',250);
			$table->string('url_imagen',500);
            $table->string('direccion',300);
			$table->string('lat',50);
            $table->string('lng',50);
    		$table->string('paga',50);
    		$table->string('obs',200);
            $table->dateTime('desde');
      		$table->dateTime('hasta');
			$table->boolean('bloqueada');
      		$table->integer('empleador_id')->unsigned();
      		$table->integer('sector_id')->unsigned();
      		$table->integer('ciudad_id')->unsigned();
            $table->timestamps();
      		$table->softDeletes();
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
