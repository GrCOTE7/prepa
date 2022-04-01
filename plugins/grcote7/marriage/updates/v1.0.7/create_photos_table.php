<?php

/*
 * (c) Boosteur.com - 2022
 */

use Winter\Storm\Database\Schema\Blueprint;
use Winter\Storm\Database\Updates\Migration;

class create_photos_table extends Migration
{
  public function up()
  {
    Schema::create('grcote7_marriage_photos', function (Blueprint $table) {
      $table->engine = 'InnoDB';
      $table->increments('id');
      $table->string('path');
      $table->morphs('imageable'); // Owner id & Type id
      $table->timestamps();
    });
  }

  public function down()
  {
    Schema::dropIfExists('grcote7_marriage_photos');
  }
}
