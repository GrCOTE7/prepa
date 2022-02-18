<?php

/*
 * (c) Boosteur.com - 2022
 */

namespace GrCote7\WinterLearning\Components;

use Cms\Classes\ComponentBase;

class TwigTips extends ComponentBase
{
  public $var = 123;

  public function componentDetails()
  {
    return [
      'name'        => 'TwigTips Component',
      'description' => 'Some tips for Twig',
    ];
  }

  public function defineProperties()
  {
    return [];
  }

  public function content()
  {
    echo 'Boucle for:<br>';
    for ($i = 1; $i <= 5; ++$i) {
      echo $i.' ';
    }
    $listing = range(0, 7);

    // print_r($listing);

    echo '<hr>abc ';

    return $listing;
  }
}
