<?php

/*
 * (c) Boosteur.com - 2022
 */

namespace Grcote7\Marriage\Components;

use Cms\Classes\ComponentBase;
use Grcote7\Marriage\Models\Guest;

class Guests extends ComponentBase
{
  public function componentDetails()
  {
    return [
      'name'        => 'Guests Component',
      'description' => 'Guests Managment',
    ];
    //2do fix Debugbar: Wait a compatible version with Laravel 9
  }

  public function defineProperties()
  {
    return [];
  }

  public function onRun()
  {
    $gdb = 'grcote7_marriage_guests';
    $fdb = 'grcote7_marriage_famillies';

    $data = Guest::find(1)
    //   ->dump()
      ->first()
    //   ->get()
      ->familly
;

    return $data ?? '<p>$data est vide</p>';
  }
}
