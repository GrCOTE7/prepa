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
    // Relation M-M
    $gs     = Guest::find(2);
    $data[] = $gs->mobile;
    $data[] = str_repeat(' ', 45);

    // $data[] = $gs->groups;
    foreach ($gs->groups as $g) {
      $data[] = $g->name;
    }

    $data[] = str_repeat('-', 45);

    // reverse relation M-M

    $gr     = Group::find(2);
    $data[] = $gr->name;
    // $data[] = $gr->guests;
    foreach ($gr->guests as $g) {
      $data[] = $g->user->name;
    }

    return $data ?? '<p>$data est vide</p>';
    //   ->dump()
    //   ->first()
    //   ->get()
    // $data[] = str_repeat('-', 45);

    // $this->page['data'] = implode("\n<br>", $data);
  }
}
