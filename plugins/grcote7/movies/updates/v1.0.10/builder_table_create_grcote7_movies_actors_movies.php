<?php

/*
 * (c) Boosteur.com - 2022
 */

namespace Grcote7\Movies\Updates;

use Schema;
use Winter\Storm\Database\Updates\Migration;

class builder_table_create_grcote7_movies_actors_movies extends Migration
{
  public function up()
  {
    Schema::create('grcote7_movies_actors_movies', function ($table) {
      $table->engine = 'InnoDB';
      $table->integer('movie_id')->unsigned();
      $table->integer('actor_id')->unsigned();
      $table->primary(['actor_id', 'movie_id']);
    });
  }

  public function down()
  {
    Schema::dropIfExists('grcote7_movies_actors_movies');
  }
}
