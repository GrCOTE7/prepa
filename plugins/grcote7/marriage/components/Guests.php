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
  }

  public function defineProperties()
  {
    return [];
  }

  public function onRun()
  {
    $guest     = Guest::find(3);
    $newMobile = 789;
    $model     = $guest;
    $guest->bindEvent('model.beforeUpdate', function () use ($guest) {
      $oldvalue = $guest->mobile;
    });
    $guest->mobile = $newMobile.' (Remplace: '.$guest->mobile.')';
    $guest->save();
    $cas = $guest->mobile;

    // $this->page['data'] = $cas ?? '$cas est vide';
    return $cas ?? '<p>$cas est vide</p>';
  }
}
