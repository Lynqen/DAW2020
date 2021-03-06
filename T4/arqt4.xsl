<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="html" indent="yes" encoding="UTF-8"/>
  
    <xsl:template match="/">
        <xsl:result-document href="arq/arq.html"> 
            <head>
                <title> Arqueossitios do NW Português </title>
            </head>
            <body>
                <h2> Arqueossitios do NW Português</h2>
                <ul>
                    <xsl:apply-templates select="//ARQELEM" mode="indice">
                        <xsl:sort select="IDENTI" data-type="text" order="ascending"/>
                    </xsl:apply-templates> 
                </ul>
            </body>
        </xsl:result-document>  
        <xsl:apply-templates/>  
    </xsl:template>
    
    <xsl:template match="ARQELEM" mode="indice">
        <li>
            <a name="{count(preceding-sibling::*)+1}"/>
            <a href="arq/{count(preceding-sibling::*)+1}">
                <xsl:value-of select="IDENTI"/>
            </a>
        </li>
    </xsl:template>
    
    <xsl:template match="ARQELEM">
        <xsl:result-document href="arq/arq{count(preceding-sibling::*)+1}.html">
            <xsl:processing-instruction name="xml-stylesheet">type="text/xsl" href="arq2html.xsl"</xsl:processing-instruction>
                <head>
                    <title>
                        <xsl:value-of select="IDENTI"/>
                    </title>
                </head>
                <body>
                    <p><b>Nome:</b>: <xsl:value-of select="IDENTI"/></p>
                    <p><b>Descrição</b>: <xsl:value-of select="DESCRI"/></p>
                    <p><b>Cronologia</b>: <xsl:value-of select="CRONO"/></p>
                    <p><b>Lugar</b>: <xsl:value-of select="LUGAR"/></p>
                    <p><b>Freguesia</b>: <xsl:value-of select="FREGUE"/></p>
                    <p><b>Concelho</b>: <xsl:value-of select="CONCEL"/></p>
                    <p><b>Código</b>: <xsl:value-of select="CODADM"/></p>
                    <p><b>Latitude</b>: <xsl:value-of select="LATITU"/></p>
                    <p><b>Longitude</b>: <xsl:value-of select="LONGIT"/></p>
                    <p><b>Altitude</b>: <xsl:value-of select="ALTITU"/></p>
                    <p><b>Acesso</b>: <xsl:value-of select="ACESSO"/></p>
                    <p><b>Quadro</b>: <xsl:value-of select="QUADRO"/></p>
                    <p><b>Autor</b>: <xsl:value-of select="AUTOR"/></p>
                    <p><b>Biblio</b>: <xsl:value-of select="BIBLIO"/></p>
                    <p><b>Deposito</b>: <xsl:value-of select="DEPOSI"/></p>
                    <p><b>Desarq</b>: <xsl:value-of select="DESARQ"/></p>
                    <p><b>Intere</b>: <xsl:value-of select="INTERE"/></p>
                    <p><b>Interp</b>: <xsl:value-of select="INTERP"/></p>
                    <p><b>Traarq</b>: <xsl:value-of select="TRAARQ"/></p>
                    <p><b>Data</b>: <xsl:value-of select="DATA"/></p>
                    <address>
                        [
                        <a href = "javascript:history.back()">Back to Main Page</a>
                        ]
                    </address>
                </body>
        </xsl:result-document>
    </xsl:template>
</xsl:stylesheet>