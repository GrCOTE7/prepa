<?php

/*
 * (c) Boosteur.com - 2022
 */

namespace Grcote7\WinterLearning\Components;

use Cms\Classes\ComponentBase;
use Db;
use Winter\Storm\Support\Facades\Schema;

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
    Schema::table('users', function ($table) {
      $table->string('name', 50)->change();
    });

    // return ['MP', 'Lionel'];
    // dd(Db::select('select * from users'));
    // $users = Db::select('select * from users');
    $user = Db::table('users')->where('name', 'MP')->value('email');
    // dd($users);
    echo $user;
    exit;
    foreach ($users as $user) {
      $all[] = $user->name.' ('.$user->email.')';
    }

    return $all;
  }
}
