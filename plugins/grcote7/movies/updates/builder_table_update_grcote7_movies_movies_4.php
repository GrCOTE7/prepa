<?php namespace Grcote7\Movies\Updates;

use Schema;
use Winter\Storm\Database\Updates\Migration;

class BuilderTableUpdateGrcote7MoviesMovies4 extends Migration
{
    public function up()
    {
        Schema::table('grcote7_movies_movies', function($table)
        {
            $table->dropColumn('actors');
        });
    }
    
    public function down()
    {
        Schema::table('grcote7_movies_movies', function($table)
        {
            $table->text('actors')->nullable();
        });
    }
}
