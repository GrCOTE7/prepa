<?php namespace Zen\Octolanding\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableCreateZenOctolandingContacts extends Migration
{
    public function up()
    {
        Schema::create('zen_octolanding_contacts', function($table)
        {
            $table->engine = 'InnoDB';
            $table->increments('id')->unsigned();
            $table->string('name');
            $table->text('content')->nullable();
            $table->boolean('active_color')->nullable()->default(0);
            $table->string('color')->nullable();
            $table->boolean('active_text')->nullable()->default(1);
            $table->text('text')->nullable();
        });

        \DB::table('zen_octolanding_contacts')->insert([
            [
                'name' => 'Default - Contacts',
                'active_color' => 0,
                'active_text' => 1,
                'text' => '<p>Create your own block instance and select it in the settings snippets <a href="/backend/zen/octolanding/contacts">go create!</a>&nbsp;</p>
				<p>Also don`t forget to set up the map by the <a href="/backend/system/settings/update/grofgraf/googlemaps/settings">link</a></p>',
                'content' => '[{"name":"Phone","type":"phone","text":"+7 937 811 00 87"},{"name":"Email","type":"email","text":"team@october-studio.ru"},{"name":"Address","type":"other","text":"Russia, Saratov, ul. Moskowskaya 137\/149"}]'
            ]
        ]);
    }
    
    public function down()
    {
        Schema::dropIfExists('zen_octolanding_contacts');
    }
}
