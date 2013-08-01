<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:php="http://php.net/xsl">
    <xsl:output method="xml" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"/>
    <xsl:template name="carousel">
        <xsl:param name="position" />
        <div id="myCarousel" class="carousel">
            <ol class="carousel-indicators">
                <xsl:for-each select="entry/fields/*">
                    <xsl:variable name="fid" select="name()" />
                    <xsl:if test="$fieldsXML/*[name() = $position]/field[. = $fid]">
                        <li>
                            <xsl:attribute name="data-target">
                                #myCarousel
                            </xsl:attribute>
                            <xsl:attribute name="data-slide-to">
                                <xsl:value-of select="count($fieldsXML/*[name() = $position]/*[. = $fid]/preceding-sibling::field)"/>
                            </xsl:attribute>
                            <a href="#">
                            </a>
                        </li>
                    </xsl:if>
                </xsl:for-each>
            </ol>
            <div class="carousel-inner">
                <xsl:for-each select="entry/fields/*">
                    <xsl:variable name="fid" select="name()" />
                    <xsl:if test="$fieldsXML/*[name() = $position]/field[. = $fid]">
                        <div>
                            <xsl:attribute name="class">
                                item 
                                <xsl:if test="count($fieldsXML/*[name() = $position]/*[. = $fid]/preceding-sibling::field) = 0">active</xsl:if>
                            </xsl:attribute>
                            <xsl:copy-of select="data/*" disable-output-escaping="yes" />
                        </div>
                    </xsl:if>
                </xsl:for-each>
            </div>
            <a class="carousel-control left" href="#myCarousel" data-slide="prev">
                <xsl:text disable-output-escaping="yes"><![CDATA[&lsaquo;]]>
                </xsl:text>
            </a>
            <a class="carousel-control right" href="#myCarousel" data-slide="next">
                <xsl:text disable-output-escaping="yes"><![CDATA[&rsaquo;]]>
                </xsl:text>
            </a>
        </div>
    </xsl:template>
</xsl:stylesheet>