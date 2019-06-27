<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="2.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:archimate="http://www.archimatetool.com/archimate"
  xmlns:xs="http://www.w3.org/2001/XMLSchema">
  <xsl:output version="1.0"
    encoding="UTF-8"
    standalone="yes"
    indent="yes"
    xmlns:archimate="http://www.archimatetool.com/archimate"/>
    <xsl:param name="uuid" as="xs:string" required="yes"/>
    <!--<xsl:param name="outdir" as="xs:string" required="yes"/>
    <xsl:param name="filename" as="xs:string" required="yes"/> -->

<xsl:template match="/">
  <!-- <xsl:result-document href="{$outdir}/{$filename}" method="xml"> -->

    <xsl:for-each select="ActsRegsList/Acts/Act">
      <xsl:variable name="uid"><xsl:value-of select = "UniqueId" /></xsl:variable>
      <xsl:variable name="lang"><xsl:value-of select = "Language" /></xsl:variable>
      <xsl:if test="$lang = 'eng'">
      <xsl:result-document href="../model/motivation/Driver_{$uid}-{$lang}.xml"
        method="xml">
  <archimate:Driver>
    <xsl:attribute name="name"><xsl:value-of select="Title"/></xsl:attribute>
    <xsl:attribute name="id"><xsl:value-of select = "UniqueId" /></xsl:attribute>
    <xsl:attribute name="documentation"><xsl:text>Provides direction to government institutions to ensure compliance with the Privacy Act</xsl:text></xsl:attribute>
  <properties>
    <xsl:attribute name="key"><xsl:text>Type</xsl:text></xsl:attribute>
    <xsl:attribute name="value"><xsl:text>Policy</xsl:text></xsl:attribute>
  </properties>
  <properties>
    <xsl:attribute name="key"><xsl:text>UUID</xsl:text></xsl:attribute>
    <xsl:attribute name="value"><xsl:value-of select = "$uuid"/></xsl:attribute>
  </properties>
  <properties>
    <xsl:attribute name="key"><xsl:text>UniqueId</xsl:text></xsl:attribute>
    <xsl:attribute name="value"><xsl:value-of select = "UniqueId" /></xsl:attribute>
  </properties>
  <properties>
    <xsl:attribute name="key"><xsl:text>Language</xsl:text></xsl:attribute>
    <xsl:attribute name="value"><xsl:value-of select = "Language" /></xsl:attribute>
  </properties>
  <properties>
    <xsl:attribute name="key"><xsl:text>URL:XML</xsl:text></xsl:attribute>
    <xsl:attribute name="value"><xsl:value-of select = "LinkToXML" /></xsl:attribute>
  </properties>
  <properties>
    <xsl:attribute name="key"><xsl:text>URL:HTML</xsl:text></xsl:attribute>
    <xsl:attribute name="value"><xsl:value-of select = "LinkToHTMLToC" /></xsl:attribute>
  </properties>
  <properties>
    <xsl:attribute name="key"><xsl:text>Current To Date</xsl:text></xsl:attribute>
    <xsl:attribute name="value"><xsl:value-of select = "CurrentToDate" /></xsl:attribute>
  </properties>


</archimate:Driver>
</xsl:result-document>
</xsl:if>
</xsl:for-each>
<!-- </xsl:result-document> -->
</xsl:template>



</xsl:stylesheet>
