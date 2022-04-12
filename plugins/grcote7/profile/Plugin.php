<?php

/*
 * (c) Boosteur.com - 2022
 */

namespace Grcote7\Profile;

use System\Classes\PluginBase;
use Winter\User\Controllers\Users as UsersController;
use Winter\User\Models\User as UserModel;

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
    UserModel::extend(function ($model) {
      $model->addFillable([
        'facebook',
        'bio',
      ]);
    });
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
