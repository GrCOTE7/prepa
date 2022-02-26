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

  public function content()
  {
    Db::table('cms_theme_logs')->chunkById(5, function ($logs) {
      foreach ($logs as $log) {
        echo $log->id.' ('.$log->theme.') : '.$log->template.'<br>';
      }
      echo str_repeat('*', 62);
      echo '<br>';
    });
    exit;
  }
}
