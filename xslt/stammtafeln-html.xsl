<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns:tei="http://www.tei-c.org/ns/1.0"
	xmlns:xs="http://www.w3.org/2001/XMLSchema" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	exclude-result-prefixes="tei xs" 
    version="2.0">
    
    <xsl:output method="html" indent="yes" encoding="UTF-8"/>
    <xsl:param name="documentName" select="//tei:TEI/@xml:id"/>
    
    <xsl:template match="/">
        <xsl:result-document href="{$documentName}.html">
            <xsl:apply-templates/>
        </xsl:result-document>
    </xsl:template>

    <xsl:template match="tei:teiHeader"/>

    <xsl:template match="tei:head">
        <h2><xsl:apply-templates/></h2>
    </xsl:template>

    <xsl:template match="tei:lb[not(ancestor::tei:add)][not(ancestor::tei:w)]">
        <br/>
    </xsl:template>
    
    <xsl:template match="tei:lb[ancestor::tei:w][not(ancestor::tei:add)]">
        <xsl:text>-</xsl:text>
        <br/>
    </xsl:template>

    <xsl:template match="tei:ex">
        <span style="font-style:italic;"><xsl:apply-templates/></span>
    </xsl:template>

    <xsl:template match="tei:table">
        <table><xsl:apply-templates/></table>
    </xsl:template>

    <xsl:template match="tei:row">
        <tr><xsl:apply-templates/></tr>
    </xsl:template>

    <xsl:template match="tei:cell[not(@rendition)]">
        <td><xsl:apply-templates/></td>
    </xsl:template>

    <xsl:template match="tei:note">
        <sup>
        <xsl:text>[</xsl:text>
        <xsl:apply-templates/>
        <xsl:text>]</xsl:text>
        </sup>
    </xsl:template>

    <xsl:template match="tei:table[@rendition='#topBraced']">
        <table style="border-top: 2px solid black; border-radius:5px;"><xsl:apply-templates/></table>
    </xsl:template>

    <xsl:template match="tei:cell[@rendition='#topBraced']">
        <td style="border-top: 2px solid black; border-radius:5px;"><xsl:apply-templates/></td>
    </xsl:template>

    <xsl:template match="tei:hi[@rendition='#et']">
        <span style="padding-left:2em;"><xsl:apply-templates/></span>
    </xsl:template>

</xsl:stylesheet>
