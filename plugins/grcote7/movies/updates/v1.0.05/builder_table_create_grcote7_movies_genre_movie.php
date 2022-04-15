<?php namespace Grcote7\Movies\Updates;

use Schema;
use Winter\Storm\Database\Updates\Migration;

class BuilderTableCreateGrcote7MoviesGenreMovie extends Migration
{
    public function up()
    {
        Schema::create('grcote7_movies_genre_movie', function($table)
        {
            $table->engine = 'InnoDB';
            $table->integer('movie_id');
            $table->integer('genre_id');
            $table->primary(['movie_id','genre_id']);
        });
    }
    
    public function down()
    {
        Schema::dropIfExists('grcote7_movies_genre_movie');
    }
}
