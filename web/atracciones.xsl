<?xml version="1.0" encoding="UTF-8"?>

<!-- 
	Hoja de estilos XSLT para la página de Atracciones.
	Este archivo transforma un XML en una página HTML que muestra las atracciones del parque.
	Se incluyen el nombre, la edad mínima y el peso máximo permitido.
	Además, el nombre de cada atracción enlaza a su página en Wikipedia,
	transformando los espacios en barras bajas con la función translate().
-->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output encoding="utf-8" method="html" doctype-system="about:legacy-compat" />

  <!-- Hoja de estilos XSLT para la página de Atracciones -->
  <xsl:template match="/">
    <html>
      <head>
        <title>Atracciones</title>
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
          <h1>Atracciones</h1>
          <table>
            <tr>
              <th>ATRACCIÓN</th>
              <th>EDAD MÍNIMA</th>
              <th>PESO MÁXIMO</th>
            </tr>
            <xsl:apply-templates select="gestionParque/atracciones/atraccion"/>
          </table>
        </main>
        <footer>
          <address>&#169; Desarrollado por info@birt.eus</address>
        </footer>
      </body>
    </html>
  </xsl:template>
  
  <xsl:template match="atraccion">
	<!-- Se define una variable para almacenar el nombre con espacios convertidos en barras bajas -->
    <xsl:variable name="nombreFormateado" select="translate(nombre, ' ', '_')"/>
    <tr>
      <td>
        <a href="https://es.wikipedia.org/wiki/{$nombreFormateado}" target="_blank">
          <xsl:value-of select="nombre"/>
        </a>
      </td>
      <td><xsl:value-of select="restricciones/edadMinima"/></td>
      <td><xsl:value-of select="restricciones/pesoMaximo"/></td>
    </tr>
  </xsl:template>
</xsl:stylesheet>
