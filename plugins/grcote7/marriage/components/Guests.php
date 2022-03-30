<?php

/*
 * (c) Boosteur.com - 2022
 */

namespace Grcote7\Marriage\Components;

use Cms\Classes\ComponentBase;
use Grcote7\Marriage\Models\Familly;
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
    // Relation 1-M
    $f      = Familly::With('guests')->find(2);
    $data[] = $f->name;
    $data[] = $f->getEmailFamillyChief();
    $data[] = $f->guests;

    $data[] = str_repeat('-', 45);

    // reverse relation 1-M
    $g      = Guest::find(1);
    $data[] = 'Familly : '.$g->familly->name.' Chief : '.$g->familly->getEmailFamillyChief();

    return $data ?? '<p>$data est vide</p>';
    //   ->dump()
    //   ->first()
    //   ->get()
    // $data[] = str_repeat('-', 45);

    // $this->page['data'] = implode("\n<br>", $data);
  }
}
