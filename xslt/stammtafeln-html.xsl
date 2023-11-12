<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns:tei="http://www.tei-c.org/ns/1.0"
	xmlns:xs="http://www.w3.org/2001/XMLSchema" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	exclude-result-prefixes="tei" 
    version="2.0">
    
    <xsl:output method="html" indent="yes" encoding="UTF-8"/>
    <xsl:param name="documentName" select="//tei:TEI/@xml:id"/>
    
    <xsl:template match="/">
        <xsl:result-document href="{$documentName}.html">
            <xsl:apply-templates/>
        </xsl:result-document>
    </xsl:template>

</xsl:stylesheet>
