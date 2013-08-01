<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:php="http://php.net/xsl">
    <xsl:output method="xml" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"/>
    <xsl:template name="fieldtpl">
        <xsl:variable name="class">
            <xsl:value-of select="@css_class" />
        </xsl:variable>
        <xsl:if test="count(data/*) or string-length(data)">
            <span class="SPField {$class}">
                <xsl:if test="label/@show = 1">
                    <label>
                        <xsl:value-of select="label" />
                    </label>
                </xsl:if>
            

                <span>
                    <xsl:choose>
                        <xsl:when test="count(data/*)">
                            <xsl:copy-of select="data/*"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:if test="string-length(data)">
                                <xsl:value-of select="data" disable-output-escaping="yes" />
                            </xsl:if>
                        </xsl:otherwise>
                    </xsl:choose>

                    <xsl:if test="count(data/*) or string-length(data)">
                        <xsl:if test="string-length(@suffix)">
                            <xsl:text> </xsl:text>
                            <xsl:value-of select="@suffix"/>
                        </xsl:if>
                    </xsl:if>
                </span>
                <div class="clearfix"></div>
            </span>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>