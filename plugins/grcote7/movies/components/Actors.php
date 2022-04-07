<?php

/*
 * (c) Boosteur.com - 2022
 */

namespace Grcote7\Movies\Components;

use Cms\Classes\ComponentBase;
use Grcote7\Movies\Models\Actor;

class Actors extends ComponentBase
{
  public $actors;

  /**
   * Gets the details for the component.
   */
  public function componentDetails()
  {
    return [
      'name'        => 'Actors List',
      'description' => 'List of actors',
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
    $this->actors = $this->loadActors();
    // $this->page['actors'] = $this->actors;
    return $this->actors;
  }

  protected function loadActors()
  {
    return Actor::all();
  }
}
