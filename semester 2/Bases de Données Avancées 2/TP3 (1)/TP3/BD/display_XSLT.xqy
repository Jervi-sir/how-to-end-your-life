xquery version "1.0";
(: Initialize Database :)

declare namespace transform="http://exist-db.org/xquery/transform";
declare namespace xmldb="http://exist-db.org/xquery/xmldb";

if (not ( doc( "/db/films.xml" ))) then
   <html>
   <head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
   <title> Affichage de la BD via une transformation XSLT</title>
   </head>   
   <body>
   <p>
   Erreur : la base de donnees est vide.
   </p>
   <a href="javascript:history.go(-1)"> Back </a>
   </body>
   </html>
else
   transform:transform(doc( "/db/films.xml" )/FILMS,
   xs:anyURI("affiche.xsl"),<parameter/>)
