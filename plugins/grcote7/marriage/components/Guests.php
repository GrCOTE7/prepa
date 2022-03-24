<?php

/*
 * (c) Boosteur.com - 2022
 */

namespace Grcote7\Marriage\Components;

use Cms\Classes\ComponentBase;
use DB;
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
    // $lio          = new Guest();
    // $lio->id      = 1;
    // $lio->user_id = 1;
    // $lio->mobile  = '07 83 59 27 21';
    // $lio->save();

    $data = Guest::find(1)
    //   ->whereNotExists(function ($query) {
    //     $query->select(DB::raw(1))
    //       ->from('grcote7_marriage_guests as gg')
    //       ->whereRaw('gg.user_id = users.id');
    //   })
    //   ->dump()
    //   ->get()[1]->user->name
;
    // $data->name = 'Lionel';
    // $data->save();
    // dd($data);
    // $data = $data->user->name;

    // foreach ($data as $guest) {
    //   echo $guest->user->name.'<br>';
    // }

    return $data ?? '<p>$data est vide</p>';
  }
}
