<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:php="http://php.net/xsl">
    <xsl:output method="xml" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"/>
    <xsl:template name="tabs">
        <xsl:if test="count(entry/fields/*[contains(php:function( 'tplPos::fields', 'tab-1', 'tab-2', 'tab-3', 'tab-4', 'tab-5', 'tab-6', 'details' ), concat(@id, '|', name()) )])">
            <div class="tabbable">
                <ul class="nav nav-tabs">
                    <xsl:if test="count(entry/fields/*[contains(php:function( 'tplPos::fields', 'tab-1', 'details' ), concat(@id, '|', name()) )])">
                        <li class="active pane1">
                            <a href="#pane1" data-toggle="tab" >
                                <xsl:value-of select="php:function( 'tplPos::title', 'tab-1', 'details' )"/>
                            </a>
                        </li>
                    </xsl:if>
                    <xsl:if test="count(entry/fields/*[contains(php:function( 'tplPos::fields', 'tab-2', 'details' ), concat(@id, '|', name()) )])">
                        <li class="pane2">
                            <a href="#pane2" data-toggle="tab" >
                                <xsl:value-of select="php:function( 'tplPos::title', 'tab-2', 'details' )"/>
                            </a>
                        </li>
                    </xsl:if>
                    <xsl:if test="count(entry/fields/*[contains(php:function( 'tplPos::fields', 'tab-3', 'details' ), concat(@id, '|', name()) )])">
                        <li class="pane3">
                            <a href="#pane3" data-toggle="tab">
                                <xsl:value-of select="php:function( 'tplPos::title', 'tab-3', 'details' )"/>
                            </a>
                        </li>
                    </xsl:if>
                    <xsl:if test="count(entry/fields/*[contains(php:function( 'tplPos::fields', 'tab-4', 'details' ), concat(@id, '|', name()) )])">
                        <li class="pane4">
                            <a href="#pane4" data-toggle="tab">
                                <xsl:value-of select="php:function( 'tplPos::title', 'tab-4', 'details' )"/>
                            </a>
                        </li>
                    </xsl:if>
                    <xsl:if test="count(entry/fields/*[contains(php:function( 'tplPos::fields', 'tab-5', 'details' ), concat(@id, '|', name()) )])">
                        <li class="pane5">
                            <a href="#pane5" data-toggle="tab">
                                <xsl:value-of select="php:function( 'tplPos::title', 'tab-5', 'details' )"/>
                            </a>
                        </li>
                    </xsl:if>
                    <xsl:if test="count(entry/fields/*[contains( php:function( 'tplPos::fields', 'tab-6', 'details' ), concat(@id, '|', name()) )])">
                        <li class="pane6">
                            <a href="#pane6" data-toggle="tab">
                                <xsl:value-of select="php:function( 'tplPos::title', 'tab-6', 'details' )"/>
                            </a>
                        </li>
                    </xsl:if>
                </ul>
                <div class="tab-content">
                    <xsl:if test="count(entry/fields/*[contains( php:function( 'tplPos::fields', 'tab-1', 'details' ), concat(@id, '|', name()) )])">
                        <div id="pane1" class="tab-pane active">
                            <xsl:call-template name="block">
                                <xsl:with-param name="position">tab-1</xsl:with-param>
                                <xsl:with-param name="mode">
                                    <xsl:value-of select="php:function( 'tplPos::mode', 'tab-1', 'details' )"/>
                                </xsl:with-param>
                            </xsl:call-template> 
                        </div>
                    </xsl:if>
                    <xsl:if test="count(entry/fields/*[contains( php:function( 'tplPos::fields', 'tab-2', 'details' ), concat(@id, '|', name()) )])">
                        <div id="pane2" class="tab-pane">
                            <xsl:call-template name="block">
                                <xsl:with-param name="position">tab-2</xsl:with-param>
                                <xsl:with-param name="mode">
                                    <xsl:value-of select="php:function( 'tplPos::mode', 'tab-2', 'details' )"/>
                                </xsl:with-param>
                            </xsl:call-template> 
                        </div>
                    </xsl:if>
                    <xsl:if test="count(entry/fields/*[contains( php:function( 'tplPos::fields', 'tab-3', 'details' ), concat(@id, '|', name()) )])">
                        <div id="pane3" class="tab-pane">
                            <xsl:call-template name="block">
                                <xsl:with-param name="position">tab-3</xsl:with-param>
                                <xsl:with-param name="mode">
                                    <xsl:value-of select="php:function( 'tplPos::mode', 'tab-3', 'details' )"/>
                                </xsl:with-param>
                            </xsl:call-template> 
                        </div>
                    </xsl:if>
                    <xsl:if test="count(entry/fields/*[contains( php:function( 'tplPos::fields', 'tab-4', 'details' ), concat(@id, '|', name()) )])">
                        <div id="pane4" class="tab-pane">
                            <xsl:call-template name="block">
                                <xsl:with-param name="position">tab-4</xsl:with-param>
                                <xsl:with-param name="mode">
                                    <xsl:value-of select="php:function( 'tplPos::mode', 'tab-4', 'details' )"/>
                                </xsl:with-param>
                            </xsl:call-template> 
                        </div>
                    </xsl:if>
                    <xsl:if test="count(entry/fields/*[contains( php:function( 'tplPos::fields', 'tab-5', 'details' ), concat(@id, '|', name()) )])">
                        <div id="pane5" class="tab-pane">
                            <xsl:call-template name="block">
                                <xsl:with-param name="position">tab-5</xsl:with-param>
                                <xsl:with-param name="mode">
                                    <xsl:value-of select="php:function( 'tplPos::mode', 'tab-5', 'details' )"/>
                                </xsl:with-param>
                            </xsl:call-template> 
                        </div>
                    </xsl:if>
                    <xsl:if test="count(entry/fields/*[contains( php:function( 'tplPos::fields', 'tab-6', 'details' ), concat(@id, '|', name()) )])">
                        <div id="pane6" class="tab-pane">
                            <xsl:call-template name="block">
                                <xsl:with-param name="position">tab-6</xsl:with-param>
                                <xsl:with-param name="mode">
                                    <xsl:value-of select="php:function( 'tplPos::mode', 'tab-6', 'details' )"/>
                                </xsl:with-param>
                            </xsl:call-template> 
                        </div>
                    </xsl:if>
                </div><!-- /.tab-content -->
            </div><!-- /.tabbable -->
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>