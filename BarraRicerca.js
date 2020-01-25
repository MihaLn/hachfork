function BarraRicerca() {
  var xmlhttp = new XMLHttpRequest();
  var stringa = document.getElementById("ricerca").getAttribute("value");
  var JSONdoc;
  var html = "";
  xmlhttp.onreadystatechange = function () {
    if (this.readyState == 4 && this.status == 200) 
    {
      //JSONdoc = this.responseText;
      JSONdoc = JSON.parse(this.responseText);
      for (i in JSONdoc.ricette) {
        html += "<a href='index.html'><h3>" +"nome:" +JSONdoc.ricette[i].nome+"<br> descrizione: "+JSONdoc.ricette[i].descrizione+"<br>tipologia: "+JSONdoc.ricette[i].tipologia+"<br> creatore: "+JSONdoc.ricette[i].username+"</h3></a>";
      }
      //alert(this.responseText);
      document.getElementById("view").innerHTML = html;
    console.log(JSONdoc.ricette[0].nome);
    }
  };
  xmlhttp.open("GET","ricerca.php?stringa="+stringa, true);
  xmlhttp.setRequestHeader("Content-Type", "application/json");
  xmlhttp.send();
}
//"ricerca.php?stringa='stringa'"