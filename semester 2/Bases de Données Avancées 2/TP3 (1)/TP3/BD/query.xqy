xquery version "1.0";
(: Initialize Database :)

declare namespace request="http://exist-db.org/xquery/request";
declare namespace xmldb="http://exist-db.org/xquery/xmldb";

declare function local:print_film($film as element()){
<div>
<p>
Titre : {$film/TITRE/text()}<br/>
Genre : {$film/GENRE/text()}
</p> 
</div>
};

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title> Interrogation de la BD via XQuery</title>
</head>    
{
if (not ( doc( "/db/films.xml" ))) then
  <body>
  <p>
  Erreur : la base de donnees est vide.
  </p>
  <a href="javascript:history.go(-1)"> Back </a>
  </body>
else
  <body>
  <center><h2>
  Resultats de la requete XQuery.
  </h2></center>
  <p>
  {
  let $name := request:get-parameter("name",""),
  $field := request:get-parameter("field","any")
  return
   if ($field = "any") then
     for  $film in doc("/db/films.xml")//FILM    
     where ($film/TITRE=$name or $film/GENRE=$name or $film/@Annee=$name)
     return 
          local:print_film($film)
   else if ($field = "title") then
     for  $film in doc("/db/films.xml")//FILM    
     where ($film/TITRE=$name)
     return 
          local:print_film($film)
   else if ($field = "genre") then
     for  $film in doc("/db/films.xml")//FILM    
     where ($film/GENRE=$name)
     return 
          local:print_film($film)	
  else if ($field = "year") then
     for  $film in doc("/db/films.xml")//FILM    
     where ($film/@Annee=$name)
     return 
          local:print_film($film)	
  else ()
  }
  </p>
  <a href="javascript:history.go(-1)"> Back to Query page</a><br/>
  <a href="javascript:history.go(-2)"> Back to Main page</a>
  </body>
}
</html>