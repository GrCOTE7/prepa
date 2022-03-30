<?php

/*
 * (c) Boosteur.com - 2022
 */

namespace Grcote7\WinterLearning\Components;

use Cms\Classes\ComponentBase;
use Grcote7\WinterLearning\Models\Activity;
use Grcote7\WinterLearning\Models\Employee;
use Grcote7\WinterLearning\Models\SubActivity;
use Winter\User\Models\User;

class ManyToMany extends ComponentBase
{
  public function componentDetails()
  {
    return [
      'name'        => 'ManyToMany Component',
      'description' => 'Example of use Many To Many Relation - addMany()',
    ];
  }

  public function defineProperties()
  {
    return [];
  }

  public function onRun()
  {
    $data[] = 'Page : '.$this->page->title;
    $data[] = 'URL  : '.$this->page->url;
    // $data[] = $this->rand_color();

    $es = Employee::all()->find(2);
    // dd($es);

    $data[] = $es->id;

    // return $data ?? '<p>$data est vide</p>';

    $usersDirector = User::all();

    // $data = $usersDirector->random()->id;
    // return $data ?? '<p>$data est vide</p>';

    $activities   = [];
    $nbActivities = mt_rand(5, 15);
    for ($i = 0; $i <= $nbActivities; ++$i) {
      $activities[] = new Activity([
        'name'               => 'Activity '.$i,
        'description'        => 'Description activity '.$i,
        'color'              => $this->rand_color(),
        'activity_id'        => $es->id,
        'activity_type_id'   => 1,
        'activity_status_id' => mt_rand(1, 3),
        'created_by_id'      => $usersDirector->random()->id,
        'updated_by_id'      => $usersDirector->random()->id,
      ]);
    }

    $subActivities   = [];
    $nbSubActivities = mt_rand(5, 15);
    for ($i = 0; $i <= $nbSubActivities; ++$i) {
      $subActivities[] = new SubActivity([
        'name'               => 'Sub Activity '.$i,
        'description'        => 'Description sub activity '.$i,
        'color'              => $this->rand_color(),
        'activity_id'        => $es->id,
        'activity_type_id'   => 1,
        'activity_status_id' => mt_rand(1, 3),
        'created_by_id'      => $usersDirector->random()->id,
        'updated_by_id'      => $usersDirector->random()->id,
      ]);
    }

    $es->activities()->addMany($activities);
    // $es->subActivities()->addMany($subActivities);

    // $cManager->save();

    // $es->save();

    return $data ?? '<p>$data est vide</p>';
    //   ->dump()
      //   ->first()
      //   ->get()
      // $data[] = str_repeat('-', 45);

      // $this->page['data'] = implode("\n<br>", $data);
  }

  public function rand_color()
  {
    return '#'.str_pad(dechex(mt_rand(0, 0xFFFFFF)), 6, '0', STR_PAD_LEFT);
  }
}
