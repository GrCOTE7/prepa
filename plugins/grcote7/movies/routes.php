<?php

/*
 * (c) Boosteur.com - 2022
 */

use Grcote7\Movies\Models\Actor;
use Grcote7\Movies\Models\Genre;
use Grcote7\Movies\Models\Movie;
use Illuminate\Support\Facades\Response;

// (c) Boosteur.com - 2022

Route::get('/seed-actors', function () {
  DB::table('grcote7_movies_actors')->truncate();

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
  $faker = Faker\Factory::create();

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

  return 'Actors created';
});

Route::get('sitemap.xml', function () {
  $movies = Movie::all();
  $genres = Genre::all();

  return Response::view('grcote7.movies::sitemap', ['movies' => $movies, 'genres' => $genres])->header('Content-type', 'text/xml');
});
