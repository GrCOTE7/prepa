<?php

/*
 * (c) Boosteur.com - 2022
 */

namespace Grcote7\Profile;

use System\Classes\PluginBase;
use Winter\User\Controllers\Users as UsersController;

class Plugin extends PluginBase
{
  public function registerComponents()
  {
  }

  public function registerSettings()
  {
  }

  public function boot()
  {
    UsersController::extendFormFields(function ($form, $model, $content) {
      $form->addTabFields([
        'facebook' => [
          'label' => 'Facebook',
          'type'  => 'text',
          'tab'   => 'Profile',
        ],
        'bio' => [
          'label' => 'Biography',
          'type'  => 'textarea',
          'tab'   => 'Profile',
        ],
      ]);
    });
  }
}
