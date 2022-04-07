<?php

/*
 * (c) Boosteur.com - 2022
 */

namespace Grcote7\Movies;

use System\Classes\PluginBase;

class Plugin extends PluginBase
{
  public function registerComponents()
  {
    return [
      'Grcote7\Movies\Components\Actors' => 'actors',  ];
  }

  public function registerFormWidgets()
  {
    return [
      'Grcote7\Movies\FormWidgets\Actorbox' => [
        'label' => 'Actorbox',
        'code'  => 'actorbox',
      ],
    ];
  }

  public function registerSettings()
  {
  }
}
