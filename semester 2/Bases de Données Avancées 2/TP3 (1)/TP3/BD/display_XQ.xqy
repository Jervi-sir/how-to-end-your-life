xquery version "1.0";
(: Initialize Database :)

declare namespace xmldb="http://exist-db.org/xquery/xmldb";

declare function local:print_film($film){
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
<title> Affichage de la BD via XQuery</title>
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
       Contenu de la base de donnees via XQuery.
       </h2></center>
       <a href="javascript:history.go(-1)"> Back </a>
       <ul>
       {
       for $film in doc("/db/films.xml")//FILM
       return
	<li>
	{local:print_film($film)}
	</li>
       }
       </ul>
       </body>
}
</html>