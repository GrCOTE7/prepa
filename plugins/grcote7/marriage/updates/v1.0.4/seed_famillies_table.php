<?php

/*
 * (c) Boosteur.com - 2022
 */

namespace Grcote7\Marriage\Updates;

use Grcote7\Marriage\Models\Familly;
use Illuminate\Support\Facades\DB;
use Winter\Storm\Database\Updates\Seeder;

class seed_famillies_table extends Seeder
{
  public function run()
  {
    DB::table('grcote7_marriage_famillies')->truncate();

    // 1 - Lionel
    Familly::create([
      'name'    => 'COTE',
      'guest_id' => 1,
    ]);

    // 2 - Jean
    Familly::create([
      'name'    => 'COTE',
      'guest_id' => 3,
    ]);

    // 3 - Sam
    Familly::create([
      'name'    => 'COTE',
      'guest_id' => 5,
    ]);

    // 4 - JP
    Familly::create([
      'name'    => 'BIALLE',
      'guest_id' => 6,
    ]);

    // 5 - MP
    Familly::create([
      'name'    => 'RAQUIN',
      'guest_id' => 2,
    ]);
  }
}
