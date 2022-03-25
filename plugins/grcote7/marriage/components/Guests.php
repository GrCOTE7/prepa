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

    $listBrut  = [];
    $lengthMax = 0;
    foreach ($guests  as $guest) {
      $listBrut[] = 'Guest <strong>'.$guest->user->name.'</strong> :';
      $lengthMax  = max($lengthMax, \strlen('Guest '.$guest->user->name.' :'));
      //   $listBrut[] = $lengthMax;
      foreach ($guest->groups as $group) {
        $listBrut[] = ' - '.$group->name;
      }
      $listBrut[] = 'separation';
    }
    array_pop($listBrut);

    $data = array_map(function ($separation) use ($lengthMax) {
      if ('separation' === $separation) {
        return  str_repeat('-', $lengthMax * 1.15);
      }

      return $separation;
    }, $listBrut);

    //   ->dump()
    //   ->first()
    //   ->get()
    $this->page['data'] = implode("\n<br>", $data);
    // return $data ?? '<p>$data est vide</p>';
  }
}
