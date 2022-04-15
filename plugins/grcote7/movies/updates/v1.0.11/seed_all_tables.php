<?php

/*
 * (c) Boosteur.com - 2022
 */

namespace Grcote7\Movies\Updates;

use Faker;
use Grcote7\Movies\Models\Actor;
use Grcote7\Movies\Models\Genre;
use Grcote7\Movies\Models\Movie;
use Winter\Storm\Database\Updates\Seeder;

// (c) Boosteur.com - 2022

class seed_all_tables extends Seeder
{
  public function run()
  {
    $faker = Faker\Factory::create();
    $movie = Movie::create([
      'name'        => 'Inception',
      'slug'        => str_slug('Inception'),
      'description' => $faker->paragraph($nbWords = 3, $variableNbSentences = true),
      'year'        => 2023,
      //   'created_at'  => timestamps(),
    ]);

    for ($i = 0; $i < 99; ++$i) {
      $name  = substr($faker->sentence($nbWords = 3, $variableNbWords = true), 0, -1);
      $movie = Movie::create([
        'name'        => $name,
        'slug'        => str_slug($name),
        'description' => $faker->paragraph($nbWords = 3, $variableNbSentences = true),
        'year'        => $faker->year($max = 'now'),
        // 'created_at'  => timestamps(),
      ]);
    }

    $actors = [
      [
        'name'     => 'Leonardo',
        'lastname' => 'Di Caprio',
      ],
      [
        'name'     => 'Ellen',
        'lastname' => 'Page',
      ],
      [
        'name'     => 'Brad',
        'lastname' => 'Pitt', ],
      [
        'name'     => 'Kevin',
        'lastname' => 'Spacey',
      ],
      [
        'name'     => 'Edward',
        'lastname' => 'Norton',
      ],
      [
        'name'     => 'John',
        'lastname' => 'Cusack',
      ],
      [
        'name'     => 'John',
        'lastname' => 'Wayne',
      ],
    ];
    for ($i = 0; $i < 93; ++$i) {
      $actors[] = [
        'name'     => $faker->firstname(),
        'lastname' => $faker->lastname(),
      ];
    }
    foreach ($actors as $actor) {
      Actor::create([
        'name'     => $actor['name'],
        'lastname' => $actor['lastname'],
      ]);
    }

    $genres = ['Action', 'Comedy', 'Science Fiction', 'Drama', 'Adult', 'Romance', 'Documentary'];
    sort($genres);

    foreach ($genres as $genre) {
      Genre::create([
        'slug'        => str_slug($genre),
        'genre_title' => $genre,
      ]);
    }
  }
}
