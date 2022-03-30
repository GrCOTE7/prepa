<?php

/*
 * (c) Boosteur.com - 2022
 */

namespace Grcote7\Marriage\Models;

use Model;
use Winter\User\Models\User;

/**
 * Familly Model.
 */
class Familly extends Model
{
  use \Winter\Storm\Database\Traits\Validation;

  /**
   * @var string the database table used by the model
   */
  public $table = 'grcote7_marriage_famillies';

  /**
   * @var array Validation rules for attributes
   */
  public $rules = [];

  /**
   * @var array Relations
   */
  public $hasOne         = [];
  public $hasMany        = ['guests' => Guest::class];
  public $hasOneThrough  = [];
  public $hasManyThrough = [];
  public $belongsTo      = [];
  public $belongsToMany  = [];
  public $morphTo        = [];
  public $morphOne       = [];
  public $morphMany      = [];
  public $attachOne      = [];
  public $attachMany     = [];

  /**
   * @var array Guarded fields
   */
  protected $guarded = ['*'];

  /**
   * @var array Fillable fields
   */
  protected $fillable = ['name', 'user_id'];

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

  public function getThis()
  {
    return $this;
  }

  public function getEmailFamillyChief()
  {
    $chief = User::With('guest')->find(
      $this->guests->where('id', $this->guest_id)
        // ->dump()
        ->first()
        ->user_id
    )
      ->email;
      return $chief;
  }
}
