<?php

/*
 * (c) Boosteur.com - 2022
 */

namespace Grcote7\Marriage;

use Backend;
use Backend\Models\UserRole;
use System\Classes\PluginBase;
use Winter\Storm\Database\Relations\Relation;
use Winter\User\Models\User;

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
    User::extend(function ($user) {
      $user->hasOne['guest'] = ['Grcote7\Marriage\Models\Guest'];
      $user->hasOneThrough['familly'] = [
        'Grcote7\Marriage\Models\Familly',
        'through' => 'Grcote7\Marriage\Models\Guest',
      ];
    });

    Relation::morphMap([
      'guest' => 'Grcote7\Marriage\Models\Guest',
      'group' => 'Grcote7\Marriage\Models\Group',
    ]);
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
    // return []; // Remove this line to activate

    return [
      'grcote7.marriage.permissions' => [
        'tab'   => 'Marriage',
        'label' => 'Allow access to the plugin',
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
    // return []; // Remove this line to activate

    return [
      'marriage' => [
        'label'       => 'Marriage',
        'url'         => Backend::url('grcote7/marriage/guests'),
        'icon'        => 'icon-venus-mars',
        'permissions' => ['grcote7.marriage.permissions'],
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
