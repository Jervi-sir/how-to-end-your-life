<?xml version="1.0" encoding="ISO-8859-1"?>

<xsl:stylesheet version="1.0" 
           xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="html"/>


<xsl:template match="/FILMS">
 <!-- D'ebut du code html -->

    <html>
      <head>

        <title>Liste des films</title>
      </head>
      <body bgcolor="white">
<h1> Liste des Films </h1>

	<xsl:for-each select="FILM">

        <!-- on applique tous les templates sur les fils de FILM, donc sur TITRE, GENRE, PAYS, MES,..., ROLES,... -->
	<xsl:apply-templates select="*" />
	</xsl:for-each>
       		
      </body>
     </html>

 </xsl:template>

<!-- on traite le TITRE, GENRE OU PAYS de la même manière : on affiche la catégorie, soullignée et la valeur -->

<xsl:template match="TITRE|GENRE|PAYS" >
<u><xsl:value-of select="name(.)" /> </u> : <b> <xsl:value-of select="." /> </b> <br/>
</xsl:template>

<!-- pour chaque ensemble de ROLES on ouvre une liste html avec <ul></ul> puis on applique
 tous les templates à tous ces fils, c'est à dire à chaque ROLE.
 -->

<xsl:template match="ROLES" >
<ul>
<xsl:apply-templates select="*" />
</ul><br/>
</xsl:template>

<!-- Pour chaque role, on affiche prénom, nom et l'intitulé. on utilise xsl:text pour les espaces -->
<xsl:template match="ROLE" >
<li><xsl:value-of select="PRENOM" /><xsl:text> </xsl:text><xsl:value-of select="NOM" /> <xsl:text> : </xsl:text><xsl:value-of select="INTITULE" /></li>
</xsl:template>

<!-- important, on ignore les autres balises qui ne matchent rien de ce qu'il y a au dessus (sinon le contenu des résumés s'affiche) -->
<xsl:template match="*" >
</xsl:template>


</xsl:stylesheet>
