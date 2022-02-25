<?php

/*
 * (c) Boosteur.com - 2022
 */

namespace GrCote7\WinterLearning\Components;

use Cms\Classes\ComponentBase;

class Ajax extends ComponentBase
{
  public function componentDetails()
  {
    return [
      'name'        => 'Ajax Component',
      'description' => 'A simple example of Ajax use',
    ];
  }

  public function defineProperties()
  {
    return [];
  }

  public function onTest()
  {
    $this->page['result'] = input('value1') + input('value2');
  }
}
