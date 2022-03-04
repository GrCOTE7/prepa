<?php namespace Zen\Octolanding\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableCreateZenOctolandingSlides extends Migration
{
    public function up()
    {
        Schema::create('zen_octolanding_slides', function($table)
        {
            $table->engine = 'InnoDB';
            $table->increments('id');
            $table->string('link');
            $table->integer('slider_id')->default(0);
            $table->string('name')->nullable();
            $table->text('desc')->nullable();
            $table->string('image')->nullable();
            $table->integer('sort_order')->nullable();
            $table->text('desc_more')->nullable();
        });

        \DB::table('zen_octolanding_slides')->insert([
            [
                'name' => 'Default Slide',
                'link' => '/backend/zen/octolanding/slides',
                'slider_id' => 1,
                'desc' => 'This default slide',
                'desc_more' => 'click on the button, start creating slides',
            ]
        ]);
    }
    
    public function down()
    {
        Schema::dropIfExists('zen_octolanding_slides');
    }
}