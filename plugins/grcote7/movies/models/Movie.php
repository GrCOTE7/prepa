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
}
