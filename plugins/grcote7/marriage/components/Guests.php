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
    // $gt = 'grcote7_marriage_guests';
    // $ft  = 'grcote7_marriage_famillies';
    // $ggt = 'grcote7_marriage_group_guest';

    $data[] = 'User → Has guest';
    $data[] = user::select('name')->has('guest')->get();

    // $data[] = str_repeat('-', 45);
    return $data ?? '<p>$data est vide</p>';
    // ->dump()
    //   ->first()
    //   ->get()

    // $this->page['data'] = implode("\n<br>", $data);
  }
}
