xquery version "1.0";
(: Update Database :)

declare namespace request="http://exist-db.org/xquery/request";
declare namespace xmldb="http://exist-db.org/xquery/xmldb";


(: Construit la modif XQuery Update en fonction des parametres :)
declare function local:new-film($titre as xs:string, $year as xs:string,
$genre as xs:string) as element()*
{
<xupdate:element name="FILM">
<xupdate:attribute name="Annee">{$year}</xupdate:attribute>
 <TITRE>{$titre}</TITRE>
 <GENRE>{$genre}</GENRE>
</xupdate:element>
};

(:Get parameters :)
let $titre := request:get-parameter("titre", ""),
 $year := request:get-parameter("year", ""),
 $genre := request:get-parameter("genre", "")

(: Create an XUpdate document :)
let $xupdate :=
<xupdate:modifications version="1.0"
  xmlns:xupdate="http://www.xmldb.org/xupdate" >
  <xupdate:append select=" doc( '/db/films.xml' )/FILMS">
  {local:new-film($titre,$year,$genre)}
  </xupdate:append>
</xupdate:modifications>

let $collection := "xmldb:exist:///db",
 $dummy := xmldb:update($collection, $xupdate)

return

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title> Mise à jour de la BD via XQuery</title>
</head>    
{
if ($dummy = 0) then
  <body>
  <p>
  Aucune modification effectuee
  </p>
  <a href="javascript:history.go(-1)"> Back </a>
  </body>
else
  <body>
  <p>
  {$dummy} modification(s).
  </p>
  <a href="javascript:history.go(-1)"> Back to Update page</a><br/>
  <a href="javascript:history.go(-2)"> Back to Main page</a>
  </body>
}
</html>