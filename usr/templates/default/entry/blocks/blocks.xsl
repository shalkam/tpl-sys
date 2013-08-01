<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:php="http://php.net/xsl">
    <xsl:output method="xml" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"/>
    <xsl:template name="blocks">
        <xsl:param name="position" />
        <xsl:param name="color" />
        <div class="SPBlock">
            <div class="content btn-{$color}">
                <h2>
                    <xsl:value-of select="$fieldsXML/*[name() = $position]/title"/>
                </h2>
                <xsl:for-each select="entry/fields/*">
                    <xsl:variable name="fid" select="name()" />
                    <xsl:if test="$fieldsXML/*[name() = $position]/field[. = $fid]">
                        <xsl:call-template name="fieldtpl" />
                    </xsl:if>
                </xsl:for-each>
            </div>
            <div class="shade"></div>
        </div>
    </xsl:template>
</xsl:stylesheet>