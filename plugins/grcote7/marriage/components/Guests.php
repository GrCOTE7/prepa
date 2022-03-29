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
    $gr = new Group(['name' => 'LOISIR']);
    $g  = Guest::find(2);
    $gr = $g->groups->add($gr); // NB: No impact on the DB

    $data[] = $g->id.' : '.$g->user->name.' '.($g->familly->name ?? 'No familly loaded');
    foreach ($g->groups as $gu) {
      $data[] = '    - '.($gu->id ?? 'No ID').': '.$gu->name;
    }

    return $data ?? '<p>$data est vide</p>';
    //   ->dump()
    //   ->first()
    //   ->get()
    // $data[] = str_repeat('-', 45);

    // $this->page['data'] = implode("\n<br>", $data);
  }
}
