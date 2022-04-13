<?php

/*
 * (c) Boosteur.com - 2022
 */

namespace Grcote7\Movies\Models;

use Model;

/**
 * Model.
 */
class Movie extends Model
{
  use \Winter\Storm\Database\Traits\Validation;

  /*
   * Disable timestamps by default.
   * Remove this line if timestamps are defined in the database table.
   */
  public $timestamps = false;

  /**
   * Relations.
   */
  public $belongsToMany = [
    'actors' => [
      'Grcote7\Movies\Models\Actor',
      'table' => 'grcote7_movies_actors_movies',
      'order' => 'name',
    ],
    'genres' => [
      'Grcote7\Movies\Models\Genre',
      'table' => 'grcote7_movies_genres_movies',
      'order' => 'genre_title',
    ],
];

  public $attachOne = [
    'poster' => 'System\Models\File',
  ];

  public $attachMany = [
    'movie_gallery' => 'System\Models\File',
  ];

  /**
   * @var string the database table used by the model
   */
  public $table = 'grcote7_movies_movies';

//   public $fillable = ['name', 'slug', 'description', 'year'];

  /**
   * @var array Validation rules
   */
  public $rules = [
  ];

  // protected $jsonable = ['actors'];
}
