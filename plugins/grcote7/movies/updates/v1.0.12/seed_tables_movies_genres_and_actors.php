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

class seed_tables_movies_genres_and_actors extends Seeder
{
  public function run()
  {
    $faker  = Faker\Factory::create();
    $movies = Movie::all();

    foreach ($movies as $movie) {
      $genres        = Genre::all();
      $genres        = $genres->random(rand(2, $genres->count()) - 2);
      $movie->genres = $genres;

      $actors        = Actor::all()->random(3);
      $movie->actors = $actors;

      $movie->created_at = $faker->datetime($max = 'now');
      $movie->published  = $faker->boolean($chanceOfGettingTrue = 50);
      $movie->save();
    }
  }
}
