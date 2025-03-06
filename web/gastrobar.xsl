<?xml version="1.0" encoding="UTF-8"?>

<!--
  Hoja de estilos XSLT para la página Gastrobar.
  Este archivo transforma un XML en una página HTML que muestra los entrantes del gastrobar.
  Se listan con su nombre, imagen y precio. Además, aquellos cuyo código empieza por "A"
  se destacan con la etiqueta "New".
-->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output encoding="utf-8" method="html" doctype-system="about:legacy-compat" />

    <!-- Hoja de estilos XSLT para la página Gastrobar -->
    <xsl:template match="/">
        <html>
            <head>
                <title>Gastrobar</title>
                <link rel="stylesheet" type="text/css" href="../css/estilo.css"/>
            </head>
            <body>
                <header>
                    <img src="../img/logotipo.png" alt="Reservas" />
                    <a href="gastrobar.xml">Gastrobar</a>
                    <a href="atracciones.xml">Atracciones</a>
                    <a href="eventos.xml">Eventos</a>
                </header>
                <main>
                    <h1>Entrantes</h1>
                    <div id="gastrobar">
                        <xsl:apply-templates select="gestionParque/gastrobar/platos/plato[@categoria='Entrante']"/>
                    </div>
                </main>
                <footer>
                    <address>&#169; Desarrollado por info@birt.eus</address>
                </footer>
            </body>
        </html>
    </xsl:template>
	
	<!-- Se muestra cada entrante con su imagen, nombre y precio -->
	<xsl:template match="plato">	
        <article class="articulo">
            <img src="../img/{foto}" class="imagen"/>
			
			<!-- Se añade el icono de novedad si el código del plato empieza con 'A' -->
            <xsl:if test="starts-with(@codigo, 'A')">
                <img src="../img/icono-novedad.png" class="novedad-icono"/>
            </xsl:if>
            <h2><xsl:value-of select="nom_plato"/></h2>
            <h3><xsl:value-of select="precio"/>€</h3>
        </article>
    </xsl:template>
</xsl:stylesheet>
