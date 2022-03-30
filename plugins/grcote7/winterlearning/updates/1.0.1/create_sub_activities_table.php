<?php

/*
 * (c) Boosteur.com - 2022
 */

use Winter\Storm\Database\Schema\Blueprint;
use Winter\Storm\Database\Updates\Migration;

class create_sub_activities_table extends Migration
{
  public function up()
  {
    Schema::create('grcote7_winterlearning_sub_activities', function (Blueprint $table) {
      $table->engine = 'InnoDB';
      $table->increments('id');
      $table->string('name');
      $table->string('description');
      $table->string('color');
      $table->integer('activity_id')->unsigned();
      $table->integer('activity_type_id')->unsigned();
      $table->integer('activity_status_id')->unsigned();
      $table->integer('created_by_id')->unsigned();
      $table->integer('updated_by_id')->unsigned();
    });
  }

  public function down()
  {
    Schema::dropIfExists('grcote7_winterlearning_sub_activities');
  }
}
