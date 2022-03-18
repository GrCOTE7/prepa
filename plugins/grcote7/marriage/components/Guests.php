<?php

/*
 * (c) Boosteur.com - 2022
 */

namespace Grcote7\Marriage\Components;

use Cms\Classes\ComponentBase;
use DB;
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
    // $user = User::find(3);
    // return $user->guest->mobile;
    // return $data ?? '<p>$data est vide</p>';
    // $data = Guest::select('mobile')->where('id', 1)->first();

    // $data = Guest::selectConcat(['Id: ', 'id'], 'numId');
    // $data = $data->addSelect('mobile');

    // $data = $data->where('id', 3);

    $data = Guest::select('created_at');
    $data = $data->addSelect('mobile');
    $data = $data->selectConcat(['Id: ', 'id'], 'numId')->dump();

    // DB::connection('mysql')->enableQueryLog();
    // $queries = DB::getQueryLog();
    // dd($data::toSql());
    // $last_query = end($queries);
    // dd($queries);
    // $data = $data->first()->mobile;

    // dd($data);

    return [$data->first()->mobile, 1234];
    // dd($data);
    // return $data ?? '<p>$data est vide</p>';

    //2do fix bug bar
  }
}
