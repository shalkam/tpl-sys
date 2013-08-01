<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:php="http://php.net/xsl">
    <xsl:output method="xml" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" encoding="UTF-8"/>

    <xsl:template name="vcard">
        <tbody class="toggle">
            <tr>
                <xsl:call-template name="tablecell">
                    <xsl:with-param name="position">column1</xsl:with-param>
                </xsl:call-template>
                <xsl:call-template name="tablecell">
                    <xsl:with-param name="position">column2</xsl:with-param>
                </xsl:call-template>
                <xsl:call-template name="tablecell">
                    <xsl:with-param name="position">column3</xsl:with-param>
                </xsl:call-template>
                <xsl:call-template name="tablecell">
                    <xsl:with-param name="position">column4</xsl:with-param>
                </xsl:call-template>
                <xsl:call-template name="tablecell">
                    <xsl:with-param name="position">column5</xsl:with-param>
                </xsl:call-template>
                <xsl:call-template name="tablecell">
                    <xsl:with-param name="position">column6</xsl:with-param>
                </xsl:call-template>
                <xsl:call-template name="tablecell">
                    <xsl:with-param name="position">column7</xsl:with-param>
                </xsl:call-template>
                <xsl:call-template name="tablecell">
                    <xsl:with-param name="position">column8</xsl:with-param>
                </xsl:call-template>
            </tr>
            <xsl:variable name="fields" select="$fieldsXML/*[name() = 'slide']/field"/>
            <tr class="slide">
                <td colspan="999">
                    <xsl:if test="edit_url">
                        <a>
                            <xsl:attribute name="href">
                                <xsl:value-of select="edit_url" />
                            </xsl:attribute>
                            <xsl:value-of select="php:function( 'SobiPro::Txt', 'Edit Entry' )" />
                        </a>
                    </xsl:if>
                    <xsl:if test=" count($fields) &gt; 0 or count( $fields/field[. = 'field_name']) &gt; 0">

                        <xsl:for-each select="fields/*">
                            <xsl:variable name="fid" select="name()" />
                            <xsl:if test="$fieldsXML/*[name() = 'slide']/field[. = $fid]">
                            <div>
                                <xsl:attribute name="class">
                                    <xsl:value-of select="@css_class" />
                                </xsl:attribute>

                                <xsl:if test="count(data/*) or string-length(data)">
                                    <xsl:if test="label/@show = 1">
                                        <strong>
                                            <xsl:value-of select="label" />: 
                                        </strong>
                                    </xsl:if>
                                </xsl:if>

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
                            </div>
                            </xsl:if>
                        </xsl:for-each>
                    </xsl:if>
                </td>
            </tr>
        </tbody>
    </xsl:template>
</xsl:stylesheet>
