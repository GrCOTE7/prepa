<?php

/*
 * (c) Boosteur.com - 2022
 */

namespace Grcote7\Marriage\Components;

use Cms\Classes\ComponentBase;
use Grcote7\Marriage\Models\Familly;

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

    $data = Familly::find(3)->guests()->where('mobile', 'like', '%23%')
    //   ->dump()
    //   ->first()
      ->get()
;

    return $data ?? '<p>$data est vide</p>';
  }
}
