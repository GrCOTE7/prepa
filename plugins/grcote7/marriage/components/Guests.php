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
  }

  public function defineProperties()
  {
    return [];
  }

  public function onRun()
  {
    //$guest = Guest::find(7);
    //$guest->delete();
    //dd($guest);

    //Guest::destroy(8, 9);

    //$gs = Guest::where('id', '>', 3)->delete();

    return Guest::latest()->first();
  }
}
