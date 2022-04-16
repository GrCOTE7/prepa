<?php

/*
 * (c) Boosteur.com - 2022
 */

namespace Grcote7\Movies\Components;

use Cms\Classes\ComponentBase;
use Grcote7\Movies\Models\Movie;

class Filtermovies extends ComponentBase
{
  public $movies;

  /**
   * Gets the details for the component.
   */
  public function componentDetails()
  {
    return [
      'name'        => 'Filter Movies',
      'description' => 'Filter the movies',
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
    $this->movies = $this->filterMovies();
  }

  protected function filterMovies()
  {
    return Movie::all();
  }
}
