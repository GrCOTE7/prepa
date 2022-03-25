<?php

/*
 * (c) Boosteur.com - 2022
 */

namespace Grcote7\Marriage\Updates;

use Winter\Storm\Database\Schema\Blueprint;
use Winter\Storm\Database\Updates\Migration;
use Winter\Storm\Support\Facades\Schema;

class create_groups_table extends Migration
{
  public function up()
  {
    Schema::create('grcote7_marriage_groups', function (Blueprint $table) {
      $table->engine = 'InnoDB';
      $table->increments('id');
      $table->string('name');
      $table->timestamps();
    });
  }

  public function down()
  {
    Schema::dropIfExists('grcote7_marriage_groups');
  }
}
