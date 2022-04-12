<?php

/*
 * (c) Boosteur.com - 2022
 */

namespace Grcote7\Contact\Components;

use Cms\Classes\ComponentBase;
use Mail;
use Winter\Storm\Exception\ValidationException;
use Winter\Storm\Support\Facades\Input;
use Winter\Storm\Support\Facades\Validator;

class ContactForm extends ComponentBase
{
  /**
   * Gets the details for the component.
   */
  public function componentDetails()
  {
    return [
      'name'        => 'Contact Form',
      'description' => 'Simple contact form',
    ];
  }

  /**
   * Returns the properties provided by the component.
   */
  public function defineProperties()
  {
    return [];
  }

  public function onSend()
  {
    $data = post();

    $rules = [
      'name'  => 'required|min:3',
      'email' => 'required|email',
    ];

    $validator = Validator::make($data, $rules);

    if ($validator->fails()) {
      throw new ValidationException($validator);
    }
    $vars = [
      'name'    => Input::get('name'),
      'email'   => Input::get('email'),
      'content' => Input::get('content'),
    ];

    Mail::send('grcote7.contact::mail.message', $vars, function ($message) {
      $message->to('myemail@gmail.com', 'Admin Person');
      $message->subject('New message from contact form');
    });
  }
}
