<?php

/*
 * (c) Boosteur.com - 2022
 */

namespace Grcote7\Contact;

use System\Classes\PluginBase;

class Plugin extends PluginBase
{
  public function registerComponents()
  {
    return [
      'Grcote7\Contact\Components\ContactForm' => 'contactform',
    ];
  }

  public function registerSettings()
  {
  }
}
