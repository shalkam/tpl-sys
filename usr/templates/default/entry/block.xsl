<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:php="http://php.net/xsl">
    <xsl:output method="xml" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"/>
    <xsl:include href="fieldtpl.xsl" />
    <xsl:include href="blocks/basic.xsl" />
    <xsl:include href="blocks/quote.xsl" />
    <xsl:include href="blocks/carousel.xsl" />
    <xsl:include href="blocks/hero.xsl" />
    <xsl:include href="blocks/modal.xsl" />
    <xsl:include href="blocks/well.xsl" />
    <xsl:include href="blocks/blocks.xsl" />
    <xsl:template name="block">
        <xsl:param name="position" />
        <xsl:param name="mode" />
        <xsl:if test="count($fieldsXML/*[name() = $position]/field)">
            <xsl:choose>
                <xsl:when test="string-length($mode) and $mode = 'quote'">
                    <xsl:call-template name="quote">
                        <xsl:with-param name="position">
                            <xsl:value-of select="$position" />
                        </xsl:with-param>
                    </xsl:call-template> 
                </xsl:when>
                <xsl:when test="string-length($mode) and starts-with($mode, 'block-') ">
                    <xsl:call-template name="blocks">
                        <xsl:with-param name="position">
                            <xsl:value-of select="$position" />
                        </xsl:with-param>
                        <xsl:with-param name="color">
                            <xsl:value-of select="substring-after($mode,'block-')" />
                        </xsl:with-param>
                    </xsl:call-template> 
                </xsl:when>
                <xsl:when test="string-length($mode) and $mode = 'carousel'">
                    <xsl:call-template name="carousel">
                        <xsl:with-param name="position">
                            <xsl:value-of select="$position" />
                        </xsl:with-param>
                    </xsl:call-template> 
                </xsl:when>
                <xsl:when test="string-length($mode) and $mode = 'hero'">
                    <xsl:call-template name="hero">
                        <xsl:with-param name="position">
                            <xsl:value-of select="$position" />
                        </xsl:with-param>
                    </xsl:call-template> 
                </xsl:when>
                <xsl:when test="string-length($mode) and $mode = 'modal'">
                    <xsl:call-template name="modal">
                        <xsl:with-param name="position">
                            <xsl:value-of select="$position" />
                        </xsl:with-param>
                    </xsl:call-template> 
                </xsl:when>
                <xsl:when test="string-length($mode) and $mode = 'well'">
                    <xsl:call-template name="well">
                        <xsl:with-param name="position">
                            <xsl:value-of select="$position" />
                        </xsl:with-param>
                    </xsl:call-template> 
                </xsl:when>
                <xsl:otherwise>
                    <xsl:call-template name="blockbasic">
                        <xsl:with-param name="position">
                            <xsl:value-of select="$position" />
                        </xsl:with-param>
                    </xsl:call-template> 
                </xsl:otherwise>
            </xsl:choose>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>