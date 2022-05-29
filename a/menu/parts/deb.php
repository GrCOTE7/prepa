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

<!-- Compressed CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/foundation-sites@6.5.1/dist/css/foundation.min.css" integrity="sha256-1mcRjtAxlSjp6XJBgrBeeCORfBp/ppyX4tsvpQVCcpA= sha384-b5S5X654rX3Wo6z5/hnQ4GBmKuIJKMPwrJXn52ypjztlnDK2w9+9hSMBz/asy9Gw sha512-M1VveR2JGzpgWHb0elGqPTltHK3xbvu3Brgjfg4cg5ZNtyyApxw/45yHYsZ/rCVbfoO5MSZxB241wWq642jLtA==" crossorigin="anonymous">

  <link rel="stylesheet" href="../assets/css/all.css">
</head>

<body>
  <?= $page.'.php' ?>
  <hr>
  <h1>Test Menu pour Touch devices</h1>

  <?php include 'menu.php'; ?>
