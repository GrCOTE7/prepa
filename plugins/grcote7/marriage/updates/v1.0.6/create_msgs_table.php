<?php

/*
 * (c) Boosteur.com - 2022
 */

use Winter\Storm\Database\Schema\Blueprint;
use Winter\Storm\Database\Updates\Migration;

class create_msgs_table extends Migration
{
  public function up()
  {
    Schema::create('grcote7_marriage_msgs', function (Blueprint $table) {
      $table->engine = 'InnoDB';
      $table->increments('id');
      $table->integer('guest_id')->unsigned()->index();
      $table->integer('to_guest_id')->unsigned()->index();
      $table->string('subject');
      $table->string('content');

      $table->timestamps();
    });
  }

  public function down()
  {
    Schema::dropIfExists('grcote7_marriage_msgs');
  }
}
