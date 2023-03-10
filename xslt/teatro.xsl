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

	<!-- Plantilla principal: intercalamos código HTML con datos XML -->
	<xsl:template match="/reservaeventos" >			
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
				
				<main class="principal">
					<section class="teatro">
						<h1>PROXIMAS OBRAS DE TEATRO</h1>
						<ul>
							<xsl:for-each select="teatro">
							<xsl:sort order="descending" select="fechahora/@dia"/>
								<xsl:choose>
									<!-- Si la fecha de la funcion empieza por "2023-01" ejecuta el codigo(imprime nombre) -->
									<xsl:when test="(starts-with(fechahora/@dia,'2023-01'))">
										<xsl:choose>
											<!-- Si la entrada es menor a 20€ subraya el nombre -->
											<xsl:when test="precio&lt;20">
												<li class="subrayado"><xsl:value-of select="fechahora/@dia" />: <xsl:value-of select="obra" /></li>
											</xsl:when>
											<xsl:otherwise>
												<li><xsl:value-of select="fechahora/@dia" />: <xsl:value-of select="obra" /></li>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:when>
								</xsl:choose>											
							</xsl:for-each>
						</ul>
					</section>
				</main>

				<footer>
					<address>&#169; 2020 desarrollado por info@birt.eus</address>
				</footer>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
