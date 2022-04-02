<?php

/*
 * (c) Boosteur.com - 2022
 */

use Winter\Storm\Database\Schema\Blueprint;
use Winter\Storm\Database\Updates\Migration;

class create_avatars_table extends Migration
{
  public function up()
  {
    Schema::create('grcote7_marriage_avatars', function (Blueprint $table) {
      $table->engine = 'InnoDB';
      $table->increments('id');
      $table->string('name');
      $table->integer('guest_id')->unsigned();
      $table->timestamps();
    });
  }

  public function down()
  {
    Schema::dropIfExists('grcote7_marriage_avatars');
  }
}
