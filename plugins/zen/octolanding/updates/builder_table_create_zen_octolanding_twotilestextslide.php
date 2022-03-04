<?php namespace Zen\Octolanding\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableCreateZenOctolandingTwotilestextslide extends Migration
{
    public function up()
    {
        Schema::create('zen_octolanding_twotilestextslide', function($table)
        {
            $table->engine = 'InnoDB';
            $table->increments('id')->unsigned();
            $table->string('name');
            $table->text('blocks');
            $table->text('descr')->nullable();
            $table->string('link')->nullable();
            $table->string('link_button')->nullable();
        });

        \DB::table('zen_octolanding_twotilestextslide')->insert([
            [
                'name' => 'Default - Block 2',
                'blocks' => '[{"is_inverse":"0","name":"Element 1","slider_id":"1","text":"<p>Here you can place your text. Click the button to create your own block instance.<\/p>\r\n","link":"","link_button":"\/backend\/zen\/octolanding\/twotilestextslides"},{"is_inverse":"1","name":"Element 2","slider_id":"1","text":"<p>Here you can place your text. Click the button to create your own block instance.<\/p>\r\n","link":"","link_button":"\/backend\/zen\/octolanding\/twotilestextslides"}]',
            ]
        ]);
    }
    
    public function down()
    {
        Schema::dropIfExists('zen_octolanding_twotilestextslide');
    }
}
