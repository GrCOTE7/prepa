<?php

/*
 * (c) Boosteur.com - 2022
 */

function onStart()
{
  // Way 1
  $this['friends_1'] = [
    [
      'name'     => 'Pierre',
      'lastname' => 'DUPONT',
    ],
    [
      'name'     => 'Paul',
      'lastname' => 'MARTIN',
    ],
  ];

  // Way 2
  $this['friends_2'] = [
    [
      'Pierre' => 'DUPONT',
    ],
    [
      'Paul' => 'MARTIN',
    ],
  ];
}
