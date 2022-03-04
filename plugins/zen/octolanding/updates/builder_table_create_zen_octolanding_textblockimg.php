<?php namespace Zen\Octolanding\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableCreateZenOctolandingTextblockimg extends Migration
{
    public function up()
    {
        Schema::create('zen_octolanding_textblockimg', function($table)
        {
            $table->engine = 'InnoDB';
            $table->increments('id')->unsigned();
            $table->string('name');
            $table->text('descr')->nullable();
            $table->text('blocks');
        });

         \DB::table('zen_octolanding_textblockimg')->insert([
            [
                'name' => 'Default - Block 5',
                'blocks' => '[{"margin":"0","link":"","text1":"<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Assumenda placeat alias minus consequatur, praesentium recusandae libero, aliquam dolor numquam sapiente facere ad odit dolore adipisci earum dolorum voluptatem nam iste.<\/p>\r\n\r\n<p>Provident ad est voluptatum error sed voluptatem inventore doloremque eum tempore velit necessitatibus ipsa, accusantium dolorem impedit autem, quasi fugit obcaecati doloribus debitis. Numquam, quidem hic adipisci, ad ipsum itaque.<\/p>\r\n\r\n<p>Repellendus quibusdam nihil, porro minus ut, odio necessitatibus inventore dolore distinctio iusto aliquid fugiat repellat maiores mollitia natus aliquam error tenetur similique?&nbsp;<\/p>\r\n","image":"\/500-306a3bff518d45f2773432f4236963a0.jpg","text2":"<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Assumenda placeat alias minus consequatur, praesentium recusandae libero, aliquam dolor numquam sapiente facere ad odit dolore adipisci earum dolorum voluptatem nam iste.<\/p>\r\n\r\n<p>Provident ad est voluptatum error sed voluptatem inventore doloremque eum tempore velit necessitatibus ipsa, accusantium dolorem impedit autem, quasi fugit obcaecati doloribus debitis. Numquam, quidem hic adipisci, ad ipsum itaque.<\/p>\r\n\r\n<p>Repellendus quibusdam nihil, porro minus ut, odio necessitatibus inventore dolore distinctio iusto aliquid fugiat repellat maiores mollitia natus aliquam error tenetur similique?&nbsp;<\/p>\r\n"},{"margin":"0","link":"","text1":"<p style=\"text-align: center;\">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Assumenda placeat alias minus consequatur, praesentium recusandae libero, aliquam dolor numquam sapiente facere ad odit dolore adipisci earum dolorum voluptatem nam iste.<\/p>\r\n","image":"","text2":"\r\n"}]',
            ]
        ]);
    }
    
    public function down()
    {
        Schema::dropIfExists('zen_octolanding_textblockimg');
    }
}
