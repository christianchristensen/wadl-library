<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    apigee.xsl
    
    Transforms Web Application Description Language (WADL) XML documents into apigee specific WADL.
 -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:wadl="http://wadl.dev.java.net/2009/02" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:html="http://www.w3.org/1999/xhtml" xmlns="http://www.w3.org/1999/xhtml" version="2.0">
  <!-- Global variables -->
  <xsl:variable name="g_resourcesBase" select="wadl:application/wadl:resources/@base"/>

  <!-- Template for top-level doc element -->
  <xsl:output method="xml" indent="no"/>

  <!-- Flatten XML namespace for apigee -->
  <xsl:template match="/|comment()|processing-instruction()">
    <xsl:copy>
      <xsl:apply-templates/>
    </xsl:copy>
  </xsl:template>

  <xsl:template match="*">
    <xsl:element name="{local-name()}">
      <xsl:apply-templates select="@*|node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="@*">
    <xsl:attribute name="{local-name()}">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

</xsl:stylesheet>
