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
    // $cas = Guest::hasMobile14Characters()->idSupX(2)->select('id', 'mobile')->get();
    $guest         = Guest::find(3);
    $guest->mobile = '01 23 45 67 89 - '.now();
    $guest->save();
    dump($guest->mobile, $guest->oldvalue);
    $cas = 'Ancienne valeur : '.$guest->oldvalue.'<br>Nouvelle valeur : '.$guest->mobile;
    // dd($guest);
    $a = 1;

    return $cas ?? '$cas vide';
    //return Guest::latest()->first();
  }
}
