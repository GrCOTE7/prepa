<?php

/*
 * (c) Boosteur.com - 2022
 */

namespace Grcote7\Movies;

use System\Classes\PluginBase;

class Plugin extends PluginBase
{
  public function registerComponents()
  {
    return [
      'Grcote7\Movies\Components\Tests'        => 'tests',
      'Grcote7\Movies\Components\FilterMovies' => 'filtermovies',
      'Grcote7\Movies\Components\Actors'       => 'actors',
      'Grcote7\Movies\Components\ActorForm'    => 'actorform',
    ];
  }

  public function registerFormWidgets()
  {
    return [
      'Grcote7\Movies\FormWidgets\Actorbox' => [
        'label' => 'Actorbox',
        'code'  => 'actorbox',
      ],
    ];
  }

  public function registerSettings()
  {
  }

  public function boot()
  {
    \Event::listen('offline.sitesearch.query', function ($query) {
      // The controller is used to generate page URLs.
      $controller = \Cms\Classes\Controller::getController() ?? new \Cms\Classes\Controller();

      // Search your plugin's contents
      $items = \Grcote7\Movies\Models\Movie::
      where('name', 'like', "%${query}%")
        ->orWhere('description', 'like', "%${query}%")
        ->get();

      // Now build a results array
      $results = $items->map(function ($item) use ($query, $controller) {
        // If the query is found in the title, set a relevance of 2
        $relevance = false !== mb_stripos($item->title, $query) ? 2 : 1;

        // Optional: Add an age penalty to older results. This makes sure that
        // newer results are listed first.
        // if ($relevance > 1 && $item->created_at) {
        //    $ageInDays = $item->created_at->diffInDays(\Illuminate\Support\Carbon::now());
        //    $relevance -= \OFFLINE\SiteSearch\Classes\Providers\ResultsProvider::agePenaltyForDays($ageInDays);
        // }

        return [
          'title'     => $item->name,
          'text'      => $item->description,
          'url'       => '/movie/'.$item->slug,
          'thumb'     => optional($item->poster)->first(), // Instance of System\Models\File
          'relevance' => $relevance, // higher relevance results in a higher
          // position in the results listing
          // 'meta' => 'data',       // optional, any other information you want
          // to associate with this result
          // 'model' => $item,       // optional, pass along the original model
        ];
      });

      return [
        'provider' => 'Movie', // The badge to display for this result
        'results'  => $results,
      ];
    });
  }
}
