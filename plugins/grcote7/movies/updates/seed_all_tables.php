<?php

/*
 * (c) Boosteur.com - 2022
 */

namespace Grcote7\Movies\Updates;

use Faker;
use Grcote7\Movies\Models\Movie;
use Winter\Storm\Database\Updates\Seeder;

// (c) Boosteur.com - 2022

class seed_all_tables extends Seeder
{
  public function run()
  {
    $faker = Faker\Factory::create();
    for ($i = 0; $i < 100; ++$i) {
      $name  = $faker->sentence($nbWords = 3, $variableNbWords = true);
      $movie = Movie::create([
        'name'        => $name,
        'slug'        => str_slug($name),
        'description' => $faker->paragraph($nbWords = 3, $variableNbSentences = true),
        'year'        => $faker->year($max = 'now'),
      ]);
    }
  }
}
