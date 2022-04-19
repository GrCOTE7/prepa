<?php

/*
 * (c) Boosteur.com - 2022
 */

$options = ['un', 'deux' => '2', 'trois' => 3];
extract([
  'page'    => 1,
  'perPage' => 5,
  'sort'    => 'created_at desc',
  'genres'  => null,
  'year'    => '',
]);

$arr = [
  'Pierre' => 'DUPONT',
  'Paul'   => 'MARTIN',
];
$data[] = $arr;

$arr    = array_merge($arr, $options);
$data[] = $arr;

extract($arr);

$data[] = $Paul;
