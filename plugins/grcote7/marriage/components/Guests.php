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
    // $gt = 'grcote7_marriage_guests';
    // $ft  = 'grcote7_marriage_famillies';
    // $ggt = 'grcote7_marriage_group_guest';

    $gs = Guest::find(1);
    // dd($gs);

    //@f This above works very well under WinterCMS with Laravel 8
    //@f And under WinterCMS with Laravel 9

    foreach ($gs->groups as $group) {
      $data[] = $group->pivot->group_id;
    }

    // -------------------------------------------------

    //@i This above works very well under WinterCMS with Laravel 8
    //! But absolutly not under WinterCMS with Laravel 9

    // $data   = [];
    // $data[] = $gs[0]->user->name;
    // $data[] = $gs[0]->groups;

    // -------------------------------------------------

    return $data ?? '<p>$data est vide</p>';
    // dd($data);

    // $data[] = $g->groups()->where('id', 1)->get();

    // $data[] = $g->groups->get();

    // foreach ($data[0]->groups as $group) {
    //   //   $data   = $guest->groups;
    //   $data[] = ' - '.$group->name;
    // }

    // $data[] = [];
    // $data[] = $guest->groups;

    // foreach ($gs as $guest) {
    //   $data[] = $guest->user->name;
    //   foreach ($guest->groups as $group) {
    //     $data[] = ' - '.$group->name;
    //   }
    // }

    // ->dump()
    //   ->first()
    //   ->get()

    // $this->page['data'] = implode("\n<br>", $data);
  }
}
