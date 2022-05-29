<?php
  $uri      =  $_SERVER['REQUEST_URI'];
  $partsUri = explode('/', $uri);
  $partsUri = array_reverse($partsUri);
  // var_dump($partsUri);
  $uri = $partsUri[0] ? $partsUri[0]:'index.php';

  $partsUri = explode('.', $uri);
  $page = ucfirst($partsUri[0]);

  ?>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Menu | <?= $page ?></title>
  <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
  <link rel="icon" href="../favicon.ico">

  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
  <link rel="stylesheet" href="../assets/css/all.css">
</head>

<body>
  <?= $page.'.php' ?>
  <hr>
  <h1>Test Menu pour Touch devices</h1>

  <?php include 'menu.php'; ?>
  <aside>
    <?php //include 'accordion.php';
  ?>
  </aside>