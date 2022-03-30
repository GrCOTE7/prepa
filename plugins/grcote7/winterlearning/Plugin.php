<?php

/*
 * (c) Boosteur.com - 2022
 */

namespace GrCote7\WinterLearning;

use Backend;
use Backend\Models\UserRole;
use System\Classes\PluginBase;

/**
 * WinterLearning Plugin Information File.
 */
class Plugin extends PluginBase
{
  /**
   * Returns information about this plugin.
   *
   * @return array
   */
  public function pluginDetails()
  {
    return [
      'name'        => 'WinterLearning',
      'description' => 'Just for learn Winter CS',
      'author'      => 'GrCote7',
      'icon'        => 'icon-leaf',
    ];
  }

  /**
   * Register method, called when the plugin is first registered.
   *
   * @return void
   */
  public function register()
  {
  }

  /**
   * Boot method, called right before the request route.
   *
   * @return array
   */
  public function boot()
  {
  }

  /**
   * Registers any front-end components implemented in this plugin.
   *
   * @return array
   */
  public function registerComponents()
  {
    return [
      '\GrCote7\WinterLearning\Components\TwigTips'   => 'twigtips',
      '\GrCote7\WinterLearning\Components\Ajax'       => 'ajax',
      '\GrCote7\WinterLearning\Components\Database'   => 'database',
      '\GrCote7\WinterLearning\Components\ManyToMany' => 'manytomany',
    ];
  }

  /**
   * Registers any back-end permissions used by this plugin.
   *
   * @return array
   */
  public function registerPermissions()
  {
    return []; // Remove this line to activate

    return [
      'grcote7.winterlearning.some_permission' => [
        'tab'   => 'WinterLearning',
        'label' => 'Some permission',
        'roles' => [UserRole::CODE_DEVELOPER, UserRole::CODE_PUBLISHER],
            ],
        ];
  }

  /**
   * Registers back-end navigation items for this plugin.
   *
   * @return array
   */
  public function registerNavigation()
  {
    return []; // Remove this line to activate

    return [
      'winterlearning' => [
        'label'       => 'WinterLearning',
        'url'         => Backend::url('grcote7/winterlearning/mycontroller'),
        'icon'        => 'icon-leaf',
        'permissions' => ['grcote7.winterlearning.*'],
        'order'       => 500,
      ],
        ];
  }

  public function registerMarkupTags()
  {
    return [
      'filters' => [
        // A global function, i.e str_plural()
        'plural' => 'str_plural',
        'allmaj' => 'strtoupper',

        // A local method, i.e $this->makeTextAllCaps()
        'uppercase' => [$this, 'makeTextAllCaps'],
        ],

        'functions' => [
          // Using an inline closure
          'helloWorld' => function () { return 'Bonjour tout le monde !'; },
          'double' => function ($i) { return $i * 2; },
        ],
    ];
  }

  public function makeTextAllCaps($text)
  {
    return strtoupper($text);
  }
}
