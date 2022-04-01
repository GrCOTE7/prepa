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
    $g      = Guest::find(2);
    $data[] = $g->id.' '.$g->user->name;

    foreach ($g->groups as $key => $v) {
      $data[] = $v->id.' '.$v->name;
    }

    $data[] = str_repeat('-', 45);

    for ($i = 0; $i < 3; ++$i) {
      $gr[$i] = Group::find($i + 1);
      $data[] = ($i + 1).' '.$gr[$i]->name;
    }

    // print_r($gr);

    $g->groups = [1, 3];
    $g->save();

    $data[] = str_repeat('-', 45);

    $g = Guest::find(2);
    foreach ($g->groups as $key => $v) {
      $data[] = $v->id.' '.$v->name;
    }

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
