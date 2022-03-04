<?php namespace Grcote7\Marriage\Updates;

use Schema;
use Winter\Storm\Database\Schema\Blueprint;
use Winter\Storm\Database\Updates\Migration;

class CreateGuestsTable extends Migration
{
    public function up()
    {
        Schema::create('grcote7_marriage_guests', function (Blueprint $table) {
            $table->engine = 'InnoDB';
            $table->increments('id');
            $table->timestamps();
        });
    }

    public function down()
    {
        Schema::dropIfExists('grcote7_marriage_guests');
    }
}
