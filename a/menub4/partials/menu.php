<h1>
  <?php
  $uri      =  $_SERVER['REQUEST_URI'];
  $partsUri = explode('/', $uri);
  $partsUri = array_reverse($partsUri);
  // var_dump($partsUri);
  $uri = $partsUri[0];
  echo ($uri) ? $uri:'index.php';
  ?>
</h1>
<!-- Static navbar -->
<nav class="navbar navbar-expand-md navbar-light bg-light btco-hover-menu">
  <a class="navbar-brand" href="/a/menub4">Navbar</a>
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
          <li><a class="dropdown-item" href="/a/menub4/pages/action.php">1 Action</a></li>
          <li><a class="dropdown-item" href="#">1 Another action</a></li>
          <li><a class="dropdown-item dropdown-toggle" href="/a/menub4/pages/submenu.php"><b>1 Submenu</b></a>
            <ul class="dropdown-menu">
              <li><a class="dropdown-item" href="#">Submenu action</a></li>
              <li><a class="dropdown-item" href="#">Another submenu action</a></li>


              <li><a class="dropdown-item dropdown-toggle" href="/a/menub4/pages/submenu2.php"><b>2 Subsubmenu</b></a>
                <ul class="dropdown-menu">
                  <li><a class="dropdown-item" href="#">Subsubmenu action aa</a></li>
                  <li><a class="dropdown-item" href="/a/menub4/pages/pagefinale.php"><b>3 Another subsubmenu
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
          <li><a class="dropdown-item dropdown-toggle" href="">1 no lk Submenu 2</a>
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
      <li class="nav-item"><a class="nav-link" href="/a/menub4/pages/action.php">Action &nbsp; |</a></li>
      <li class="nav-item"><a class="nav-link" href="/a/menub4/pages/submenu.php">submenu1 &nbsp; |</a></li>
      <li class="nav-item"><a class="nav-link" href="/a/menub4/pages/submenu2.php">submenu2 &nbsp; |</a></li>
      <li class="nav-item"><a class="nav-link" href="/a/menub4/pages/pagefinale.php">Action Finale</a></li>
    </ul>
  </div>
</nav>