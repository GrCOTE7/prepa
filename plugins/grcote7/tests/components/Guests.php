<?php

/*
 * (c) Boosteur.com - 2022
 */

namespace Grcote7\Tests\Components;

use Cms\Classes\ComponentBase;

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
}
