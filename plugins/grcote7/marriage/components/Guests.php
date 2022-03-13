<?php

/*
 * (c) Boosteur.com - 2022
 */

namespace Grcote7\Marriage\Components;

use Cms\Classes\ComponentBase;
use Db;
use Grcote7\Marriage\Models\Guest;

class Guests extends ComponentBase
{
  public function componentDetails()
  {
    return [
      'name'        => 'Guests Component',
      'description' => 'Guests Managment',
    ];
  }

  public function defineProperties()
  {
    return [];
  }

  public function onRun()
  {
    $guests = Guest::Where('id', 2)->select('id', 'user_id','mobile')->get();
    $a      = 1;

    return $guests;
  }
}
