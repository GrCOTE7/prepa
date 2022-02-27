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
    echo '<u><b>Depuis le code PHP dans le component :</b></u><br>';
    foreach ($users as $user) {
      echo $user->id.' '.$user->name.' '.$user->email.'<br>';
    }
    echo '<hr><u><b>Depuis le template du component (default.htm) :</b></u><br>';

    return $users;
    // var_dump($users);
  }
}
