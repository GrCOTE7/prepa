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
    $letters = ['e', 'é'];
    foreach ($letters as $letter) {
      $data[] = $this->cpl('Length of " '.$letter.' " : '.\strlen($letter));
    }
    // //@i See each alignment of "Andrée" fails with this strange trouble
    //@q How to have " é " is just 1 character ?
    //@i See each alignment of "Andrée" fails with this strange trouble
    $data[] = str_repeat('-', 47);
    // Relation M-M
    $gs     = Guest::find(3);
    $data[] = $this->cpl('ManyToMany relation');
    $data[] = $this->cpl('');
    $data[] = $this->cpl('Guest : '.$gs->user->name);
    $data[] = $this->cpl('The group(s) (s)he belongs to :');
    foreach ($gs->groups as $g) {
      $data[] = $this->cpl('   - '.$g->name);
    }

    // $data[] = $this->cpl('-');
    $data[] = str_repeat('-', 47);

    // reverse relation M-M
    $data[] = $this->cpl('Reverse of ManyToMany relation');
    $data[] = $this->cpl('');
    for ($i = 1; $i < 4; ++$i) {
      $gr     = Group::find($i);
      $data[] = $this->cpl('Group : '.$gr->name);
      foreach ($gr->guests as $g) {
        $data[] = $this->cpl('   - '.$g->user->name);
      }
      $data[] = $this->cpl('');
    }

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
    $length = 46 - \strlen($msg);

    return  ' '.$msg.str_repeat(' ', $length);
  }
}
