<?php

/*
 * (c) Boosteur.com - 2022
 */

namespace Grcote7\Marriage\Models;

use Model;

/**
 * Contact Model.
 */
class Group extends Model
{
  use \Winter\Storm\Database\Traits\Validation;

  /**
   * @var string the database table used by the model
   */
  public $table = 'grcote7_marriage_groups';

  /**
   * @var array Validation rules for attributes
   */
  public $rules = [];

  /**
   * @var array Relations
   */
  public $hasOne         = [];
  public $hasMany        = [];
  public $hasOneThrough  = [];
  public $hasManyThrough = [];
  public $belongsTo      = [];
  public $belongsToMany  = [
    'guests' => [
      'Grcote7\Marriage\Models\Guest',
      'table' => 'grcote7_marriage_group_guest',
    ],
  ];
  public $morphTo  = [];
  public $morphOne = [
    'photo' => [
        'Grcote7\Marriage\Models\Photo',
        'name'  => 'imageable',
        'table' => 'grcote7_marriage_photos',
      ],
];
  public $morphMany  = [];
  public $attachOne  = [];
  public $attachMany = [];

  /**
   * @var array Guarded fields
   */
  protected $guarded = ['*'];

  /**
   * @var array Fillable fields
   */
  protected $fillable = ['name'];

  /**
   * @var array Attributes to be cast to native types
   */
  protected $casts = [];

  /**
   * @var array Attributes to be cast to JSON
   */
  protected $jsonable = [];

  /**
   * @var array Attributes to be appended to the API representation of the model (ex. toArray())
   */
  protected $appends = [];

  /**
   * @var array Attributes to be removed from the API representation of the model (ex. toArray())
   */
  protected $hidden = [];

  /**
   * @var array Attributes to be cast to Argon (Carbon) instances
   */
  protected $dates = [
    'created_at',
    'updated_at',
  ];
}
