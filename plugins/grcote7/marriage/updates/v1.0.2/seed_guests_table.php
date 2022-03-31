<?php

/*
 * (c) Boosteur.com - 2022
 */

namespace Grcote7\Marriage\Updates;

use Grcote7\Marriage\Models\Guest;
use Winter\Storm\Database\Updates\Seeder;

class seed_guests_table extends Seeder
{
  public function run()
  {
    Guest::create([
      'user_id'    => 1,
      'familly_id' => 1,
      'mobile'     => '07 83 59 27 21',
    ]);

    Guest::create([
      'user_id'    => 2,
      'familly_id' => 5,
      'mobile'     => '06 17 82 09 27',
    ]);

    Guest::create([
      'user_id'    => 3,
      'familly_id' => 3,
      'mobile'     => '01 23 45 67 89',
    ]);
    Guest::create([
      'user_id'    => 4,
      'familly_id' => 3,
      'mobile'     => '02 23 45 67 89',
    ]);
  }
}
