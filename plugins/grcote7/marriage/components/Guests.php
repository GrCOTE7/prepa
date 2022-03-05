<?php

/*
 * (c) Boosteur.com - 2022
 */

namespace Grcote7\Marriage\Components;

use Cms\Classes\ComponentBase;
use Db;

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
    //return Db::table('grcote7_marriage_guests')->get();
  }
}
