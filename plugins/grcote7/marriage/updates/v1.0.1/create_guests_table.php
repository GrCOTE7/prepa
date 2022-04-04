<?php

/*
 * (c) Boosteur.com - 2022
 */

namespace Grcote7\Marriage\Updates;

use DB;
use Schema;
use Winter\Storm\Database\Schema\Blueprint;
use Winter\Storm\Database\Updates\Migration;

class create_guests_table extends Migration
{
  public function up()
  {
    // DB::table('grcote7_marriage_guests')->delete();

    Schema::create('grcote7_marriage_guests', function (Blueprint $table) {
      $table->engine = 'InnoDB';
      $table->increments('id');
      $table->integer('user_id')->unsigned();
      $table->integer('familly_id')->unsigned()->index();
      $table->string('mobile')->nullable();
      $table->timestamps();
    });
  }

  public function down()
  {
    Schema::dropIfExists('grcote7_marriage_guests');
  }
}
