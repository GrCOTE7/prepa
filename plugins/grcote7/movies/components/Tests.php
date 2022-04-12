<?php

/*
 * (c) Boosteur.com - 2022
 */

namespace Grcote7\Movies\Components;

use Cms\Classes\ComponentBase;
use Faker;

class Tests extends ComponentBase
{
  public $data;

  /**
   * Gets the details for the component.
   */
  public function componentDetails()
  {
    return [
      'name'        => 'Tests Component',
      'description' => 'For quick tests...',
    ];
  }

  /**
   * Returns the properties provided by the component.
   */
  public function defineProperties()
  {
    return [];
  }

  public function onRun()
  {
    $faker = Faker\Factory::create();

    $this->data = $faker->name();
  }
}
