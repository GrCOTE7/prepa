<!DOCTYPE html>

<html lang="en">

<head>
  <meta charset="utf-8" />
  <title>Drop-Down Navigation: Touch-Friendly and Responsive demo by Osvaldas Valutis</title>
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="description" content="Demo of Drop-Down Navigation: Touch-Friendly and Responsive" />
  <meta name="robots" content="all">
  <meta name="viewport" content="width=device-width,initial-scale=1" />
  <link rel="canonical" href="/examples/drop-down-navigation-touch-friendly-and-responsive">
  <link rel="icon" href="../favicon.ico" />
  <link rel="stylesheet" href="style.css" />
  <link rel="stylesheet" href="//fonts.googleapis.com/css?family=Open+Sans:400">

  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
  <link href="../menub4/assets/css/bootstrap-4-hover-navbar.css" rel="stylesheet">
</head>

<body>
  <?php

echo $_SERVER["REQUEST_URI"];

?>
  <!-- Static navbar -->

  <nav id="nav" class="navbar navbar-expand-md navbar-light bg-light btco-hover-menu">
    <a class="navbar-brand" href="http://menub4">Navbar</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavDropdown">
      <ul class="navbar-nav">
        <!--                <li class="nav-item active">-->
        <!--                    <a class="nav-link" href="/">Home <span class="sr-only">(current)</span></a>-->
        <!--                </li>-->

        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            Links
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
            <li><a class="dropdown-item" href="action.php">1 Action</a></li>
            <li><a class="dropdown-item" href="#">1 Another action</a></li>
            <li><a class="dropdown-item dropdown-toggle" href="submenu.php"><b>1 Submenu</b></a>
              <ul class="dropdown-menu">
                <li><a class="dropdown-item" href="#">Submenu action</a></li>
                <li><a class="dropdown-item" href="#">Another submenu action</a></li>


                <li><a class="dropdown-item dropdown-toggle" href="submenu2.php"><b>2 Subsubmenu</b></a>
                  <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="#">Subsubmenu action aa</a></li>
                    <li><a class="dropdown-item" href="pagefinale.php"><b>3 Another subsubmenu
                          action</b></a></li>
                  </ul>
                </li>
                <li><a class="dropdown-item dropdown-toggle" href="#">Second subsubmenu</a>
                  <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="#">Subsubmenu action bb</a></li>
                    <li><a class="dropdown-item" href="#">3 Another subsubmenu action</a></li>
                  </ul>
                </li>
              </ul>
            </li>
            <li><a class="dropdown-item dropdown-toggle" href="#">1 Submenu 2</a>
              <ul class="dropdown-menu">
                <li><a class="dropdown-item" href="#">2 Submenu action 2</a></li>
                <li><a class="dropdown-item" href="#">2 Another submenu action 2</a></li>


                <li><a class="dropdown-item dropdown-toggle" href="#">2 Subsubmenu</a>
                  <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="#">3 Subsubmenu action 1 3</a></li>
                    <li><a class="dropdown-item" href="#">3 Another subsubmenu action 2 3</a></li>
                  </ul>
                </li>
                <li><a class="dropdown-item dropdown-toggle" href="#">2 Second subsubmenu 3</a>
                  <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="#">3 Subsubmenu action 3 </a></li>
                    <li><a class="dropdown-item" href="#">3 <b>Another subsubmenu action 3</b></a></li>
                  </ul>
                </li>
              </ul>
            </li>
          </ul>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="action.php">Action</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="submenu.php">submenu1</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="submenu2.php">submenu2</a>
        </li>
      </ul>
    </div>
  </nav>

  <nav id="nav" role="navigation">
    <a href="#nav" title="Show navigation">Show navigation</a>
    <a href="#" title="Hide navigation">Hide navigation</a>
    <ul class="clearfix">
      <li><a href="./">Home</a></li>
      <li>

        <a href="?blog" aria-haspopup="true"><span>Blog</span></a>
        <ul>
          <li><a href="?design">Design</a>

            <a href="?blog" aria-haspopup="true"><span>Blog</span></a>
            <ul class="clearfix">
              <li><a href="?webdesign">Web Design</a></li>
              <li><a href="?typography">Typography</a></li>
              <li><a href="?frontend">Front-End</a></li>
            </ul>


          </li>

          <li><a href="?html">HTML</a></li>
          <li><a href="?css">CSS</a></li>
          <li><a href="?javascript">JavaScript</a></li>
        </ul>
      </li>
      <li class="active">
        <a href="?work" aria-haspopup="true"><span>Work</span></a>
        <ul>
          <li><a href="?webdesign">Web Design</a></li>
          <li><a href="?typography">Typography</a></li>
          <li><a href="?frontend">Front-End</a></li>
        </ul>
      </li>
      <li><a href="?about">About</a></li>
    </ul>
  </nav>

  <h1>Menu avec modifs b4-normal + doubleTapToGo()</h1>
  <h2>Essai pour voir si réel</h2>

  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

  <!--
<script src="../menub4/assets/js/bootstrap-4-hover-navbar.js"></script>
-->

  <script src="js/doubleTapToGo.js"></script>
  <script>
    $(function() {
      $('#navb li:has(ul)').doubleTapToGo();
      $('#nav li:has(ul)').doubleTapToGo();
    });
  </script>


</body>

</html>