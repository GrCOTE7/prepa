<?php

/*
 * (c) Boosteur.com - 2022
 */

namespace Grcote7\Movies\Updates;

use Faker;
use Grcote7\Movies\Models\Movie;
use Winter\Storm\Database\Updates\Seeder;

// (c) Boosteur.com - 2022

class seed_new_fields_table_movies extends Seeder
{
  public function run()
  {
    $faker = Faker\Factory::create();

    for ($i = 1; $i < 101; ++$i) {
      $movie = Movie::where('id', $i)
        ->update([
          'created_at' => $faker->datetime(),
          'published'  => $faker->boolean(),
        ]);
    }
  }
}
