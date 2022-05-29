ready(function () {
  var r = document.getElementById("result");


  var maVar = "<br>Ma première variable en JS";
  //r.style.textAlign('right');
  show(maVar + ' (' + maVar.length + ' caractères)');





  var uneAutreVar = 777;
  show(uneAutreVar);
  show('Encore une autre ligne affichée...');
  show("Momo");
  show("N");
  
  function ajouter(a, b){
    return a + b;
  }
  show(ajouter(2, 2));
  //show(confirm("Continuons-nous ?"));
  
  /*var leNombre = 2;
  while(leNombre <= 1024){
    print(leNombre);
    leNombre = leNombre + 2;
  }*/

 /* var resultat = 1;
  var compteur = 0;
  while(compteur < 10){
    resultat = resultat * 2;
    compteur = compteur + 1;
  }
  show(resultat);
  //for (var nombre = 0; nombre <= 12; nombre + 2)
  show (nombre);*/
  show("The best");
  function show(data) {
    r.innerHTML += '<br>' + data;
  }

});
function ready(fn) {
  var d = document;
  (d.readyState == 'loading') ? d.addEventListener('DOMContentLoaded', fn) : fn();
}
