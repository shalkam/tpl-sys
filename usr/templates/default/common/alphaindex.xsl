<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:php="http://php.net/xsl">
    <xsl:output method="xml" encoding="UTF-8" />
    <xsl:template match="letters|/menu/alphaMenu/letters">
        <xsl:variable name="letter">
            <xsl:value-of select="php:function( 'SobiPro::Request', 'letter' )" />
        </xsl:variable>
        <div class="pagination pagination-mini" style="margin:0; padding:0;">
            <ul>
                <xsl:for-each select="letter">
                    <xsl:choose>
                        <xsl:when test="@url">
                            <li>
                                <xsl:attribute name="class">
                                    <xsl:choose>
                                        <xsl:when test=". = $letter">spAlphaLetterSelected</xsl:when>
                                        <xsl:otherwise>spAlphaLetter</xsl:otherwise>
                                    </xsl:choose>
                                </xsl:attribute>
                                <a>
                                    <xsl:attribute name="href">
                                        <xsl:value-of select="@url" />
                                    </xsl:attribute>
                                    <xsl:value-of select="." />
                                </a>
                            </li>
                        </xsl:when>
                        <xsl:otherwise>
                            <li class="disabled">
                                <a href="#"><xsl:value-of select="." /></a>
                            </li>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:for-each>
            </ul>
        </div>
    </xsl:template>
</xsl:stylesheet>
