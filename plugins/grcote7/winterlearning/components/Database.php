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

  public function users()
  {
    // return ['MP', 'Lionel'];
    // dd(Db::select('select * from users'));
    Db::insert('insert into users (id, name, email, password) values (?, ?, ?, ?)', [4, 'Jo2e', 'Joe2@C7.com', 123123123]);
    $users = Db::select('select * from users');
    foreach ($users as $user) {
      $all[] = $user->name.' ('.$user->email.')';
    }

    return $all;
  }
}
