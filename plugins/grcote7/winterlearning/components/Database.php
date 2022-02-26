<?php

/*
 * (c) Boosteur.com - 2022
 */

namespace Grcote7\WinterLearning\Components;

use Cms\Classes\ComponentBase;
use Db;

class Database extends ComponentBase
{
  public function componentDetails()
  {
    return [
      'name'        => 'Database Component',
      'description' => 'Diverses opé sur Database...',
    ];
  }

  public function defineProperties()
  {
    return [];
  }

  public function users()
  {
    $logs = Db::table('cms_theme_logs')->lists('template', 'id');

    foreach ($logs as $id => $template) {
      echo $id.' : '.$template;
      echo '<hr>';
    }
  }
}
