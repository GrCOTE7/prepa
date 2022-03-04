<?php namespace Zen\Octolanding\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableCreateZenOctolandingIcontextlist extends Migration
{
    public function up()
    {
        Schema::create('zen_octolanding_icontextlist', function($table)
        {
            $table->engine = 'InnoDB';
            $table->increments('id')->unsigned();
            $table->string('name');
            $table->boolean('active');
            $table->text('block');
            $table->text('descr')->nullable();
        });

        \DB::table('zen_octolanding_icontextlist')->insert([
            [
                'active' => '1',
                'name' => 'Default - Block 1',
                'descr' => '<p>Create your own block instance and select it in the settings snippets <a href="/backend/zen/octolanding/icontextlists">go create!</a></p>',
                'block' => '[{"name":"First element","image":"","text":"<p>It`s first<\/p>\r\n"},{"name":"Two element","image":"","text":"<p>it`s two<\/p>\r\n"}]'
            
            ]
        ]);
    }
    
    public function down()
    {
        Schema::dropIfExists('zen_octolanding_icontextlist');
    }
}
