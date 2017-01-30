<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateNotificationsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('notifications', function (Blueprint $table) {
			$table->increments('id');
            $table->string('type');
			$table->string('notifiable_type');
            $table->string('data',300);
			$table->string('redirect_url',100);
			$table->string('image_url',600);
			$table->integer('user_id')->unsigned();
            $table->timestamp('read_at')->nullable();
			$table->softDeletes();
            $table->timestamps();
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
        Schema::dropIfExists('notifications');
    }
}
