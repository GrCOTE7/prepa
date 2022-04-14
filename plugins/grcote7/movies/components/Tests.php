<?php

/*
 * (c) Boosteur.com - 2022
 */

namespace Grcote7\Movies\Components;

use Cms\Classes\ComponentBase;
use Grcote7\Movies\Models\Actor;

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
    // $actors = Actor::all();
    // foreach ($actors as $actor) {
    //   $list[]['name']     = '"name" => '.$actor->name.',<br>';
    //   $list[]['lastname'] = '"lastname" => '.$actor->lastname.',<br>';
    //   //   $list['lastname'] = $actor->lastname;
    // }
    // // $this->data = print_r($list, 1);
    // return print_r($list, 1);
  }
}
