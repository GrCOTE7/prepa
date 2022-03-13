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
    //return Db::table('grcote7_marriage_guests')->get(); // ok
    // return Guest::all();
    // return Guest->mobile;
    $guests = Guest::Where('id', 2);
    $guests = Db::table('grcote7_marriage_guests')->where('id', 2)->get('mobile'); // ok
    $a      = 1;

    return $guests;
  }
}
