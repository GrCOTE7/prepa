<?php namespace GrCOTE7\Dpt;

/**
 * The plugin.php file (called the plugin initialization script) defines the plugin information class.
 */

use System\Classes\PluginBase;

class Plugin extends PluginBase {

  public function pluginDetails() {

    return [
      'name'        => 'DptName',
      'description' => 'Donne le nom du département.',
      'author'      => 'LC',
      'icon'        => 'icon-hand-o-up'
    ];
  }


  public function registerComponents() {

    return [
      '\GrCOTE7\Dpt\Components\Dpt' => 'dptName'
    ];
  }
}
