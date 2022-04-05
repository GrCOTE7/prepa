<?php

/*
 * (c) Boosteur.com - 2022
 */

namespace Winter\Test\Models;

use Model;

/**
 * Person Model.
 */
class Person extends Model
{
  use \Winter\Storm\Database\Traits\Nullable;
  use \Winter\Storm\Database\Traits\Validation;

  /**
   * @var string the database table used by the model
   */
  public $table = 'winter_test_people';

  /**
   * @var array Dates
   */
  public $dates = ['birth', 'birthdate'];

  /**
   * @var array Rules
   */
  public $rules = [
    'name' => 'required',
  ];

  /**
   * @var array Relations
   */
  public $hasOne = [
    'phone'     => ['Winter\Test\Models\Phone', 'key' => 'person_id', 'scope' => 'isActive'],
    'alt_phone' => ['Winter\Test\Models\Phone', 'key' => 'person_id'],
    ];

  /**
   * @var array Guarded fields
   */
  protected $guarded = [];

  /**
   * @var array Fillable fields
   */
  protected $fillable = [];

  /**
   * @var array list of attribute names which are json encoded and decoded from the database
   */
  protected $jsonable = ['hobbies', 'sports'];

  /**
   * @var array list of attribute names which should be set to null when empty
   */
  protected $nullable = ['preferred_name', 'is_married'];
}
