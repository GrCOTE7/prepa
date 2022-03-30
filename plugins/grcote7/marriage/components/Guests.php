<?php

/*
 * (c) Boosteur.com - 2022
 */

namespace Grcote7\Marriage\Components;

use Cms\Classes\ComponentBase;
use Grcote7\Marriage\Models\Group;
use Grcote7\Marriage\Models\Guest;
use Winter\User\Models\User;

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
    // Relation 1-1
    $g      = Guest::find(2);
    $data[] = $g->user->name;

    $loisir       = new Group();
    $loisir->name = 'Loisir';

    $other       = new Group();
    $other->name = 'Other';

    $ngs = [$loisir, $other];

    // $ng = $g->groups->addMany($ngs);

    // $data[] = $g->groups;
    $data[] = $g->mobile;

    $data[] = str_repeat('-', 45);

    // reverse relation 1-1
    $u = User::find(5);

    // $data[] = $g->groups;

    $data[] = $u->name;
    $data[] = $u->guest->mobile;

    return $data ?? '<p>$data est vide</p>';
    //   ->dump()
    //   ->first()
    //   ->get()
    // $data[] = str_repeat('-', 45);

    // $this->page['data'] = implode("\n<br>", $data);
  }
}
