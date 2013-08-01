<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:php="http://php.net/xsl">
    <xsl:output method="xml" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"/>
    <xsl:template name="well">
        <xsl:param name="position" />
        <div class="well">
            <xsl:for-each select="entry/fields/*">
                <xsl:variable name="fid" select="name()" />
                <xsl:if test="$fieldsXML/*[name() = $position]/field[. = $fid]">">
                    <p>
                        <xsl:attribute name="class">
                            <xsl:value-of select="@css_class" />
                        </xsl:attribute>
                        <xsl:call-template name="fieldtpl" />
                    </p>
                </xsl:if>
            </xsl:for-each>
        </div>
    </xsl:template>
</xsl:stylesheet>