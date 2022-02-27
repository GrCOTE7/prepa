<?php

/*
 * (c) Boosteur.com - 2022
 */

namespace Grcote7\WinterLearning\Components;

use Cms\Classes\ComponentBase;
use Db;

class Database extends ComponentBase
{
  public function componentDetails()
  {
    return [
      'name'        => 'Database Component',
      'description' => 'Diverses opé sur Database...',
    ];
  }

  public function defineProperties()
  {
    return [];
  }

  public function content()
  {
    $ope = -1;

    $data = Db::table('users')
      ->select('id', 'name')
      ->when($ope, function ($query, $ope) {
        return $query->where('id', $ope);
      })
      ->get();

    // var_dump($data);
    return $data;
  }
}
