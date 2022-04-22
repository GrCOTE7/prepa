<?php

// (c) Boosteur.com - 2022

namespace Grcote7\Movies\Components;

use Cms\Classes\ComponentBase;
use Flash;
use Grcote7\Movies\Models\Actor;
use Input;
use System\Models\File;
use Winter\Storm\Exception\ValidationException;
use Winter\Storm\Support\Facades\Validator;

class ActorForm extends ComponentBase
{
  /**
   * Gets the details for the component.
   */
  public function componentDetails()
  {
    return [
      'name'        => 'Actor Form',
      'description' => 'Enter actors',
    ];
  }

  /**
   * Returns the properties provided by the component.
   */
  public function defineProperties()
  {
    return [];
  }

  public function onSubmit()
  {
    $validator = Validator::make(
      $form = Input::all(),
      [
        'name'     => 'required',
        'lastname' => 'required',
      ]
    );

    if ($validator->fails()) {
      throw new ValidationException($validator);
    }

    $actor             = new Actor();
    $actor->name       = Input::get('name');
    $actor->lastname   = Input::get('lastname');
    $actor->actorimage = Input::file('actorimage');

    $actor->save();
    Flash::success('Actor added !');
  }

  public function onImageUpload()
  {
    $image = Input::all();
    $file  = (new File())->fromPost($image['actorimage']);

    return [
      '#imageResult' => '<img src="'.$file->getThumb(200, 200, ['mode' => 'crop']).'" />',
    ];
  }
}
