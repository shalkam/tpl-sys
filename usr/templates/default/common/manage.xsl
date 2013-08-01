<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:php="http://php.net/xsl">
    <xsl:output method="xml" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" encoding="UTF-8"/>
    <xsl:template name="manage">
        <div class="row-fluid">
            <span class="span12">
                <div class="btn-group  pull-right">
                    <xsl:if test="entry/publish_url">
                            <xsl:choose>
                                <xsl:when test="entry/state = 'published'">
                                    <a class="btn btn-danger">
                                        <xsl:attribute name="href">
                                            <xsl:value-of select="entry/publish_url" />
                                        </xsl:attribute>
                                        <xsl:value-of select="php:function( 'SobiPro::Txt', 'Disable Entry' )" />
                                    </a>
                                </xsl:when>
                                <xsl:otherwise>
                                    <a class="btn btn-success">
                                        <xsl:attribute name="href">
                                            <xsl:value-of select="entry/publish_url" />
                                        </xsl:attribute>
                                        <xsl:value-of select="php:function( 'SobiPro::Txt', 'Enable Entry' )" />
                                    </a>
                                </xsl:otherwise>
                            </xsl:choose>
                    </xsl:if>
                    <xsl:if test="entry/approve_url and entry/approved = 0">
                        <a class="btn btn-success">
                            <xsl:attribute name="href">
                                <xsl:value-of select="entry/approve_url" />
                            </xsl:attribute>
                            <xsl:value-of select="php:function( 'SobiPro::Txt', 'Approve Entry' )" />
                        </a>
                    </xsl:if>
                    <xsl:if test="entry/edit_url">
                
                        <a class="btn btn-primary">
                            <xsl:attribute name="href">
                                <xsl:value-of select="entry/edit_url" />
                            </xsl:attribute>
                            <xsl:value-of select="php:function( 'SobiPro::Txt', 'Edit Entry' )" />
                        </a>
                    </xsl:if>
                </div>
            </span>
        </div>
    </xsl:template>
</xsl:stylesheet>
