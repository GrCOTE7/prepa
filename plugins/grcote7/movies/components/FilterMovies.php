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
    $year  = Input::get('year');
    $genre = Input::get('genre');

    if ($year) {
      $this->page['year'] = $year;
      $q                  = Movie::where('year', $year)->get();
    }
    if ($genre) {
      $this->page['genre'] = $genre;
      if ('unknow' === $genre) {
        $q = Movie::has('genres', '<', 1)->get();
      } else {
        $q = Movie::whereHas('genres', function ($filter) use ($genre) {
          $filter->where('slug', $genre);
        })->get();
      }
    }

    if (!$year && !$genre) {
      $q = Movie::all();
    }

    $this->page['nbRep'] = $q->count();

    return $q;
  }
}
