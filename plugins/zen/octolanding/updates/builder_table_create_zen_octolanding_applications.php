<?php namespace Zen\Octolanding\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableCreateZenOctolandingApplications extends Migration
{
    public function up()
    {
        Schema::create('zen_octolanding_applications', function($table)
        {
            $table->engine = 'InnoDB';
            $table->increments('id')->unsigned();
            $table->timestamp('created_at')->nullable();
            $table->timestamp('updated_at')->nullable();
            $table->string('name');
            $table->string('phone');
            $table->boolean('active');
        });
    }
    
    public function down()
    {
        Schema::dropIfExists('zen_octolanding_applications');
    }
}
