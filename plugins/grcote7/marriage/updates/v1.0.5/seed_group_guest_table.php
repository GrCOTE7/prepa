<?php

/*
 * (c) Boosteur.com - 2022
 */

namespace Grcote7\Marriage\Updates;

use Illuminate\Support\Facades\DB;
use Winter\Storm\Database\Updates\Seeder;

class seed_group_guest_table extends Seeder
{
  public function run()
  {
    $ggt = 'grcote7_marriage_group_guest';
    DB::table($ggt)->truncate();

    DB::table($ggt)->upsert(
      [
        ['guest_id' => 1, 'group_id' => 1],
        ['guest_id' => 1, 'group_id' => 2],
        ['guest_id' => 1, 'group_id' => 3],

        ['guest_id' => 2, 'group_id' => 1],
        ['guest_id' => 2, 'group_id' => 3],

        ['guest_id' => 3, 'group_id' => 1],
        ['guest_id' => 3, 'group_id' => 2],

        ['guest_id' => 4, 'group_id' => 1],
        ['guest_id' => 4, 'group_id' => 2],
      ],
      ['guest_id'],
      ['group_id'],
    );
  }
}
