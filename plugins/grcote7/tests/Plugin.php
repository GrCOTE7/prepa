<?php

/*
 * (c) Boosteur.com - 2022
 */

namespace GrCote7\Tests;

use Backend;
use Backend\Models\UserRole;
use System\Classes\PluginBase;

/**
 * Tests Plugin Information File.
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
      'name'        => 'Tests',
      'description' => 'No description provided yet...',
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
    return []; // Remove this line to activate

    return [
      'GrCote7\Tests\Components\MyComponent' => 'myComponent',
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
      'grcote7.tests.some_permission' => [
        'tab'   => 'Tests',
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
      'tests' => [
        'label'       => 'Tests',
        'url'         => Backend::url('grcote7/tests/mycontroller'),
        'icon'        => 'icon-leaf',
        'permissions' => ['grcote7.tests.*'],
        'order'       => 500,
      ],
        ];
  }
}
