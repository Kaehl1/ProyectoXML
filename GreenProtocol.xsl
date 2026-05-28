<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <head>
                <link rel="stylesheet" href="./estilos.css" />
            </head>
            <body>
                <div class="historial"><!--Historial de partidas que se muestra en la columna derecha de la pantalla-->
                    <h2 class="titulo-historial">Historial de <xsl:value-of select="perfil/usuario"/></h2>
                    <div class="resumen"><!--Parte de arriba donde se suman los puntos de las partidas y se cuentan las partidas jugadas-->
                        <p>Total partidas de <xsl:value-of select="perfil/usuario"/>: <xsl:value-of select="count(perfil/juego/partidas/partida)"/></p>
                        <p>Total puntos: <xsl:value-of select="sum(perfil/juego/partidas/partida/puntos)"/></p>
                    </div>
                    <xsl:for-each select="perfil/juego/partidas/partida"><!--Muestra todas las partidas guardadas en el XML-->
                        <div class="partida">
                            <h3>Partida <xsl:value-of select="@id"/></h3>
                            <p>
                                <li>Clase jugada: <xsl:value-of select="clase"/></li>
                                <li>
                                    Jefe <xsl:value-of select="jefe/nombre"/> <br/>
                                    Clase: <xsl:value-of select="jefe/clase"/>
                                </li>
                                <li>Puntos: <xsl:value-of select="puntos"/></li>
                            </p>
                        </div>
                    </xsl:for-each>
                </div>
                <div class="logros"><!--Sección de logros que se muestra en la columna izquierda de la pantalla-->
                    <h2 class="titulo-logros">Logros de <xsl:value-of select="perfil/usuario"/></h2>
                    <div class="resumen"><!--Parte de encima de la tabla donde se cuentan los puntos de logros totales y se muestra cuantos estan conseguidos del total-->
                        <p>Puntos de <xsl:value-of select="perfil/usuario"/>: <xsl:value-of select="sum(perfil/juego/logros/logro[@completado='si']/@puntos)"/></p>
                        <p>Conseguidos: <xsl:value-of select="count(perfil/juego/logros/logro[@completado='si'])"/>/<xsl:value-of select="count(perfil/juego/logros/logro)"/></p>
                    </div>
                    <table><!--Construccion de la tabla de logros-->
                        <tr>
                            <th>Logro</th>
                            <th>Descripción</th>
                            <th>Puntos</th>
                            <th>Conseguido</th>
                        </tr>
                        <xsl:for-each select="perfil/juego/logros/logro"><!--Muestra todos los logros guardados en el XML-->
                            <xsl:choose>
                                <xsl:when test="@secreto = 'no'"><!--Si el atributo secreto es "no" se muestra el nombre y la descripcion-->
                                    <tr>
                                        <td class="nombre-logro"><xsl:value-of select="nombre"/></td>
                                        <td><xsl:value-of select="descripcion"/></td>
                                        <td><xsl:value-of select="@puntos"/></td>
                                        <td>
                                            <xsl:choose><!--Se comprueba si esta completado para mostrar el texto "Si" o "No"-->
                                                <xsl:when test="@completado = 'si'">Si</xsl:when>
                                                <xsl:otherwise>No</xsl:otherwise>
                                            </xsl:choose>
                                        </td>
                                    </tr>
                                </xsl:when>
                                <xsl:otherwise><!--Si el atributo secreto es "si" se muestra diferente-->
                                    <xsl:choose>
                                        <xsl:when test="@completado = 'si'"><!--Si el atributo completado es "si" entonces el logro muestra su nombre y descripcion-->
                                            <tr>
                                                <td class="nombre-logro"><xsl:value-of select="nombre"/></td>
                                                <td><xsl:value-of select="descripcion"/></td>
                                                <td><xsl:value-of select="@puntos"/></td>
                                                <td>Si</td>
                                            </tr>
                                        </xsl:when>
                                        <xsl:otherwise><!--Si el atributo completado es "no" el logro muestra simbolos "?" y el texto "Logro Oculto" ademas de el texto "No" al no haberlo completado-->
                                            <tr>
                                                <td>?</td>
                                                <td>Logro Oculto</td>
                                                <td>?</td>
                                                <td>No</td>
                                            </tr>
                                    </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:for-each>
                    </table>
                </div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>