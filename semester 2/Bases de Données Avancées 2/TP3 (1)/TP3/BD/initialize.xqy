xquery version "1.0";
(: Initialize Database :)

declare namespace xmldb="http://exist-db.org/xquery/xmldb";

let $collection := "xmldb:exist:///db",
$dummy := xmldb:store($collection, "films.xml", 
xs:anyURI("http://www.lif.univ-mrs.fr/~preynier/XML/files/films.xml"))

return

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title> Initialisation de la BD </title>
</head>
<body>
<p> 
    {
    if (not ( doc( "/db/films.xml" ))) then
       <p>
       Erreur : la base de donnees est vide
       </p>
    else
       <p>
       La base de donnees a ete (re)initialisee.
       </p>
    }
</p>
<br/>
<a href="javascript:history.go(-1)"> Back </a>
</body>
</html>