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
    return [
      'results' => [
        'title'             => 'Number of actors',
        'description'       => 'How many actors do you want to display ?',
        'default'           => 0,
        'validationPattern' => '^[0-9]+$',
        'validationMessage' => 'Only numbers allowed',
      ],
      'sortOrder' => [
        'title'       => 'Sort Actors',
        'description' => 'Sort those actors',
        'type'        => 'dropdown',
        'default'     => 'name asc',
      ],
     ];
  }

  public function onRun()
  {
    $this->actors = $this->loadActors();
  }

  public function getSortOrderOptions()
  {
    return [
      'name asc'      => 'Name (ascending)',
      'name desc'     => 'Name (descending)',
      'lastname asc'  => 'Lastname (ascending)',
      'lastname desc' => 'Lastname descending)',
    ];
  }

  protected function loadActors()
  {
    $query = Actor::all();
    $field = explode(' ', $this->property('sortOrder'));

    if ('asc' === $field[1]) {
      $query = $query->sortBy($field[0]);
    } else {
      $query = $query->sortByDesc($field[0]);
    }
    if ($this->property('results') > 0) {
      return $query->take($this->property('results'));
    }

    return $query;
  }
}
