<?php

/*
 * (c) Boosteur.com - 2022
 */

use Winter\Storm\Database\Schema\Blueprint;
use Winter\Storm\Database\Updates\Migration;

class create_activity_employee_table extends Migration
{
  public function up()
  {
    Schema::create('activity_employee', function (Blueprint $table) {
      $table->engine = 'InnoDB';
      $table->integer('activity_id')->unsigned();
      $table->integer('employee_id')->unsigned();
      $table->primary(['activity_id', 'employee_id']);
    });
  }

  public function down()
  {
    Schema::dropIfExists('activity_employee');
  }
}
