<?php

/*
 * (c) Boosteur.com - 2022
 */

namespace Grcote7\Movies\FormWidgets;

use Backend\Classes\FormWidgetBase;
use Grcote7\Movies\Models\Actor;

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
    $this->prepareVars();

    // dump($this->vars['actors']);
    // dump($this->vars['selectedValues']);

    return $this->makePartial('actorbox');
  }

  public function prepareVars()
  {
    $this->vars['id']     = $this->model->id;
    $this->vars['actors'] = Actor::all()->lists('full_name', 'id');
    $this->vars['name']   = $this->formField->getName().'[]';
    if (!empty($this->getLoadValue())) {
      $this->vars['selectedValues'] = $this->getLoadValue();
    } else {
      $this->vars['selectedValues'] = [];
    }
  }

  public function getSaveValue($actors)
  {
    // Get values
    $newArray = [];

    // dd($actors);
    foreach ($actors as $actorId) {
      if (!is_numeric($actorId)) {
        $newActor     = new Actor();
        $nameLastname = explode(' ', $actorId);
        // dd($nameLastname);
        $newActor->name     = ucfirst($nameLastname[0]);
        $newActor->lastname = ucfirst($nameLastname[1]);
        $newActor->save();
        $newArray[] = $newActor->id;
      } else {
        $newArray[] = $actorId;
      }
    }
    // dd($newArray);

    return $newArray;
  }

  // Compare values

  // Save to mode

  // Create new array

  public function loadAssets()
  {
    $this->addCss('css/select2.css');
    $this->addJs('js/select2.js');
  }
}
