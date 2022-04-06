<?php namespace Grcote7\Movies\Updates;

use Schema;
use Winter\Storm\Database\Updates\Migration;

class BuilderTableCreateGrcote7MoviesGenres extends Migration
{
    public function up()
    {
        Schema::create('grcote7_movies_genres', function($table)
        {
            $table->engine = 'InnoDB';
            $table->increments('id');
            $table->string('genre_title');
            $table->string('slug');
        });
    }
    
    public function down()
    {
        Schema::dropIfExists('grcote7_movies_genres');
    }
}
