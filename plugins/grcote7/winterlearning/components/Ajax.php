<?php

/*
 * (c) Boosteur.com - 2022
 */

namespace GrCote7\WinterLearning\Components;

use Cms\Classes\ComponentBase;
use Flash;
use ValidationException;
use Validator;

class Ajax extends ComponentBase
{
  public function componentDetails()
  {
    return [
      'name'        => 'Ajax Component',
      'description' => 'A simple example of Ajax use',
    ];
  }

  public function defineProperties()
  {
    return [];
  }

  public function onTest()
  {
    $this->page['result'] = input('value1') + input('value2');
    Flash::success('Calcul réalisé !');
  }

  public function onDoSomething()
  {
    $data = post();

    $rules = [
      'email' => 'required|email',
      'name'  => 'required',
    ];

    $validation = Validator::make($data, $rules);

    if ($validation->fails()) {
      throw new ValidationException($validation);
    }

    Flash::success('Jobs done!');
  }
}
