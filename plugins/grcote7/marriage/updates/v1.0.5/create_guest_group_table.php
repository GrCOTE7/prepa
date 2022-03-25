<?php

/*
 * (c) Boosteur.com - 2022
 */

namespace Grcote7\Marriage\Updates;

use Winter\Storm\Database\Schema\Blueprint;
use Winter\Storm\Database\Updates\Migration;
use Winter\Storm\Support\Facades\Schema;

class create_guest_group_table extends Migration
{
  public function up()
  {
    // DB::table('grcote7_marriage_group_guest')->delete();

    Schema::create('grcote7_marriage_guest_group', function (Blueprint $table) {
      $table->engine = 'InnoDB';
      $table->integer('guest_id')->unsigned();
      $table->integer('group_id')->unsigned();
      $table->primary(['guest_id', 'group_id']);
    });
  }

  public function down()
  {
    Schema::dropIfExists('grcote7_marriage_guest_group');
  }
}
