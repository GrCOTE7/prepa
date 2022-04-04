<?php

/*
 * (c) Boosteur.com - 2022
 */

namespace Grcote7\Marriage\Components;

use Cms\Classes\ComponentBase;
use Grcote7\Marriage\Models\Avatar;
use Grcote7\Marriage\Models\Guest;
use Grcote7\Marriage\Models\Img;
use Illuminate\Support\Facades\DB;
use Winter\Storm\Support\Facades\File;
use Winter\Storm\Support\Facades\Input;

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
    $aaa = new Avatar();
    // $g = Guest::find(1);

    // $g->avatar = Input::file('file_input');

    // $file = new System\Models\File();
    // $file->data         = Input::file('file_input');
    // $file->disk_name    = 'LC.png';
    // $file->file_name    = 'LC.png';
    // $file->file_size    = 123;
    // $file->content_type = 'Avatar de LC';
    // $file->is_public    = true;
    // $file->save();

    $data[] = $aaa;
    // $data[] = $g->avatar->getPath();

    DB::flushDuplicateCache();
    $g      = Guest::find(1);
    $data[] = $g->avatar;

    return $data ?? '<p>$data est vide</p>';
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
    $d = Img::all();

    foreach ($d as $v) {
      $data[] = $v->path;
    }
    $data[] = str_repeat('-', 41);

    return $data;
  }
}
