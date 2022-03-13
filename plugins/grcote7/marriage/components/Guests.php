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
    $guest          = new Guest();
    $guest->user_id = 3;
    $guest->mobile  = 'Num mobile JC';
    $a              = 1;
    // $guest->save();

    // Guest::create(['user_id' => 5, 'mobile' => 'Num GSM']);

    return Guest::latest()->first();
  }
}
