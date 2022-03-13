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
    $guest         = Guest::find(3);
    $guest->mobile = '01 23 45 67 89';
    $guest->save();

    $cas = $guest->mobile;

    // $this->page['data'] = $cas ?? '$cas est vide';
    return $cas ?? '<p>$cas est vide</p>';
  }
}
