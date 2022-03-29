<?php

/*
 * (c) Boosteur.com - 2022
 */

namespace Grcote7\Marriage\Components;

use Cms\Classes\ComponentBase;
use Grcote7\Marriage\Models\Group;
use Grcote7\Marriage\Models\Guest;

class Guests extends ComponentBase
{
  public function componentDetails()
  {
    return [
      'name'        => 'Guests Component',
      'description' => 'Guests Managment',
    ];
    //2do fix Debugbar: Wait a compatible version with Laravel 9
  }

  public function defineProperties()
  {
    return [];
  }

  public function onRun()
  {
    // $gt = 'grcote7_marriage_guests';
    // $ft  = 'grcote7_marriage_famillies';
    // $ggt = 'grcote7_marriage_group_guest';

    /**
     *@i Without with('relation'): Lazy loading: Every line is a request to have user->name
     *@i With with(): Eager loading: Just 1 request and all is loaded, ready tobe accessed
     */
    $gs = Guest::with(['user', 'familly' => function ($q) {
      $q->where('name', 'like', 'COTE');
    }, 'groups'])
        //   ->dump()
      ->get();
    foreach ($gs as $g) {
      //   $data[] = $g->user->name.' ( '.implode('', $g->famillies).' )';
      //   $data[] = $g->user->name;

      $data[] = ($g->user->name ?? 'no name').' '.($g->familly->name ?? 'no familly');
    }

    // $data[] = str_repeat('-', 45);
    return $data ?? '<p>$data est vide</p>';
    //   ->dump()
    //   ->first()
    //   ->get()

    // $this->page['data'] = implode("\n<br>", $data);
  }
}
