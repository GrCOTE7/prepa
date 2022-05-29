<?php include './parts/deb.php'?>
<div class="container">
  <h2>Index</h2>
</div>
<!--

  // 2do: Menu
  
  1 / 
  https://www.jqueryscript.net/demo/Responsive-Mega-Menu-dmenu/demo/xmpl7.html#
  => a/megaMenu : Bug / GSM
  -> Essai avec doubleTapToGo.js            ___
  -> Cf. pk menu <> / GMS (Abs de ss liens) ___

  2. Cf.css fmk Bulma                          ___

  3. Cf. css fmk Twitter navbar                ___

  <p>https: //osvaldas.info/drop-down-navigation-responsive-and-touch-friendly</p>
  => fctn doubleTapToGo.js

Code pour activer hover
  https://stackoverflow.com/questions/42183672/how-to-implement-a-navbar-dropdown-hover-in-bootstrap-v4/42183824#

-->
<script>
    $(function() {
      $('#menu li:has(ul)').doubleTapToGo();
    });
  </script>
<?php include './parts/fin.php'?>
