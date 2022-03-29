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
    /** //@q Works well (Note: wn with L9) */
    $g  = Guest::find(3);
    $gr = new Group(['name' => 'LOISIR']); // Note: Doesn't exists in the DB
    $gr = $g->groups->add($gr);

    $data[] = $this->getListing($g);
    $data[] = str_repeat('-', 45);

    $g2    = Guest::find(4);
    $gr2[] = new Group(['name' => 'LOISIR']);
    $gr2[] = new Group(['name' => 'OTHER']);
    foreach ($gr2 as $gru) {
      $g2->groups->add($gru);
    }

    $data[] = $this->getListing($g2);
    $data[] = str_repeat('-', 45);

    return $data ?? '<p>$data est vide</p>';
    //   ->dump()
    //   ->first()
    //   ->get()
    // $data[] = str_repeat('-', 45);

    // $this->page['data'] = implode("\n<br>", $data);
  }

  protected function getListing($g)
  {
    $data[] = $g->id.' : '.$g->user->name.' '.($g->familly->name ?? 'No familly loaded');
    foreach ($g->groups as $gu) {
      $data[] = '    - '.($gu->id ?? 'No ID').': '.$gu->name;
    }

    return $data;
  }
}
