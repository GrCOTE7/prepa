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
    $gr2    = Group::find(2);
    $gr3    = Group::find(3);
    $data[] = $gr2->name;
    $data[] = $gr3->name;

    $g      = Guest::find(5);
    $data[] = $g->user->name;

    $gr = $g->groups()->add($gr2);
    $gr = $g->groups()->add($gr3);

    return $data ?? '<p>$data est vide</p>';
    //   ->dump()
    //   ->first()
    //   ->get()
    // $data[] = str_repeat('-', 45);

    $this->page['data'] = implode("\n<br>", $data);
  }

  /**
   *  Complete line for good alignement of EOL ( ' " ' ).
   *
   * @param mixed $msg
   */
  public function cpl($msg)
  {
    $goalLength = 46;
    // foreach($msg as $letter){

    // }
    $length = 46 - \strlen(utf8_decode($msg));

    return  ' '.$msg.str_repeat(' ', $length);
  }
}
