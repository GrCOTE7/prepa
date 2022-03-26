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
    return [];
  }

  public function onRun()
  {
    $gt = 'grcote7_marriage_guests';
    // $ft  = 'grcote7_marriage_famillies';
    // $ggt = 'grcote7_marriage_group_guest';
    $g      = Guest::find(2);
    $data[] = $g;
    $data[] = $g->user->name;
    // dd($data);
    // $data[] = $g->groups()->where('id', 1)->get();

    // $data[] = $g->groups->get();

    // foreach ($data[0]->groups as $group) {
    //   //   $data   = $guest->groups;
    //   $data[] = ' - '.$group->name;
    // }

    // $data[] = [];
    // $data[] = $guest->groups;

    // foreach ($guests as $guest) {
    //   $data[] = $guest->user->name;
    //   foreach ($guest->groups as $group) {
    //     $data[] = ' - '.$group->name;
    //   }
    // }

    // ->dump()
    //   ->first()
    //   ->get()

    $this->page['data'] = implode("\n<br>", $data);

    // return $data ?? '<p>$data est vide</p>';
  }
}
