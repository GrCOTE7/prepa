<?php

/*
 * (c) Boosteur.com - 2022
 */

namespace Grcote7\Marriage\Components;

use Cms\Classes\ComponentBase;
use DB;
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
    $req  = '%GrCOTE7%';
    $data = User::where('id', 3)
      ->update(['surname' => 'MIELLE'])

    // $data = User::select('name')
    //   ->whereNotExists(function ($query) {
    //     $query->select(DB::raw(1))
    //       ->from('grcote7_marriage_guests as gg')
    //       ->whereRaw('gg.user_id = users.id');
    //   })

    //   ->dump()

    //   ->get()
      ;

    return $data ?? '<p>$data est vide</p>';
  }
}
