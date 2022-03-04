<?php namespace Zen\Octolanding\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableCreateZenOctolandingSliders extends Migration
{
    public function up()
    {
        Schema::create('zen_octolanding_sliders', function($table)
        {
            $table->engine = 'InnoDB';
            $table->increments('id');
            $table->string('name')->nullable();
        });

        \DB::table('zen_octolanding_sliders')->insert([
            [
                'name' => 'Default Slider',
            ]
        ]);
    }
    
    public function down()
    {
        Schema::dropIfExists('zen_octolanding_sliders');
    }
}
