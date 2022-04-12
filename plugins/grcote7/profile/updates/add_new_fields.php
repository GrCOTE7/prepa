<?php

/*
 * (c) Boosteur.com - 2022
 */

namespace Grcote7\Profile\Updates;

use Schema;
use Winter\Storm\Database\Updates\Migration;

class add_new_fields extends Migration
{
  public function up()
  {
    Schema::table('users', function ($table) {
      $table->string('facebook')->nullable();
      $table->text('bio')->nullable();
    });
  }

  public function down()
  {
    Schema::table('users', function ($table) {
      $table->dropColumn('facebook');
      $table->dropColumn('bio');
    });
  }
}
