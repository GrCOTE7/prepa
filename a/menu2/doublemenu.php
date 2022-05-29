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
</head>

<body>

  <nav id="nav" role="navigation">
    <a href="#nav" title="Show navigation">Show navigation</a>
    <a href="#" title="Hide navigation">Hide navigation</a>
    <ul class="clearfix">
      <li><a href="?home">Home</a></li>
      <li>
        <a href="?blog" aria-haspopup="true"><span>Blog</span></a>
        <ul>
   
        <li><a href="?design">Design</a>
          
        <ul>
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

  <script src="../mdb/js/jquery-3.3.1.min.js"></script>
  <script src="js/doubleTapToGo.js"></script>
  <script>
    $(function() {
      $('#nav li:has(ul)').doubleTapToGo();
    });
  </script>

  <h1>Menu avec doubleTapToGo()</h1>

</body>

</html>