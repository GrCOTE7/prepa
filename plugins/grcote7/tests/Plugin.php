<?php

/*
 * (c) Boosteur.com - 2022
 */

namespace GrCote7\Tests;

/* 2do Tester et trouver comment commenter dans un fichier yaml pour découper la trad des pages
dans lang.yaml
*/

use Backend;
use Backend\Models\UserRole;
use Event;
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
      'description' => 'Tests divers...',
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
    Event::listen('winter.user.login', function ($user) {
      mail('gc7@cote7.com', 'test mail login', 'login');
    });
  }

  /**
   * Registers any front-end components implemented in this plugin.
   *
   * @return array
   */
  public function registerComponents()
  {
    return [
      'GrCote7\Tests\Components\Variables' => 'variables',
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

  public function registerSettings()
  {
    return [
      'location' => [
        'label'       => 'Locations',
        'description' => 'Manage available user countries and states.',
        'category'    => 'Users',
        'icon'        => 'icon-globe',
        'url'         => Backend::url('acme/user/locations'),
        'order'       => 500,
        'keywords'    => 'geography place placement',
      ],
    ];
  }
}
