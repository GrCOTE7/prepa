<?php

/*
 * (c) Boosteur.com - 2022
 */

namespace Grcote7\Marriage\Components;

use Cms\Classes\ComponentBase;
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
    // Relation M-M
    $g   = Guest::with('familly')->find(2);
    $grs = $g->groups()->orderBy('name', 'desc');

    $data[] = $g->get();
    $data[] = $g->groups;
    $data[] = $grs->get()[0]->name;
    // $data[] = $this->cpl('ManyToMany relation');
    // $data[] = $this->cpl('');
    // $data[] = $this->cpl('Guest : '.$gs->user->name);
    // $data[] = $this->cpl('The group(s) (s)he belongs to :');
    // foreach ($gs->groups as $g) {
    //   $data[] = $this->cpl('   - '.$g->name);
    // }

    // $data[] = $this->cpl('-');
    // $data[] = str_repeat('-', 47);

    // // reverse relation M-M
    // $data[] = $this->cpl('Reverse of ManyToMany relation');
    // $data[] = $this->cpl('');
    // for ($i = 1; $i < 4; ++$i) {
    //   $gr     = Group::find($i);
    //   $data[] = $this->cpl('Group : '.$gr->name);
    //   foreach ($gr->guests as $g) {
    //     $data[] = $this->cpl('   - '.$g->user->name);
    //   }
    //   $data[] = $this->cpl('');
    // }

    return $data ?? '<p>$data est vide</p>';
    //   ->dump()
    //   ->first()
    //   ->get()
    // $data[] = str_repeat('-', 45);

    // $this->page['data'] = implode("\n<br>", $data);
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
}
