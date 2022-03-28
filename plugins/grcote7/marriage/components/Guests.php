<?php

/*
 * (c) Boosteur.com - 2022
 */

namespace Grcote7\Marriage\Components;

use Cms\Classes\ComponentBase;
use Grcote7\Marriage\Models\Familly;
use Grcote7\Marriage\Models\Group;
use Grcote7\Marriage\Models\Guest;

class Guests extends ComponentBase
{
  public function componentDetails()
  {
    return [
      'name'        => 'Guests Component',
      'description' => 'Guests Managment',
    ];
    //2do fix Debugbar: Wait a compatible version with Laravel 9
  }

  public function defineProperties()
  {
    return [];
  }

  public function onRun()
  {
    // $gt = 'grcote7_marriage_guests';
    // $ft  = 'grcote7_marriage_famillies';
    // $ggt = 'grcote7_marriage_group_guest';

    $data[] = 'Guest → familly & Groups';
    $gs     = Guest::find(1);
    $data[] = $gs->user->name;
    $data[] = $gs->mobile;
    $data[] = 'Famille: '.$gs->familly->name;
    foreach ($gs->groups as $g) {
      $data[] = $g->id.' - '.$g->name;
    }

    $data[] = str_repeat('-', 45);

    $data[] = 'Familly → guests & groups';
    $fs     = Familly::find(1);
    $data[] = 'Famille: '.$fs->name;
    // dd($fs->guests);
    foreach ($fs->guests as $f) {
      $data[] = '- '.$f->user->name;
      foreach ($f->groups as $gu) {
        $data[] = '   - '.$gu->name;
      }
    }

    $data[] = str_repeat('-', 45);

    $data[] = 'Group → guests & familly';
    $gr     = Group::find(3);
    $data[] = 'Group: '.$gr->name;
    // dd($gr->guests);
    foreach ($gr->guests as $g) {
      $data[] = '- '.$g->user->name;
      foreach ($f->groups as $gu) {
        $data[] = '   - '.$gu->name;
      }
    }

    $data[] = str_repeat('-', 45);

    return $data ?? '<p>$data est vide</p>';
    // ->dump()
    //   ->first()
    //   ->get()

    // $this->page['data'] = implode("\n<br>", $data);
  }
}
