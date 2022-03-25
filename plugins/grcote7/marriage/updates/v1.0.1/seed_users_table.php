<?php

/*
 * (c) Boosteur.com - 2022
 */

namespace Grcote7\Marriage\Updates;

use Illuminate\Support\Facades\DB;
use Winter\Storm\Database\Updates\Seeder;
use Winter\User\Models\User;

class seed_users_table extends Seeder
{
  public function run()
  {
    DB::table('users')->truncate();

    $pw = bcrypt('123123123');
    User::create([
      'name'                  => 'Lionel',
      'surname'               => 'COTE',
      'username'              => 'GrCOTE7',
      'email'                 => 'GrCOTE7@Gmail.com',
      'password'              => $pw,
      'password_confirmation' => $pw,
      'is_activated'          => 1,
    ]);

    User::create([
      'name'                  => 'Marie-Pierre',
      'surname'               => 'RAQUIN',
      'username'              => 'MP',
      'email'                 => 'MP@COTE7.com',
      'password'              => $pw,
      'password_confirmation' => $pw,
      'is_activated'          => 1,
    ]);
    User::create([
      'name'                  => 'Jean',
      'surname'               => 'COTE',
      'username'              => 'JC',
      'email'                 => 'Jean@Gmail.com',
      'password'              => $pw,
      'password_confirmation' => $pw,
      'is_activated'          => 1,
    ]);
    User::create([
      'name'                  => 'Andrée',
      'surname'               => 'MIELLE',
      'username'              => 'Ginandrée',
      'email'                 => 'Ginandree@Gmail.com',
      'password'              => $pw,
      'password_confirmation' => $pw,
      'is_activated'          => 1,
    ]);
    User::create([
      'name'                  => 'Samuel',
      'surname'               => 'COTE',
      'username'              => 'Sam',
      'email'                 => 'Sam@Gmail.com',
      'password'              => $pw,
      'password_confirmation' => $pw,
      'is_activated'          => 1,
    ]);
    User::create([
      'name'                  => 'Jean-Pierre',
      'surname'               => 'BIALLE',
      'username'              => 'JP',
      'email'                 => 'JP@Gmail.com',
      'password'              => $pw,
      'password_confirmation' => $pw,
      'is_activated'          => 1,
    ]);
    User::create([
      'name'                  => 'Anne-Marie',
      'surname'               => 'BIALLE',
      'username'              => 'Luluce',
      'email'                 => 'AMB@Gmail.com',
      'password'              => $pw,
      'password_confirmation' => $pw,
      'is_activated'          => 1,
    ]);
  }
}
