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
      '\GrCote7\WinterLearning\Components\TwigTips' => 'twigtips',
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
}
