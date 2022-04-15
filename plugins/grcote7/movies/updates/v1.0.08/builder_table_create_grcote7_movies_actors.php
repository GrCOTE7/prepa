<?php namespace Grcote7\Movies\Updates;

use Schema;
use Winter\Storm\Database\Updates\Migration;

class BuilderTableCreateGrcote7MoviesActors extends Migration
{
    public function up()
    {
        Schema::create('grcote7_movies_actors', function($table)
        {
            $table->engine = 'InnoDB';
            $table->increments('id');
            $table->string('name')->nullable();
            $table->string('lastname')->nullable();
        });
    }
    
    public function down()
    {
        Schema::dropIfExists('grcote7_movies_actors');
    }
}
