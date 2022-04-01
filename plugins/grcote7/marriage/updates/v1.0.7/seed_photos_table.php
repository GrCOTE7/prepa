<?php

/*
 * (c) Boosteur.com - 2022
 */

namespace Grcote7\Marriage\Updates;

use Grcote7\Marriage\Models\Guest;
use Grcote7\Marriage\Models\Photo;
use Illuminate\Support\Facades\DB;
use Winter\Storm\Database\Updates\Seeder;

class seed_photos_table extends Seeder
{
  public function run()
  {
    // DB::table('grcote7_marriage_photos')->truncate();

    $gs = ['LC', 'MPR', 'JC', 'AM',  'JP', 'AMB'];
    foreach ($gs as $k => $g) {
      $gu = Guest::find($k + 1);
      if ($gu) {
        Photo::create([
          'path'           => $g.'.png',
          'imageable_id'   => $gu->user->id,
          'imageable_type' => 'Guest',
        ]);
      }
    }
    Photo::create([
      'path'           => 'AMI.png',
      'imageable_id'   => 1,
      'imageable_type' => 'Group',
    ]);
  }
}
