<?php namespace Grcote7\Movies\Updates;

use Schema;
use Winter\Storm\Database\Updates\Migration;

class BuilderTableUpdateGrcote7MoviesMovies5 extends Migration
{
    public function up()
    {
        Schema::table('grcote7_movies_movies', function($table)
        {
            $table->timestamp('created_at')->nullable();
            $table->boolean('published')->nullable();
        });
    }
    
    public function down()
    {
        Schema::table('grcote7_movies_movies', function($table)
        {
            $table->dropColumn('created_at');
            $table->dropColumn('published');
        });
    }
}
