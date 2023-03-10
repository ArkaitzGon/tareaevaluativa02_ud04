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
	<xsl:template match="/reservaeventos2">
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
                
                <main>
                    <!-- 
                        Cambiar el valor entre corchete para elegir restaurante 
                        1 ==> El clarete
                        2 ==> Eneko   
                    -->
                    <xsl:variable name="nombre" select="restaurante[1]/nombrerestaurante" />

                    <!-- Nombre y enlace a la pagina web, depende del restaurante seleccionado -->
                    <a href="{$nombre/../informacion}" target="blank"><h1><xsl:value-of select="$nombre"/></h1></a>
                    <article class="restaurante">
                        <!-- Imprime lista del menu degustacion -->
                        <h3><xsl:value-of select="$nombre/../menu[1]/@tipo"/></h3>
                        <xsl:for-each select="restaurante[nombrerestaurante=$nombre]/menu[1]/plato">
                            <p><xsl:value-of select="."/></p>
                        </xsl:for-each>
                        <p></p>
                    </article>
                    <article class="restaurante">
                        <!-- 
                            Imprime lista del menu del dia o menu del fin de semana,
                            dependiendo del restaurante
                         -->
                        <h3><xsl:value-of select="$nombre/../menu[2]/@tipo"/></h3>
                        <xsl:for-each select="restaurante[nombrerestaurante=$nombre]/menu[2]/plato">
                            <p><xsl:value-of select="."/></p>
                        </xsl:for-each>
                        <p></p>
                    </article>
                </main>

                <footer>
                    <address>&#169; 2020 desarrollado por info@birt.eus</address>
                </footer>
            </body>
        </html> 
    </xsl:template>
</xsl:stylesheet>