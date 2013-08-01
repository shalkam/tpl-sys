<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:php="http://php.net/xsl">
    <xsl:output method="xml" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"/>

    <xsl:include href="../common/topmenu.xsl" />
    <xsl:include href="../common/manage.xsl" />
    <xsl:include href="../common/alphamenu.xsl" /> 
    <xsl:include href="block.xsl" /> 
    <xsl:include href="tabs.xsl" />  
    <xsl:include href="../../front/entryref/entries.xsl" />
    <xsl:variable name="fieldsXML" select="php:function( 'tplPos::fieldsXML', 'details' )" />
    <xsl:template match="/entry_details">
        <div class="SPDetails container-fluid">
            <div class="row-fluid">
                <div class="row">
                    <div class="span12">
                        <xsl:call-template name="topMenu">
                            <xsl:with-param name="searchbox">true</xsl:with-param>
                        </xsl:call-template>
                        <xsl:apply-templates select="alphaMenu" />
                    </div>
                </div>

                <xsl:call-template name="manage" />
                <div class="row">
                    <div class="span12">
                        <div class="page-header">
                            <h3>
                                <xsl:value-of select="entry/name" />          
                                <small>                     
                                    <xsl:call-template name="block">
                                        <xsl:with-param name="position">subtitle</xsl:with-param>
                                        <xsl:with-param name="mode">
                                            <xsl:value-of select="$fieldsXML/subtitle/mode"/>
                                        </xsl:with-param>
                                    </xsl:call-template>        
                                </small>
                            </h3>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="span4">
                        <xsl:call-template name="block">
                            <xsl:with-param name="position">side-1</xsl:with-param>
                            <xsl:with-param name="mode">
                                <xsl:value-of select="$fieldsXML/side-1/mode"/>
                            </xsl:with-param>
                        </xsl:call-template>                            
                        <xsl:call-template name="block">
                            <xsl:with-param name="position">side-2</xsl:with-param>
                            <xsl:with-param name="mode">
                                <xsl:value-of select="$fieldsXML/side-2/mode"/>
                            </xsl:with-param>
                        </xsl:call-template> 
                        <xsl:call-template name="block">
                            <xsl:with-param name="position">side-3</xsl:with-param>
                            <xsl:with-param name="mode">
                                <xsl:value-of select="$fieldsXML/side-3/mode"/>
                            </xsl:with-param>
                        </xsl:call-template> 
                        <xsl:call-template name="block">
                            <xsl:with-param name="position">side-4</xsl:with-param>
                            <xsl:with-param name="mode">
                                <xsl:value-of select="$fieldsXML/side-4/mode"/>
                            </xsl:with-param>
                        </xsl:call-template> 
                    </div>
                    <div class="span8">
                        <xsl:call-template name="tabs" />
                        <xsl:call-template name="block">
                            <xsl:with-param name="position">main-1</xsl:with-param>
                            <xsl:with-param name="mode">
                                <xsl:value-of select="$fieldsXML/main-1/mode"/>
                            </xsl:with-param>
                        </xsl:call-template> 
                        <xsl:call-template name="block">
                            <xsl:with-param name="position">main-2</xsl:with-param>
                            <xsl:with-param name="mode">
                                <xsl:value-of select="$fieldsXML/main-2/mode"/>
                            </xsl:with-param>
                        </xsl:call-template> 
                        <xsl:call-template name="block">
                            <xsl:with-param name="position">main-3</xsl:with-param>
                            <xsl:with-param name="mode">
                                <xsl:value-of select="$fieldsXML/main-3/mode"/>
                            </xsl:with-param>
                        </xsl:call-template> 
                        <xsl:call-template name="block">
                            <xsl:with-param name="position">main-4</xsl:with-param>
                            <xsl:with-param name="mode">
                                <xsl:value-of select="$fieldsXML/main-4/mode"/>
                            </xsl:with-param>
                        </xsl:call-template> 
                    </div>
                </div>
                <div class="row">
                    <div class="span12">
                        <xsl:if test="count(entry/categories)">
                            <div class="spEntryCats">
                                <xsl:value-of select="php:function( 'SobiPro::Txt' , 'Located in:' )" />
                                <xsl:text> </xsl:text>
                                <xsl:for-each select="entry/categories/category">
                                    <a>
                                        <xsl:attribute name="href">
                                            <xsl:value-of select="@url" />
                                        </xsl:attribute>
                                        <xsl:value-of select="." />
                                    </a>
                                    <xsl:if test="position() != last()">
                                        <xsl:text> | </xsl:text>
                                    </xsl:if>
                                </xsl:for-each>
                            </div>
                        </xsl:if>
                    </div>
                </div>
            </div>
        </div>
    </xsl:template>
</xsl:stylesheet>