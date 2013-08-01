<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:php="http://php.net/xsl">
    <xsl:output method="xml" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"/>
    <xsl:template name="modal">
        <xsl:param name="position" />
        <xsl:variable name="fields" select="php:function( 'tplPos::fields', $position, 'details' )"/>
        
        <a href="#modal-{$position}" role="button" class="btn" data-toggle="modal" style="margin-left:5px;">
            <xsl:value-of select="php:function( 'tplPos::title', $position, 'details' )" />
        </a>
     
        <div id="modal-{$position}" class="modal hide" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h3 id="myModalLabel">
                    <xsl:value-of select="$fieldsXML/*[name() = $position]/title" />
                </h3>
            </div>
            <div class="modal-body">
                <xsl:for-each select="entry/fields/*">
                    <xsl:variable name="fid" select="name()" />
                    <xsl:if test="$fieldsXML/*[name() = $position]/field[. = $fid]">
                        <xsl:call-template name="fieldtpl" />
                    </xsl:if>
                </xsl:for-each>
            </div>
            <div class="modal-footer">
                <button class="btn btn-danger" data-dismiss="modal" aria-hidden="true">Close</button>
            </div>
        </div>
    </xsl:template>
</xsl:stylesheet>