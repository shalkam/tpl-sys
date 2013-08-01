<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:php="http://php.net/xsl">
    <xsl:output method="xml" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" encoding="UTF-8"/>
    <xsl:include href="vcard.xsl" />
    <xsl:variable name="fieldsXML" select="php:function( 'tplPos::fieldsXML', 'vcard' )" />
    <xsl:template name="entriesLoop">
        <xsl:variable name="entriesCount">
            <xsl:value-of select="count(entries/entry)" />
        </xsl:variable>
        <xsl:if test="$entriesCount &gt; 0">
            <table class="table table-hover">
                <tr>
                    <xsl:call-template name="table-header">
                        <xsl:with-param name="position">column1</xsl:with-param>
                    </xsl:call-template>
                    <xsl:call-template name="table-header">
                        <xsl:with-param name="position">column2</xsl:with-param>
                    </xsl:call-template>
                    <xsl:call-template name="table-header">
                        <xsl:with-param name="position">column3</xsl:with-param>
                    </xsl:call-template>
                    <xsl:call-template name="table-header">
                        <xsl:with-param name="position">column4</xsl:with-param>
                    </xsl:call-template>
                    <xsl:call-template name="table-header">
                        <xsl:with-param name="position">column5</xsl:with-param>
                    </xsl:call-template>
                    <xsl:call-template name="table-header">
                        <xsl:with-param name="position">column6</xsl:with-param>
                    </xsl:call-template>
                    <xsl:call-template name="table-header">
                        <xsl:with-param name="position">column7</xsl:with-param>
                    </xsl:call-template>
                    <xsl:call-template name="table-header">
                        <xsl:with-param name="position">column8</xsl:with-param>
                    </xsl:call-template>
                </tr>
                <xsl:for-each select="entries/entry">
                    <xsl:call-template name="vcard" />
                </xsl:for-each>
            </table>
        </xsl:if>
    </xsl:template>
    <xsl:template name="table-header">
        <xsl:param name="position" />
        <xsl:variable name="fields" select="$fieldsXML/*[name() = $position]/field"/>
        <xsl:if test=" count($fields) &gt; 0 or count( $fields/field[. = 'field_name']) &gt; 0">
            <th>
                <xsl:attribute name="class">
                    <xsl:value-of select="$fieldsXML/*[name() = $position]/mode" />
                </xsl:attribute>
                <xsl:value-of select="$fieldsXML/*[name() = $position]/title" disable-output-escaping="yes" />
            </th>
        </xsl:if>
    </xsl:template>
    <xsl:template name="tablecell">
        <xsl:param name="position" />
        <xsl:if test=" count( $fieldsXML/*[name() = $position]/field) &gt; 0 or count( $fieldsXML/*[name() = $position]/field[. = 'field_name']) &gt; 0">
            <td>
                <xsl:if test="$fieldsXML/*[name() = $position]/field[. = 'field_name']">
                    <span class="spEntriesListTitle">
                        <a>
                            <xsl:attribute name="href">
                                <xsl:value-of select="url" />
                            </xsl:attribute>
                            <xsl:value-of select="name" />
                        </a>
                    </span>
                </xsl:if>
                <xsl:for-each select="fields/*">
                    <xsl:variable name="fid" select="name()"/>
                    <xsl:if test=" $fieldsXML/*[name() = $position]/field[. = $fid]">
                        <xsl:call-template name="field-tpl" />
                    </xsl:if>
                </xsl:for-each>
            </td>
        </xsl:if>
    </xsl:template>
    <xsl:template name="field-tpl">
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
    </xsl:template>
</xsl:stylesheet>
