<?php

/*
 * (c) Boosteur.com - 2022
 */

namespace Grcote7\Marriage\Updates;

use Grcote7\Marriage\Models\Guest;
use Grcote7\Marriage\Models\Img;
use Illuminate\Support\Facades\DB;
use Winter\Storm\Database\Updates\Seeder;

class seed_imgs_table extends Seeder
{
  public function run()
  {
    // DB::table('grcote7_marriage_photos')->truncate();

    $gs = ['LC', 'MPR', 'JC', 'AM',  'JP', null, 'AMB'];
    foreach ($gs as $k => $g) {
      $gu = Guest::find($k + 1);
      if ($gu && null !== $gs[$k]) {
        Img::create([
          'filename'       => $g.'.png',
          'imageable_id'   => $gu->user->id,
          'imageable_type' => 'guest',
        ]);
      }
    }
    Img::create([
      'filename'       => 'AMI.png',
      'imageable_id'   => 1,
      'imageable_type' => 'group',
    ]);
  }
}
