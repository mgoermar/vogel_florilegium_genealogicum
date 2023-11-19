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
            <html lang="en">
              <head>
                <title>Florilegium Genealogicum</title>
                <meta charset="utf-8"/>                  
                <meta name="viewport" content="width=device-width, initial-scale=1"/>
                <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"/>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
              </head>
                <body>
                    <div id="content" class="container">
                        <xsl:apply-templates/>
                    </div>
                    <div id="annotation" class="container">
                        <h3>Anmerkungen</h3>
                        <xsl:for-each select="//tei:note">
                            <xsl:variable name="number">
                                    <xsl:number level="any" count="tei:note"/>
                                </xsl:variable>
                                <div style="padding-left: 1em; text-indent: -1em;">
                                    <a name="fn{$number}" href="#fna{$number}" style="display:inline-block; margin-left: 1em;">
                                        <xsl:value-of select="$number"/>
                                    </a>
                                    <xsl:text> </xsl:text>
                                    <xsl:apply-templates select="." mode="apparat"/>
                                </div>
                        </xsl:for-each>
                    </div>                
                </body>
            </html>
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
        <em><xsl:apply-templates/></em>
    </xsl:template>

    <xsl:template match="tei:del">
        <del><xsl:apply-templates/></del>
    </xsl:template>

    <xsl:template match="tei:table">
        <table><xsl:apply-templates/></table>
    </xsl:template>

    <xsl:template match="tei:row">
        <tr><xsl:apply-templates/></tr>
    </xsl:template>

    <xsl:template match="tei:cell[not(@rendition)]">
        <td style="vertical-align: top;"><xsl:apply-templates/></td>
    </xsl:template>

    <xsl:template match="tei:note">
        <xsl:variable name="number">
            <xsl:number level="any" count="tei:note"/>
        </xsl:variable>
        <a name="fna{$number}" href="#fn{$number}" title="{normalize-space(.)}" style="font-size:9pt;vertical-align:super;">
            <xsl:value-of select="$number"/>
        </a>
    </xsl:template>

    <xsl:template match="tei:note" mode="apparat">
        <xsl:apply-templates/>
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

    <xsl:template match="tei:abbr">
        <abbr title="{parent::tei:choice/tei:expan/normalize-space()}"><xsl:apply-templates/></abbr>
    </xsl:template>

    <xsl:template match="tei:expan"/>

</xsl:stylesheet>
