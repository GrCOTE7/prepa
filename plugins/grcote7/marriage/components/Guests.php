<?php

/*
 * (c) Boosteur.com - 2022
 */

namespace Grcote7\Marriage\Components;

use Cms\Classes\ComponentBase;
use DB;
use Grcote7\Marriage\Classes\Calcul;
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
    $data = User::where('id', '>', 1)->count()
    //   ->dump()
    //   ->get()
      ;
    $n = 5;
    // $data = 'Le double de '.$n.' est '.Calcul::Double($n).'.';

    // $data = $data->name;
    // $data = Guest::find(3)->user->dump();
    // $data->dd();
    // $data = $data->user->name;

    // $data->dump();

    // DB::connection('mysql')->enableQueryLog();
    // $queries = DB::getQueryLog();
    // dd($data::toSql());
    // $last_query = end($queries);
    // dd($queries);
    // $data = $data->first()->mobile;

    // dd($data);
    // var_dump($data);
    // return $data->first()->mobile.'<br>Num GSM'.
    // '<hr>'.$data->first()->name.'<br>Nom';
    // dd($data);
    return $data ?? '<p>$data est vide</p>';
    //2do fix Debugbar: Wait a compatible version with Laravel 9
  }
}
