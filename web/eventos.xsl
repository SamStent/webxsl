<?xml version="1.0" encoding="UTF-8"?>

<!-- 
    Hoja de estilos XSLT para la página de Eventos.
    Este archivo transforma un XML en una página HTML que muestra los eventos del parque.
    Muestra solo los eventos del 2024 ordenados por fecha, el año esta almacenado en una 
    variable, cambiendo su valor vemos otros eventos. Se muestra el nombre del evento, el 
    total de comentarios y los comentarios.
-->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output encoding="utf-8" method="html" doctype-system="about:legacy-compat" />  

    <!-- Hoja de estilos XSLT para la página de Eventos -->
    <xsl:template match="/">
        <xsl:variable name="year" select="'2024'"/>
        <html>
            <head>
                <title>Eventos</title>
                <link rel="stylesheet" type="text/css" href="../css/estilo.css"/>
            </head>
            <body>
                <header>
                    <img src="../img/logotipo.png" alt="Reservas" />
                    <a href="gastrobar.html">Gastrobar</a>
                    <a href="atracciones.html">Atracciones</a>
                    <a href="eventos.html">Eventos</a>
                </header>
                <main>
                    <h1>Eventos del 2024</h1>
					<!-- Filtra solo los eventos del 2024 y los ordena de diciembre a enero -->
                    <xsl:apply-templates select="gestionParque/eventos/evento[starts-with(fechaHora, $year)]">
                        <xsl:sort select="fechaHora" order="descending"/>
                    </xsl:apply-templates>
                </main>
                <footer>
                    <address>&#169; Desarrollado por info@birt.eus</address>
                </footer>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="evento">
		<!-- Muestra el evento con su nombre y la cantidad total de comentarios -->
        <article class="eventos">
            <h4>
                <xsl:value-of select="descripcion"/> -
                <xsl:value-of select="count(comentarios/comentario)"/> Comentarios
            </h4>
            <ul>
                <xsl:apply-templates select="comentarios/comentario"/>
            </ul>
        </article>
    </xsl:template>
    
    <xsl:template match="comentario">
        <li><xsl:value-of select="."/></li>
    </xsl:template>
</xsl:stylesheet>
