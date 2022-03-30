<?php

/*
 * (c) Boosteur.com - 2022
 */

namespace Grcote7\WinterLearning\Updates;

use Illuminate\Support\Facades\DB;
use Winter\Storm\Database\Updates\Seeder;
use Winter\Storm\Support\Facades\Schema;

class seed_employees_table extends Seeder
{
  public function run()
  {
    // $msg = DB::table($gwet)->exists() ?? 'No data';
    // echo "\n".$msg."\n\n";

    $gwet = 'grcote7_winterlearning_employees';
    // if (Schema::hasTable($gwet)) {
    // DB::table($gwet)->truncate();
    // DB::flushDuplicateCache();

    DB::table($gwet)->upsert(
      [
        ['id' => 1, 'activity_id' => 1],

        ['id' => 2, 'activity_id' => 4],

        ['id' => 3, 'activity_id' => 7],
      ],
      ['id'],
      ['activity_id'],
    );
    // }
  }
}
