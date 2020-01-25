<?php
$conn=mysqli_connect("localhost","root","","Make_Easy");
if($conn)
{
    //mysqli_set_charset("utf8");
  $stringa=$_GET["stringa"];
  //echo "*".$stringa."*";
  $Query="Select idR, Ricette.nome, tempo, kcal, procedimento, quantita, descrizione, tipologia, Utenti.username From Ricette,ingredienti,RicIng,Utenti Where Ricette.idR=RicIng.codR AND RicIng.codI=ingredienti.idI AND Utenti.idUtente=Ricette.codUtente ";

  $stringhe = explode(',', $stringa);
  if(count($stringhe)>1)
  {
    $str1=$stringhe[0];
    $str2=$stringhe[1];
    //echo $str1;
    //echo $str2;
    $ingredienti=explode("+",$str1);
    $allergeni=explode("+",$str2);
    $x=0;
      while($x<=count($allergeni))
    {
        //echo "*".$ingredienti[$x]."*";
        $Query= $Query."AND ingredienti.nome =\"".$ingredienti[i]."\"";
        $x++;
    }
      $x=0;
      while($x<=count($allergeni))
    {
      $Query= $Query."AND ingredienti.nome <> \"".$allergeni[$x]."\"";
      $x++;
    }
  }
  else if(count($stringhe)<2)
  {
    $ingredienti=explode("+",$stringhe[0]);
      $x=0;
      //echo count($ingredienti);
      while($x<count($ingredienti))
      {
          $Query = $Query . "AND ingredienti.nome =\"" . $ingredienti[$x] . "\" ";
          $x++;
      }
  }
  //echo $Query;
  $Query= $Query."GROUP BY idR ;";
  $ricette=mysqli_query($conn,$Query);
  //echo "*".$ricette."*";
  $jsonn=array();
  if(mysqli_num_rows($ricette)>0)		
  {
      //echo mysqli_num_rows($ricette);
      $x=0;
      $string='{"ricette":[';
    while($row = mysqli_fetch_array($ricette))
    {
      $string= $string.'{"idR":"'.$row["idR"].'","nome":"'.$row["nome"].'","tempo":"'.$row["tempo"].'","kcal":"'.$row["kcal"].'","procedimento":"'.$row["procedimento"].'","quantita":"'.$row["quantita"].'","descrizione":"'.$row["descrizione"].'","tipologia":"'.$row["tipologia"].'","username":"'.$row["username"].'"}';
      if($x<(mysqli_num_rows($ricette)-1))
      {
        $string= $string.',';
      }
      $x++;
      //echo $row["nome"];
    }
    $string=$string."]}";
      //$string= json_encode(mysqli_fetch_all($ricette));
      echo $string;
  }
}
else
{
    echo null;
}
mysqli_close($conn);
?>