<?php

/*
 * (c) Boosteur.com - 2022
 */

use Winter\Storm\Database\Schema\Blueprint;
use Winter\Storm\Database\Updates\Migration;

class create_imgs_table extends Migration
{
  public function up()
  {
    Schema::create('grcote7_marriage_imgs', function (Blueprint $table) {
      $table->engine = 'InnoDB';
      $table->increments('id');
      $table->string('filename');
      $table->string('imgable_id')->index(); // Owner id
      $table->string('imgable_type'); // Class name Owning Model -guest - famille - img
      $table->timestamps();
    });
  }

  public function down()
  {
    Schema::dropIfExists('grcote7_marriage_imgs');
  }
}
