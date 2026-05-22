<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <head>
                <link rel="stylesheet" href="./estilos.css" />
            </head>
            <body>
                <div class="historial">
                    <h2>Historial de <xsl:value-of select="perfil/usuario"/></h2>
                    <xsl:for-each select="perfil/juego/partidas/partida">
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
                <table>
                    <tr>
                        <th>Logro</th>
                        <th>Descripción</th>
                        <th>Puntos</th>
                        <th>Conseguido</th>
                    </tr>
                    <xsl:for-each select="perfil/juego/logros/logro">
                        <xsl:choose>
                            <xsl:when test="@secreto = 'no'">
                                <tr>
                                    <td><xsl:value-of select="nombre"/></td>
                                    <td><xsl:value-of select="descripcion"/></td>
                                    <td><xsl:value-of select="@puntos"/></td>
                                    <td>
                                        <xsl:choose>
                                            <xsl:when test="@completado = 'si'">Si</xsl:when>
                                            <xsl:otherwise>No</xsl:otherwise>
                                        </xsl:choose>
                                    </td>
                                </tr>
                            </xsl:when>
                            <xsl:otherwise>
                                <tr>
                                    <td>?</td>
                                    <td>Logro Oculto</td>
                                    <td>?</td>
                                    <td>
                                        <xsl:choose>
                                            <xsl:when test="@completado = 'si'">Si</xsl:when>
                                            <xsl:otherwise>No</xsl:otherwise>
                                        </xsl:choose>
                                    </td>
                                </tr>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>