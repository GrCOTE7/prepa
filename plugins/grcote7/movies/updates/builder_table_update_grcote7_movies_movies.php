<?php namespace Grcote7\Movies\Updates;

use Schema;
use Winter\Storm\Database\Updates\Migration;

class BuilderTableUpdateGrcote7MoviesMovies extends Migration
{
    public function up()
    {
        Schema::rename('grcote7_movies_', 'grcote7_movies_movies');
    }
    
    public function down()
    {
        Schema::rename('grcote7_movies_movies', 'grcote7_movies_');
    }
}
