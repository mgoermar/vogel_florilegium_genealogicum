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
                <script>
                          $(document).ready(function(){
  $('[data-toggle="popover"]').popover();   
});
                </script>
              </head>
                <body>
                    <nav class="navbar navbar-default">
                        <div class="container-fluid">
                            <div class="navbar-header">
                                <span class="navbar-brand">Vogel: Florilegium Genealogicum</span>
                            </div>
                            <ul class="nav navbar-nav">
                                <li><a href="index.html">Start</a></li>
                                <li><a href="introduction_project.html">Einführung</a></li>
                                <li class="dropdown">
                                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">Stammtafeln<span class="caret"></span></a>
                                    <ul class="dropdown-menu">
                                        <li><a href="moench.html">Mönch</a></li>
                                    </ul>
                                </li>
                                <li class="dropdown">
                                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">Register<span class="caret"></span></a>
                                    <ul class="dropdown-menu">
                                        <li><a href="#">Personen</a></li>
                                        <li><a href="#">Orte</a></li>
                                        <li><a href="#">Körperschaften</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                    </nav>
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

    <xsl:template match="tei:p">
        <p><xsl:apply-templates/></p>
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

    <xsl:template match="tei:ref">
        <a href="{@target}"><xsl:apply-templates/></a>
    </xsl:template>

    <xsl:template match="tei:table[@rendition='#topBraced']">
        <table style="border-top: 2px solid black; border-radius:5px;"><xsl:apply-templates/></table>
    </xsl:template>

    <xsl:template match="tei:cell[@rendition='#topBraced']">
        <td style="border-top: 2px solid black; border-radius:5px;"><xsl:apply-templates/></td>
    </xsl:template>

    <xsl:template match="tei:hi[@rendition='#et']">
        <span style="display:block; margin-left:2em; text-indent:0"><xsl:apply-templates/></span>
    </xsl:template>

    <xsl:template match="tei:hi[@rendition='#i']">
        <span style="font-style:italic"><xsl:apply-templates/></span>
    </xsl:template>

    <xsl:template match="tei:abbr">
        <abbr title="{parent::tei:choice/tei:expan/normalize-space()}"><xsl:apply-templates/></abbr>
    </xsl:template>

    <xsl:template match="tei:expan"/>

    <xsl:template match="tei:rs[@type='person']">
        <xsl:variable name="person_register" select="document('../register/listPerson.xml')"/>
        <a href="javascript:void(0);" data-toggle="popover" data-trigger="click" title="{$person_register//tei:person[@xml:id=substring-after(current()/@ref,'#')]/tei:persName[@type='display']}" data-html="true" data-placement="right">
            <xsl:attribute name="data-content">
                <xsl:if test="$person_register//tei:person[@xml:id=substring-after(current()/@ref,'#')]/tei:persName/@ref">
                    <xsl:choose>
                        <xsl:when test="contains($person_register//tei:person[@xml:id=substring-after(current()/@ref,'#')]/tei:persName/@ref,'gnd')">
                            <xsl:text>GND: &lt;a href="</xsl:text>
                            <xsl:value-of select="$person_register//tei:person[@xml:id=substring-after(current()/@ref,'#')]/tei:persName/@ref"/>
                            <xsl:text>"&gt;</xsl:text>
                            <xsl:value-of select="$person_register//tei:person[@xml:id=substring-after(current()/@ref,'#')]/tei:persName/@ref/substring-after(.,'gnd/')"/>
                            <xsl:text>&lt;/a&gt;&lt;br/&gt;</xsl:text>
                        </xsl:when>
                        <xsl:when test="contains($person_register//tei:person[@xml:id=substring-after(current()/@ref,'#')]/tei:persName/@ref,'viaf')">
                            <xsl:text>VIAF: &lt;a href="</xsl:text>
                            <xsl:value-of select="$person_register//tei:person[@xml:id=substring-after(current()/@ref,'#')]/tei:persName/@ref"/>
                            <xsl:text>"&gt;</xsl:text>
                            <xsl:value-of select="$person_register//tei:person[@xml:id=substring-after(current()/@ref,'#')]/tei:persName/@ref/substring-after(.,'viaf/')"/>
                            <xsl:text>&lt;/a&gt;&lt;br/&gt;</xsl:text>
                        </xsl:when>
                    </xsl:choose>                    
                </xsl:if>
                <xsl:if test="$person_register//tei:person[@xml:id=substring-after(current()/@ref,'#')]/tei:birth">
                    <xsl:text>geb. </xsl:text>
                    <xsl:value-of select="$person_register//tei:person[@xml:id=substring-after(current()/@ref,'#')]/tei:birth"/>
                    <xsl:text>&lt;br/&gt;</xsl:text>
                </xsl:if>
                <xsl:if test="$person_register//tei:person[@xml:id=substring-after(current()/@ref,'#')]/tei:death">
                    <xsl:text>gest. </xsl:text>
                    <xsl:value-of select="$person_register//tei:person[@xml:id=substring-after(current()/@ref,'#')]/tei:death"/>
                    <xsl:text>&lt;br/&gt;</xsl:text>
                </xsl:if>
                <!-- <xsl:if test="$person_register//tei:person[@xml:id=substring-after(current()/@ref,'#')]/tei:listBibl"> 
                    <xsl:text>&lt;br/&gt;&lt;br/&gt;</xsl:text>
                    <xsl:text>Weitere Informationen in </xsl:text>
                    <xsl:for-each select="$person_register//tei:person[@xml:id=substring-after(current()/@ref,'#')]/tei:listBibl/tei:bibl/tei:ptr">
                        <xsl:choose>
                            <xsl:when test="@type='adb'">
                                <xsl:text>&lt;a href="</xsl:text>
                                <xsl:value-of select="@target"/>
                                <xsl:text>"&gt;ADB&lt;/a&gt;</xsl:text>
                            </xsl:when>
                            <xsl:when test="@type='ndb'">
                                <xsl:text>&lt;a href="</xsl:text>
                                <xsl:value-of select="@target"/>
                                <xsl:text>"&gt;NDB&lt;/a&gt;</xsl:text>
                            </xsl:when>
                        </xsl:choose>
                        <xsl:if test="position()!=last()">
                            <xsl:text>, </xsl:text>
                        </xsl:if>                        
                    </xsl:for-each>
                    <xsl:text>.</xsl:text>
                </xsl:if> -->
            </xsl:attribute>
            <xsl:apply-templates/>
        </a>
    </xsl:template>

    <xsl:template match="tei:rs[@type='place']">
        <xsl:variable name="place_register" select="document('../register/listPlace.xml')"/>
        <a href="javascript:void(0);" data-toggle="popover" data-trigger="click" title="{$place_register//tei:place[@xml:id=substring-after(current()/@ref,'#')]/tei:placeName}" data-html="true">
            <xsl:attribute name="data-content">
                <xsl:if test="$place_register//tei:place[@xml:id=substring-after(current()/@ref,'#')]/tei:note">
                    <xsl:apply-templates select="$place_register//tei:place[@xml:id=substring-after(current()/@ref,'#')]/tei:note"/>
                    <xsl:text>&lt;br/&gt;</xsl:text>
                </xsl:if>
                <xsl:text>Weitere Informationen: &lt;a href="</xsl:text>
                <xsl:value-of select="$place_register//tei:place[@xml:id=substring-after(current()/@ref,'#')]/tei:placeName/@ref"/>
                <xsl:text>"&gt;</xsl:text>
                <xsl:value-of select="$place_register//tei:place[@xml:id=substring-after(current()/@ref,'#')]/tei:placeName/@ref"/>
                <xsl:text>&lt;/a&gt;.</xsl:text>
            </xsl:attribute>
            <xsl:apply-templates/>
        </a>
    </xsl:template>
    
    <xsl:template match="tei:rs[@type='org']">
        <xsl:variable name="org_register" select="document('../register/listOrg.xml')"/>
        <a href="javascript:void(0);" data-toggle="popover" data-trigger="click" title="{$org_register//tei:org[@xml:id=substring-after(current()/@ref,'#')]/tei:orgName}" data-html="true">
            <xsl:attribute name="data-content">
                <xsl:if test="$org_register//tei:org[@xml:id=substring-after(current()/@ref,'#')]/tei:note">
                    <xsl:apply-templates select="$org_register//tei:org[@xml:id=substring-after(current()/@ref,'#')]/tei:note"/>
                    <xsl:text>&lt;br/&gt;</xsl:text>
                </xsl:if>
                <xsl:text>Weitere Informationen: &lt;a href="</xsl:text>
                <xsl:value-of select="$org_register//tei:org[@xml:id=substring-after(current()/@ref,'#')]/tei:orgName/@ref"/>
                <xsl:text>"&gt;</xsl:text>
                <xsl:value-of select="$org_register//tei:org[@xml:id=substring-after(current()/@ref,'#')]/tei:orgName/@ref"/>
                <xsl:text>&lt;/a&gt;.</xsl:text>
            </xsl:attribute>
            <xsl:apply-templates/>
        </a>
        <!--<a href="$base-url/orte/{@ref/substring-after(.,'#')}"> 
            <xsl:apply-templates/>
        </a>-->
    </xsl:template>

</xsl:stylesheet>
