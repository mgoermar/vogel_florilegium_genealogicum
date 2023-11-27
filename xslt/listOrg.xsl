<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns:tei="http://www.tei-c.org/ns/1.0"
	xmlns:xs="http://www.w3.org/2001/XMLSchema" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	exclude-result-prefixes="tei xs" 
    version="2.0">
    
    <xsl:output method="html" indent="yes" encoding="UTF-8"/><!-- Hier kann über das Attribut @method auch Text ("text") und XML ("xml") ausgegeben werden. -->
    <xsl:param name="documentName" select="//tei:TEI/@xml:id"/>
    
    <xsl:template match="/">
        <xsl:result-document href="{$documentName}.html"><!-- Der Dokumentname und die Dateiendung kann frei gewählt werden. Hier ist als Standard die xml:id des TEI-Dokuments eingestellt.-->
            <ul>
                <xsl:for-each select="//tei:org">
                    <li>
                        <xsl:value-of select="tei:orgName"/>
                    </li>
                </xsl:for-each>
            </ul>
        </xsl:result-document>
    </xsl:template>
</xsl:stylesheet>