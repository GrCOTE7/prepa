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
    $sortBy = 'email'; // null, or 'id' or 'email', ...

    $data = Db::table('users')
      ->select('id', 'name')
      ->when(
        $sortBy,
        function ($query, $sortBy) {
          return $query->orderBy($sortBy);
        },
        function ($query, $sortBy) {
          return $query->orderBy('name');
        }
      )
      ->get();

    // var_dump($data);
    return $data;
  }
}
