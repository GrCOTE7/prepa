<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap 4 Navbar with hover multi dropdown</title>

    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css"
          integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">

    <link href="/a/menub4/assets/css/bootstrap-4-hover-navbar.css" rel="stylesheet">


    <!--Demo purpose css-->
    <style>
        body {
            /* padding-top: 10px; */
        }

        .navbar {
            /* margin: 20px 0; */
        }

        .jumbotron {
            background-color: #1f1f1f;
            color: #fff;
        }

        footer {
            text-align: right;
            margin: 20px;
        }
    </style>
</head>
<body>

<div class="container">

    <?php include 'menu.php' ?>

    <!-- Main component for a primary marketing message or call to action -->
    <div class="jumbotron">
        <h1>Bootstrap 4 multi dropdown navbar</h1>
        <p>This example of bootstrap 4 navigation with multi dropdown menu.</p>
        <p>
            <a class="btn btn-lg btn-danger"
               href="https://bootstrapthemes.co/demo/resource/bootstrap-4-multi-dropdown-navbar/" target="_blank"
               role="button">Live Demo</a>
            <a class="btn btn-lg btn-primary"
               href="https://github.com/bootstrapthemesco/bootstrap-4-multi-dropdown-navbar" target="_blank"
               role="button">Download from Github</a>
            <a class="btn btn-lg btn-info"
               href="https://bootstrapthemes.co/demo/resource/bootstrap-4-multi-dropdown-navbar-hover/" target="_blank"
               role="button">hover version origin</a>
            <a class="btn btn-lg btn-info" href="http://menub4/" role="button">click</a>
        </p>
    </div>
</div>
