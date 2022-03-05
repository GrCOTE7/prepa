<?php

/*
 * (c) Boosteur.com - 2022
 */

namespace Grcote7\Marriage;

use Backend;
use Backend\Models\UserRole;
use System\Classes\PluginBase;

/**
 * Marriage Plugin Information File.
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
      'name'        => 'Marriage',
      'description' => 'Gestion des Invités',
      'author'      => 'Grcote7',
      'icon'        => 'icon-venus-mars',
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
      'Grcote7\Marriage\Components\Guests' => 'guests',
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
      'grcote7.marriage.some_permission' => [
        'tab'   => 'Marriage',
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
      'marriage' => [
        'label'       => 'Marriage',
        'url'         => Backend::url('grcote7/marriage/mycontroller'),
        'icon'        => 'icon-heart',
        'permissions' => ['grcote7.marriage.*'],
        'order'       => 500,
      ],
        ];
  }

  public function onRun()
  {
    // This code will be executed when the page or layout is
    // loaded and the component is attached to it.

    $this->page['var'] = 123; // Inject some variable to the page

    // if (true) {
    //   return 123;
    // }
  }
}
