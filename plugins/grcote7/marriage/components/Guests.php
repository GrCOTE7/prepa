<?php

/*
 * (c) Boosteur.com - 2022
 */

namespace Grcote7\Marriage\Components;

use Cms\Classes\ComponentBase;
use DB;
use Grcote7\Marriage\Models\Familly;
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
    $gdb = 'grcote7_marriage_guests';
    $fdb = 'grcote7_marriage_famillies';

    $famillies = Familly::first()->guests;
    // $data      = $famillies;
    foreach ($famillies as $familly) {
      $data[] = $familly->mobile;
    }
    //   ->whereNotExists(function ($query) {
    //     $query->select(DB::raw(1))
    //       ->from('grcote7_marriage_guests as gg')
    //       ->whereRaw('gg.user_id = users.id');
    //   })
    //   ->dump()
    //   ->first()
    // echo $data;
    // dd($data);

    // $data2 = $data1->guests;

    // $data3 = [$data2[0]->user->name, $data2[1]->user->name];

    // $data[] = $data3;
    // $data[] = '----------------------';
    // $data[] = $data2;
    // $data[] = '----------------------';
    // $data[] = $data1;

    return $data ?? '<p>$data est vide</p>';
  }
}
