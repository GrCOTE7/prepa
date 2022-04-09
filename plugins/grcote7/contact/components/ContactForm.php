<?php

/*
 * (c) Boosteur.com - 2022
 */

namespace Grcote7\Contact\Components;

use Cms\Classes\ComponentBase;
use Input;
use Mail;
use Validator;

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
    $validator = Validator::make(
      [
        'name'  => Input::get('name'),
        'email' => Input::get('email'),
      ],
      [
        'name'  => 'required|min:3',
        'email' => 'required|email',
      ]
    );

    // These variables are available inside the message as Twig
    $vars = [
      'name'    => trim(Input::get('name')),
      'email'   => trim(Input::get('email')),
      'content' => trim(Input::get('content')),
    ];

    if ($validator->fails()) {
      return [
        '#result' => $this->renderPartial(
          'contactform::messages',
          ['fieldMsgs' => $validator->messages()],
        //   ['errorMsgs' => $validator->messages()->all()],
        ),
      ];
    }

    Mail::send('grcote7.contact::mail.message', $vars, function ($message) {
      $message->to('myemail@gmail.com', 'Admin Person');
      $message->subject('New message from contact form');
    });
  }
}
