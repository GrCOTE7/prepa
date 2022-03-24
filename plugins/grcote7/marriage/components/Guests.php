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
    // $user = User::find(3);
    // return $user->guest->mobile;
    // return $data ?? '<p>$data est vide</p>';
    // $data = Guest::select('mobile')->where('id', 1)->first();

    // $data = Guest::selectConcat(['Id: ', 'id'], 'numId');
    // $data = $data->addSelect('mobile');

    // $data = $data->where('id', 3);

    $data = User::select('name')
      ->where('name', 'Lionel')
      // ->dump()
      ->orWhere(function ($query) {
        $query->where('email', 'like', '%COTE7%')
          ->where('username', 'like', 'MP');
      })
      ->get()
      ;

    return $data ?? '<p>$data est vide</p>';
    //2do fix Debugbar: Wait a compatible version with Laravel 9
  }
}
