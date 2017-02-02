<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AddForeignKeysTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('users', function (Blueprint $table) {
            $table->foreign('perfil_id')->references('id')->on('perfiles')->onDelete('cascade')->onUpdate('cascade');
        });
		Schema::table('social_accounts', function (Blueprint $table) {
             $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade')->onUpdate('cascade');
        });
		Schema::table('notifications', function (Blueprint $table) {
            $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade')->onUpdate('cascade');
        });
		Schema::table('administradores', function (Blueprint $table) {
             $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade')->onUpdate('cascade');
        });
		Schema::table('empleadores', function (Blueprint $table) {
            $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade')->onUpdate('cascade');
			$table->foreign('ciudad_id')->references('id')->on('ciudades')->onDelete('cascade')->onUpdate('cascade');
        });
		Schema::table('ciudades', function (Blueprint $table) {
            $table->foreign('estado_id')->references('id')->on('estados')->onDelete('cascade')->onUpdate('cascade');
        });
		Schema::table('estados', function (Blueprint $table) {
            $table->foreign('pais_id')->references('id')->on('paises')->onDelete('cascade')->onUpdate('cascade');
        });
		Schema::table('candidatos', function (Blueprint $table) {
            $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade')->onUpdate('cascade');
			$table->foreign('genero_id')->references('id')->on('generos')->onDelete('cascade')->onUpdate('cascade');
			$table->foreign('ciudad_id')->references('id')->on('ciudades')->onDelete('cascade')->onUpdate('cascade');
        });
		Schema::table('configuraciones', function (Blueprint $table) {
             $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade')->onUpdate('cascade');
        });
		Schema::table('estudios_candidatos', function (Blueprint $table) {
            $table->foreign('estudio_id')->references('id')->on('estudios')->onDelete('cascade')->onUpdate('cascade');
            $table->foreign('candidato_id')->references('id')->on('candidatos')->onDelete('cascade')->onUpdate('cascade');
        });
		Schema::table('idiomas_candidatos', function (Blueprint $table) {
            $table->foreign('idioma_id')->references('id')->on('idiomas')->onDelete('cascade')->onUpdate('cascade');
            $table->foreign('candidato_id')->references('id')->on('candidatos')->onDelete('cascade')->onUpdate('cascade');
        });
		Schema::table('membresias_candidatos', function (Blueprint $table) {
            $table->foreign('membresia_id')->references('id')->on('membresias')->onDelete('cascade')->onUpdate('cascade');
            $table->foreign('candidato_id')->references('id')->on('candidatos')->onDelete('cascade')->onUpdate('cascade');
        });
		Schema::table('membresias_empleadores', function (Blueprint $table) {
            $table->foreign('membresia_id')->references('id')->on('membresias')->onDelete('cascade')->onUpdate('cascade');
            $table->foreign('empleador_id')->references('id')->on('empleadores')->onDelete('cascade')->onUpdate('cascade');
        });
		Schema::table('membresias_precios', function (Blueprint $table) {
            $table->foreign('membresia_id')->references('id')->on('membresias')->onDelete('cascade')->onUpdate('cascade');
        });
		Schema::table('mensajes', function (Blueprint $table) {
            $table->foreign('deuser_id')->references('id')->on('users')->onDelete('cascade')->onUpdate('cascade');
			$table->foreign('parauser_id')->references('id')->on('users')->onDelete('cascade')->onUpdate('cascade');
        });
		Schema::table('ofertas', function (Blueprint $table) {
            $table->foreign('empleador_id')->references('id')->on('empleadores')->onDelete('cascade')->onUpdate('cascade');
      		$table->foreign('sector_id')->references('id')->on('sectores')->onDelete('cascade')->onUpdate('cascade');
      		$table->foreign('ciudad_id')->references('id')->on('ciudades')->onDelete('cascade')->onUpdate('cascade');
        });
		Schema::table('postulaciones', function (Blueprint $table) {
           	$table->foreign('oferta_id')->references('id')->on('ofertas')->onDelete('cascade')->onUpdate('cascade');
			$table->foreign('candidato_id')->references('id')->on('candidatos')->onDelete('cascade')->onUpdate('cascade');
			$table->foreign('estatus_id')->references('id')->on('postulacion_estatus')->onDelete('cascade')->onUpdate('cascade');
        });
		Schema::table('sectores_candidatos', function (Blueprint $table) {
             $table->foreign('sector_id')->references('id')->on('sectores')->onDelete('cascade')->onUpdate('cascade');
             $table->foreign('candidato_id')->references('id')->on('candidatos')->onDelete('cascade')->onUpdate('cascade');
        });
		Schema::table('chats', function (Blueprint $table) {
             $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade')->onUpdate('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('users', function (Blueprint $table) {
            $table->dropForeign('users_perfil_id_foreign');
        });
		Schema::table('social_accounts', function (Blueprint $table) {
			$table->dropForeign('social_accounts_user_id_foreign');
        });
		Schema::table('notifications', function (Blueprint $table) {
            $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade')->onUpdate('cascade');
			$table->dropForeign('social_accounts_user_id_foreign');
        });
		Schema::table('administradores', function (Blueprint $table) {
            $table->dropForeign('administradores_user_id_foreign');
        });
		Schema::table('empleadores', function (Blueprint $table) {
            $table->dropForeign('empleadores_user_id_foreign');
			$table->dropForeign('empleadores_ciudad_id_foreign');
        });
		Schema::table('ciudades', function (Blueprint $table) {
           $table->dropForeign('ciudades_estado_id_foreign');
        });
		Schema::table('estados', function (Blueprint $table) {
            $table->dropForeign('estados_pais_id_foreign');
        });
		Schema::table('candidatos', function (Blueprint $table) {
            $table->dropForeign('candidatos_user_id_foreign');
			$table->dropForeign('candidatos_genero_id_foreign');
			$table->dropForeign('candidatos_ciudad_id_foreign');
        });
		Schema::table('configuraciones', function (Blueprint $table) {
            $table->dropForeign('configuraciones_user_id_foreign');
        });
		Schema::table('estudios_candidatos', function (Blueprint $table) {
            $table->dropForeign('estudios_candidatos_estudio_id_foreign');
			$table->dropForeign('estudios_candidatos_candidato_id_foreign');
        });
		Schema::table('idiomas_candidatos', function (Blueprint $table) {
            $table->dropForeign('idiomas_candidatos_idioma_id_foreign');
			$table->dropForeign('idiomas_candidatos_candidato_id_foreign');
        });
		Schema::table('membresias_candidatos', function (Blueprint $table) {
            $table->dropForeign('membresias_candidatos_membresia_id_foreign');
			$table->dropForeign('membresias_candidatos_candidato_id_foreign');
        });
		Schema::table('membresias_empleadores', function (Blueprint $table) {
			$table->dropForeign('membresias_empleadores_membresia_id_foreign');
			$table->dropForeign('membresias_empleadores_empleador_id_foreign');
        });
		Schema::table('membresias_precios', function (Blueprint $table) {
            $table->dropForeign('membresias_precios_membresia_id_foreign');
        });
		Schema::table('mensajes', function (Blueprint $table) {
			$table->dropForeign('mensajes_deuser_id_foreign');
			$table->dropForeign('mensajes_parauser_id_foreign');
        });
		Schema::table('ofertas', function (Blueprint $table) {
			$table->dropForeign('ofertas_empleador_id_foreign');
			$table->dropForeign('ofertas_sector_id_foreign');
			$table->dropForeign('ofertas_ciudad_id_foreign');
        });
		Schema::table('postulaciones', function (Blueprint $table) {
			$table->dropForeign('postulaciones_oferta_id_foreign');
			$table->dropForeign('postulaciones_candidato_id_foreign');
			$table->dropForeign('postulaciones_estatus_id_foreign');
        });
		Schema::table('sectores_candidatos', function (Blueprint $table) {
			 $table->dropForeign('sectores_candidatos_sector_id_foreign');
			 $table->dropForeign('sectores_candidatos_candidato_id_foreign');
        });
		Schema::table('chats', function (Blueprint $table) {
			 $table->dropForeign('chats_user_id_foreign');
        });
		
    }
}
