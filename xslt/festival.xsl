<?xml version="1.0" encoding="utf-8"?>
<!--
    Módulo: Lenguaje de marcas y sistemas de gestion de información
    Tarea: Tarea Evaluativa 02
    UD: 04
    Autor: Arkaitz Gonzalez Barquin
    Fecha: 09/03/2023
    Autoevaluacion: https://docs.google.com/document/d/1V39JkpVpTBnKIYP-GD2QOSTPSTYujrzgyQHUtFm1NcI/edit?usp=sharing
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output encoding="utf-8" />
    <xsl:template match="/reservaeventos3">
        <html lang="es">

            <head>
                <link href="../css/estilo.css" rel="stylesheet" type="text/css" />
                <meta charset="utf-8"/>
                <meta name="description" content="Página principal" />
                <title>titulo de la web</title>
            </head>

            <body>
                <header>
                    <img src= "../img/logotipo.png" alt= "Reservas" />
                    <a href="../xml/reservaeventos.xml">Teatro</a>
					<a href="../xml/reservaeventos2.xml">Restaurante</a>
					<a href="../xml/reservaeventos3.xml">Festival</a>
                </header>
                
                <section class="festival">
                    <h1>Festivales de rock</h1>
                    <table>
                        <tr>
                            <th>FESTIVAL</th>
                            <th>CONCIERTO</th>
                            <th>FECHA</th>
                            <th>HORA</th>
                            <th>LUGAR</th>
                        </tr>
                        <!-- Selecciono los conciertos que quiero formatear -->
                        <xsl:apply-templates select="festival/conciertos/concierto/grupo[@tipomusica='rock']"/>
                    </table>			
                </section>
                <footer>
                    <address>&#169; 2020 desarrollado por info@birt.eus</address>
                </footer>
            </body>
        </html>   
    </xsl:template>

    <!-- Plantilla para concierto de rock -->
    <xsl:template match="grupo">
        <tr>
            <td><xsl:value-of select="../../../nombrefesti"/></td>
            <td><xsl:value-of select="."/></td>
            <td><xsl:value-of select="../fecha"/></td>
            <td><xsl:value-of select="../hora"/></td>
            <td><xsl:value-of select="../../../lugar"/></td>
        </tr>
    </xsl:template>
</xsl:stylesheet>