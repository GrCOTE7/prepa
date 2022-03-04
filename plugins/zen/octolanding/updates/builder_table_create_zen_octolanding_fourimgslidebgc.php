<?php namespace Zen\Octolanding\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableCreateZenOctolandingFourimgslidebgc extends Migration
{
    public function up()
    {
        Schema::create('zen_octolanding_fourimgslidebgc', function($table)
        {
            $table->engine = 'InnoDB';
            $table->increments('id')->unsigned();
            $table->string('name');
            $table->string('color')->nullable();
            $table->boolean('autoplay')->nullable();
            $table->integer('slider_id');
            $table->string('backgorund')->nullable();
            $table->text('descr')->nullable();
        });

        \DB::table('zen_octolanding_fourimgslidebgc')->insert([
            [
                'name' => 'Default - Block 3',
                'color' => '#f39c12',
                'slider_id' => 1,
                'descr' => '<p>Create your own block instance and select it in the settings snippets <a href="/backend/zen/octolanding/fourimgslidebgcs">go create!</a></p>',
            ]
        ]);
    }
    
    public function down()
    {
        Schema::dropIfExists('zen_octolanding_fourimgslidebgc');
    }
}
