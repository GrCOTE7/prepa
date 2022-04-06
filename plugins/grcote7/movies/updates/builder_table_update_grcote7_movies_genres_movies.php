<?php namespace Grcote7\Movies\Updates;

use Schema;
use Winter\Storm\Database\Updates\Migration;

class BuilderTableUpdateGrcote7MoviesGenresMovies extends Migration
{
    public function up()
    {
        Schema::rename('grcote7_movies_genre_movie', 'grcote7_movies_genres_movies');
    }
    
    public function down()
    {
        Schema::rename('grcote7_movies_genres_movies', 'grcote7_movies_genre_movie');
    }
}
