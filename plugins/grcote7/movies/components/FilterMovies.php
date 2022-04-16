<?php

/*
 * (c) Boosteur.com - 2022
 */

namespace Grcote7\Movies\Components;

use Cms\Classes\ComponentBase;
use Grcote7\Movies\Models\Movie;
use Winter\Storm\Support\Facades\Input;

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
    $year = Input::get('year');

    $q = Movie::all();

    if ($year) {
      $q = Movie::where('year', $year)->get();
    }

    return $q;
  }
}
