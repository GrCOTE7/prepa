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
    $data = Db::table('users')
      ->select('id', 'name')
      ->whereExists(function ($query) {
        $query->select(Db::raw(1))
          ->from('user_throttle')
          ->whereRaw('user_throttle.user_id = users.id');
      })->get();
    /*
    Same request as :

    select id, name
    from users as u
    where exists (
        select 1
        from user_throttle as ut
        where ut.user_id = u.id
      )
    */

    // var_dump($data);
    return $data;
  }
}
