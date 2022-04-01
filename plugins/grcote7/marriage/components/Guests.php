<?php

/*
 * (c) Boosteur.com - 2022
 */

namespace Grcote7\Marriage\Components;

use Cms\Classes\ComponentBase;
use Grcote7\Marriage\Models\Group;
use Grcote7\Marriage\Models\Guest;
use Illuminate\Support\Facades\DB;

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
    // $g = new Group(['name' => 'LOISIR']);
    // $g->save();
    // $g = new Group(['name' => 'OTHER']);
    // $g->save();

    // Remove 2 groups og ghest 4
    $d    = Guest::find(4);
    $ctrl = $d->groups()->where('id', '>', 2);

    if (null !== $ctrl) {
      $data[] = 'Detach 2 groups';
      $data[] = $ctrl->count();
      $d->groups()->detach([3, 4, 5]);
    }
    $d->save();
    DB::flushDuplicateCache();

    $data[] = $d->user->username;

    foreach ($d->groups as $v) {
      $data[] = $v->id.' '.$v->name;
    }
    // ----------------------------------------------------------------------------------
    $data[] = str_repeat('-', 45);

    // Add 2 groups of guest 4
    $d->groups()->find(3);

    if ((null === $d->groups()->find(3)) || (null === $d->groups()->find(4))) {
      $data[] = 'Add 2 groups';
      $d->groups()->attach([3, 4, 5]);
    }
    // ----------------------------------------------------------------------------------
    $data[] = str_repeat('-', 45);
    DB::flushDuplicateCache();

    $d      = Guest::find(4);
    $data[] = $d->user->username;

    foreach ($d->groups as $v) {
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
