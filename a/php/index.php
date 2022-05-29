<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Boucle</title>
</head>

<body>
    Oki
    <hr>
    <?php

//2do À poser ds c57
// Réglages FF pour ouvrir toujours ds même fenêtre par défaut
// Ctrl + clic poour forcer nouvel onglet
// Ctrl + Maj + clic pour forcer nouvel onglet et y aller directement
//@v url: about:config
//@v  browser.link.open_newwindow 3 => 1
//@v  browser.link.open_newwindow.restriction 2 => 0
?>
    http://kb.mozillazine.org/browser.link.open_newwindow (default: 3)
    1: current tab; 2:new window; 3:new tab;

    This pref set the behavior for JavaScript links:

    http://kb.mozillazine.org/browser.link.open_newwindow.restriction (default: 2)
    0:all; 1:none; 2:only special windows
    <?php
    include 'boucle.php';

    ?>

</body>

</html>