<?php namespace Zen\Octolanding\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableUpdateZenOctolandingTwotilestextslide extends Migration
{
    public function up()
    {
        Schema::table('zen_octolanding_twotilestextslide', function($table)
        {
            $table->boolean('full_display')->nullable();
        });
    }
    
    public function down()
    {
        Schema::table('zen_octolanding_twotilestextslide', function($table)
        {
            $table->dropColumn('full_display');
        });
    }
}
