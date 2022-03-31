<?php

/*
 * (c) Boosteur.com - 2022
 */

namespace Grcote7\Marriage\Updates;

use Grcote7\Marriage\Models\Msg;
use Illuminate\Support\Facades\DB;
use Winter\Storm\Database\Updates\Seeder;

class seed_msgs_table extends Seeder
{
  public function run()
  {
    // DB::table('grcote7_marriage_msgs')->truncate();

    Msg::create([
      'guest_id'    => 1,
      'to_guest_id' => 2,
      'subject'     => 'Hey, darling !',
      'content'     => 'Comment va MP ?',
    ]);

    Msg::create([
      'guest_id'    => 1,
      'to_guest_id' => 4,
      'subject'     => 'Hey, Mam !',
      'content'     => 'Comment va Mam ?',
    ]);

    Msg::create([
      'guest_id'    => 2,
      'to_guest_id' => 4,
      'subject'     => 'Hey, Mam !',
      'content'     => 'Comment va ma Belle doche préférée ?',
    ]);
  }
}
