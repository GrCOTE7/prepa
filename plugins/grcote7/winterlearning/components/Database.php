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
    $users = Db::table('users')->lists('email', 'name');

    echo '<pre>';
    print_r($users);
    echo '</pre>';
    foreach ($users as $name => $email) {
      echo $name.' : '.$email.'<br>';
    }
  }
}
