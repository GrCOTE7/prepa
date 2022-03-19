<?php

/*
 * (c) Boosteur.com - 2022
 */

namespace GrCote7\Tests\Components;

use Cms\Classes\ComponentBase;

class Variables extends ComponentBase
{
  public function componentDetails()
  {
    return [
      'name'        => 'Variables Component',
      'description' => 'Passage de variables',
    ];
  }

  public function defineProperties()
  {
    return [];
  }

  public function onRun()
  {
    // This code will be executed when the page or layout is
    // loaded and the component is attached to it.

    $this->page['var'] = 123; // Inject some variable to the page

    // if (true) {
    //   return 123;
    // }
  }
}
