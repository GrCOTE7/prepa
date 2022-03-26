<?php

/*
 * (c) Boosteur.com - 2022
 */

namespace Grcote7\Marriage\Updates;

use Grcote7\Marriage\Models\Group;
use Illuminate\Support\Facades\DB;
use Winter\Storm\Database\Updates\Seeder;

class seed_groups_table extends Seeder
{
  public function run()
  {
    DB::table('grcote7_marriage_groups')->truncate();

    Group::create([
      'name' => 'AMI',
    ]);

    Group::create([
      'name' => 'FAMILLE',
    ]);

    Group::create([
      'name' => 'TRAVAIL',
    ]);
  }
}
