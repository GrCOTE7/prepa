<?php

/*
 * (c) Boosteur.com - 2022
 */

namespace Grcote7\Marriage\Updates;

use Grcote7\Marriage\Models\Avatar;
use Grcote7\Marriage\Models\Guest;
use Illuminate\Support\Facades\DB;
use Winter\Storm\Database\Updates\Seeder;

class seed_avatars_table extends Seeder
{
  public function run()
  {
    // DB::table('grcote7_marriage_photos')->truncate();

    $gs = ['LC', 'MPR', 'JC', 'AM',  'JP', null, 'AMB'];
    foreach ($gs as $k => $g) {
      $gu = Guest::find($k + 1);
      if ($gu && null !== $gs[$k]) {
        Avatar::create([
          'name'     => $g.'.png',
          'guest_id' => $gu->user->id,
        ]);
      }
    }
  }
}
