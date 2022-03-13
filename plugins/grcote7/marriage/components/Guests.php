<?php

/*
 * (c) Boosteur.com - 2022
 */

namespace Grcote7\Marriage\Components;

use Cms\Classes\ComponentBase;
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
  }

  public function defineProperties()
  {
    return [];
  }

  public function onRun()
  {
    $user  = User::find(3);
    $guest = Guest::find(3);

    $cas[] = $user->name;
    // $cas[] = $user->guest->mobile;
    dd($user->guest);
    $cas[] = str_repeat('-', 14);
    $cas[] = $guest->user->name;
    $cas[] = $guest->mobile;

    // dd($user);
    // $cas[] = $user->name.' : '.$user->mobile;
    // $cas[] = $guest->name.' : '.$guest->mobile;

    // $this->page['data'] = $cas ?? '$cas est vide';
    return $cas ?? '<p>$cas est vide</p>';
  }
}
