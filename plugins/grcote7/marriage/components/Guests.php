<?php

/*
 * (c) Boosteur.com - 2022
 */

namespace Grcote7\Marriage\Components;

use Cms\Classes\ComponentBase;
use Grcote7\Marriage\Models\Guest;
use Grcote7\Marriage\Models\Photo;
use Illuminate\Support\Facades\DB;
use Winter\Storm\Database\Models\DeferredBinding;

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
    // Deferred binding
    // $sessionKey = uniqid('session_key', true);
    // $data[]     = $this->getAllPhotos();
    // // ----------------------------------------------------------------------------------

    // $newTof                 = new Photo();
    // $newTof->path           = 'SAM.png';
    // $newTof->imageable_id   = 7;
    // $newTof->imageable_type = 'guest';
    // $data[]                 = $newTof;
    // $newTof->save();

    // // $newTof = Photo::find(8);

    // $newGuest             = new Guest();
    // $newGuest->user_id    = 5;
    // $newGuest->familly_id = 3;
    // $newGuest->mobile     = 'GSM Sam';
    // $data[]               = $newGuest;

    // $data[] = str_repeat(' ', 45);
    // $newGuest->photo()->add($newTof, $sessionKey);
    // // $newGuest->photo()->add($newTof); // Doesn't work because guest not yet created
    // $newGuest->save();

    // $data[] = $newGuest;
    // $data[] = str_repeat('-', 45);
    // // ----------------------------------------------------------------------------------
    // $data[] = $this->getAllPhotos();

    // $sessionKey = 'session_key624814772291a0.77586480';
    // $data[]     = Guest::find(7)->cancelDeferred($sessionKey);

    // $data[] = Guest::find(7)->photo()->withDeferred($sessionKey)->get();
    // $tof   = Photo::find(8);
    // $guest = Guest::find(7);
    // $guest->photo()->remove($tof, $sessionKey); // remove the deffered binding

    DeferredBinding::cleanUp(1);Older than 1 day

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
    $d = Photo::all();

    foreach ($d as $v) {
      $data[] = $v->path;
    }
    $data[] = str_repeat('-', 41);

    return $data;
  }
}
