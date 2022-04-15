<?php

/*
 * (c) Boosteur.com - 2022
 */

namespace Grcote7\Movies\Components;

use Cms\Classes\ComponentBase;
use Grcote7\Movies\Models\Actor;
use Grcote7\Movies\Models\Genre;

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
    $genres = Genre::all();
    $genres = $genres->random(rand(1, $genres->count()));

    // $actors = Actor::all();
    // foreach ($actors as $actor) {
    //   $list[]['name']     = '"name" => '.$actor->name.',<br>';
    //   $list[]['lastname'] = '"lastname" => '.$actor->lastname.',<br>';
    //   //   $list['lastname'] = $actor->lastname;
    // }
    // $genres = $genres->count();
    // $this->data = $genres;
    $this->data = 123;    // return print_r($list, 1);
  }
}
