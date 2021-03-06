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
    // dd($this->vars);
    if (!empty($this->getLoadValue())) {
      $this->vars['selectedValues'] = $this->getLoadValue();
    } else {
      // dd($this->vars);
      $this->vars['selectedValues'] = [];
    }
  }

  public function getSaveValue($actors)
  {
    // Get values
    $newArray = [];

    // var_dump($actors);
    if (!empty($actors)) {
      foreach ($actors as $actorId) {
        // Compare values
        if (!is_numeric($actorId)) {
          $newActor     = new Actor();
          $nameLastname = explode(' ', $actorId);
          //   dd($nameLastname);
          $newActor->name     = ucfirst($nameLastname[0]);
          $newActor->lastname = ucfirst($nameLastname[1]);
          // Save to model
          $newActor->save();
          // Create new array
          $newArray[] = $newActor->id;
        } else {
          $newArray[] = $actorId;
        }
      }
    }
    // dd($newArray);

    return $newArray;
  }

  public function loadAssets()
  {
    $this->addCss('css/select2.css');
    $this->addJs('js/select2.js');
  }
}
