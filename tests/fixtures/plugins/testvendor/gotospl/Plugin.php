<?php

/*
 * (c) Boosteur.com - 2022
 */

namespace TestVendor\Gotospl;

use System\Classes\PluginBase;

class Plugin extends PluginBase
{
  public function pluginDetails()
  {
    return [
      'name'        => 'Invalid Test Plugin',
      'description' => 'Test plugin used by unit tests to detect plugins with invalid namespaces.',
      'author'      => 'Test Vendor',
    ];
  }
}
