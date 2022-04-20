<?php

/*
 * (c) Boosteur.com - 2022
 */

namespace Grcote7\Movies\Models;

use Winter\Storm\Database\Model;

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
  public $nbRep;
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

  /**
   * @var array Validation rules
   */
  public $rules = [
  ];

  // protected $jsonable = ['actors'];
  public static $allowedSortingOptions = [
    'name'      => 'Name - desc',
    'name asc'  => 'Name - asc',
    'year desc' => 'Year - desc',
    'year asc'  => 'Year - asc',
  ];

  //   protected $fillable = ['name', 'slug', 'description', 'year'];
  protected $fillable = ['name'];

  public function scopeListFrontEnd($query, $options = [])
  {
    extract(array_merge([
      'page'    => 1,
      'perPage' => 3,
      'sort'    => 'created_at desc',
      'genres'  => null,
      'year'    => '',
    ], $options));

    if (!\is_array($sort)) {
      $sort = [$sort];
    }
    foreach ($sort as $_sort) {
      if (\in_array($_sort, array_keys(self::$allowedSortingOptions), true)) {
        $parts = explode(' ', $_sort);
        if (\count($parts) < 2) {
          array_push($parts, 'desc');
        }
        list($sortField, $sortDirection) = $parts;

        $query->orderBy($sortField, $sortDirection);
      }
    }

    if (null !== $genres) {
      if (!\is_array($genres)) {
        $genres = [$genres];
      }
      foreach ($genres as $genre) {
        $query->whereHas('genres', function ($q) use ($genre) {
          $q->where('id', $genre);
        });
      }
    }

    $lastPage = $query->paginate($perPage, $page)->lastPage();

    if ($lastPage < $page) {
      $page = 1;
    }

    if ($year) {
      //   $this->page['year'] = $year;
      $query->where('year', $year);
    }
    // $this->nbRep = $query->count();
    // echo $this->nbRep;

    return $query->paginate($perPage, $page);
  }
}
