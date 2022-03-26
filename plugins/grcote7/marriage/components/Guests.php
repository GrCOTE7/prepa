<?php

/*
 * (c) Boosteur.com - 2022
 */

namespace Grcote7\Marriage\Components;

use Cms\Classes\ComponentBase;
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
    // $gt  = 'grcote7_marriage_guests';
    // $ft  = 'grcote7_marriage_famillies';
    // $ggt = 'grcote7_marriage_group_guest';
    return [];
  }

  public function onRun()
  {
    $guests = Guest::all();

    $gs = Guest::find(1)->where('id', '<', 3)->get();
    // dd($gs);

    $data[] = $gs[0]->user->name;
    $data[] = $gs[0]->groups;
    $data[] = $gs[1]->user->name;
    $data[] = $gs[1]->groups;

    //   ->dump()
    //   ->first()
    //   ->get()
    $this->page['data'] = implode("\n<br>", $data);
    // return $data ?? '<p>$data est vide</p>';
  }
}
