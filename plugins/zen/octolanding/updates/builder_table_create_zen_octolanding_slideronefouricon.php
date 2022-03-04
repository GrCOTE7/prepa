<?php namespace Zen\Octolanding\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableCreateZenOctolandingSlideronefouricon extends Migration
{
    public function up()
    {
        Schema::create('zen_octolanding_slideronefouricon', function($table)
        {
            $table->engine = 'InnoDB';
            $table->increments('id')->unsigned();
            $table->string('name');
            $table->text('icons');
            $table->string('right_block_name');
            $table->string('left_block_name');
            $table->integer('slider_id');
            $table->text('descr')->nullable();
        });

         \DB::table('zen_octolanding_slideronefouricon')->insert([
            [
                'name' => 'Default - Block 4',
                'right_block_name' => 'Icons',
                'slider_id' => 1,
                'left_block_name' => 'Slider element',
                'descr' => '<p>Create your own block instance and select it in the settings snippets <a href="/backend/zen/octolanding/slideronefouricons">go create!</a></p>',
                'icons' => '[{"name":"Element 1","text":"<p>Here a small description in the form of text.We recommend no more than 4 icons<\/p>\r\n","image":""},{"name":"Element 2","text":"<p>Here a small description in the form of text.We recommend no more than 4 icons<\/p>\r\n","image":""},{"name":"Element 3","text":"<p>Here a small description in the form of text.We recommend no more than 4 icons<\/p>\r\n","image":""},{"name":"Element 4","text":"<p>Here a small description in the form of text.We recommend no more than 4 icons<\/p>\r\n","image":""}]',
            ]
        ]);
    }
    
    public function down()
    {
        Schema::dropIfExists('zen_octolanding_slideronefouricon');
    }
}
