<?php

/*
 * (c) Boosteur.com - 2022
 */

namespace Grcote7\Marriage\Components;

use Cms\Classes\ComponentBase;
use Grcote7\Marriage\Models\Guest;
use Grcote7\Marriage\Models\Photo;
use Illuminate\Support\Facades\DB;

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
    // $data[] = 'Ready.';
    $img     = '/storage/app/media/Guests/'.Guest::find(2)->photo->path;
    $data[]  = $img;
    $data[]  = '<img src="'.$img.'" />';

    // return $data ?? '<p>$data est vide</p>';
    //   ->dump()
    //   ->first()
    //   ->get()
    // $data[] = str_repeat('-', 45);

    $this->page['data'] = implode("\n<br>", $data);
  }

  /**
   *  Complete line for good alignement of EOL ( ' " ' ).
   *
   * @param mixed $msg
   */
  public function cpl($msg)
  {
    $goalLength = 46;
    // foreach($msg as $letter){

    // }
    $length = 46 - \strlen(utf8_decode($msg));

    return  ' '.$msg.str_repeat(' ', $length);
  }

  public function getAllPhotos()
  {
    DB::flushDuplicateCache();
    $d = Photo::all();

    foreach ($d as $v) {
      $data[] = $v->path;
    }
    $data[] = str_repeat('-', 41);

    return $data;
  }
}
