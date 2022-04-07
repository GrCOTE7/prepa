<?php

/*
 * (c) Boosteur.com - 2022
 */

namespace Grcote7\Movies\FormWidgets;

use Backend\Classes\FormWidgetBase;

/**
 * actorbox Form Widget.
 */
class Actorbox extends FormWidgetBase
{
  protected $defaultAlias = 'actorbox';

  public function widgetDetails()
  {
    return [
      'name'        => 'Actorbox',
      'description' => 'Field for adding actors',
    ];
  }

  public function render()
  {
    return $this->makePartial('actorbox');
  }

  public function loadAssets()
  {
    $this->addCss('css/select2.css');
    $this->addJs('js/select2.js');
  }
}
