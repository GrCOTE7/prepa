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
    // return 'ok';

    $data = Db::table('backend_access_log')
      ->select('id')
      ->skip(10)
      ->take(3)
      ->get();

    $this->testType($data);
  }

  public function testType($var)
  {
    switch ($var) {
        case is_numeric($var) || \is_string($var):
        echo $var;

        break;
        case \is_array($var):
            echo 'Arr.: '.implode(', ', $var);

            break;
            case \is_object($var):
                print_r((array) $var);

            break;
        default:

            echo 'Autre';

            break;
    }
    echo '<br>';
  }
}
