<?php

/*
 * (c) Boosteur.com - 2022
 */

namespace Grcote7\Marriage\Components;

use Cms\Classes\ComponentBase;
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
    $data = User::find(3)->guest->mobile;
    // return $user->guest->mobile;

    // $data = Guest::select('mobile')->where('id', 1)->first();

    // $data = Guest::selectConcat(['Id: ', 'id'], 'numId');
    // $data = $data->addSelect('mobile');

    // $data = $data->where('id', 3);

    $this->page['data'] = $data;

    // return $data ?? '<p>$data est vide</p>';
  }
}
