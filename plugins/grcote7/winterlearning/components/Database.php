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
    $users = Db::table('users')->select('id', 'name', 'email')->get();

    // dd($users);
    foreach ($users as $user) {
      //   echo $user->name;
    }

    return $users;
    // var_dump($users);
  }
}
