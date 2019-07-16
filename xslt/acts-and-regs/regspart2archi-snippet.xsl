<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"  xmlns:archimate="http://www.archimatetool.com/archimate"  xmlns:xs="http://www.w3.org/2001/XMLSchema">
  <xsl:output version="1.0"    encoding="UTF-8"    standalone="yes"    indent="yes"    xmlns:archimate="http://www.archimatetool.com/archimate"/>
  <xsl:param name="uuid" as="xs:string" required="yes"/>
  <xsl:param name="outdir" as="xs:string" required="yes"/>
  <xsl:param name="layer" as="xs:string" required="yes"/>
  <xsl:param name="element" as="xs:string" required="yes"/>
  <xsl:param name="urlbase" as="xs:string" required="yes"/>
  <xsl:param name="urlxml" as="xs:string" required="yes"/>
  <xsl:param name="urlhtml" as="xs:string" required="yes"/>
  <xsl:param name="type" as="xs:string" required="yes"/>
  <xsl:param name="typeshort" as="xs:string" required="yes"/>

  <xsl:variable name="uid" as="xs:string" select="UniqueId" />
<xsl:variable name="lang" as="xs:string" select="Regulation/@xml:lang" />
<xsl:variable name="filename" as="xs:string" select="concat($outdir,'/',$element,'-',$typeshort,'-',$uuid,'-',$lang,'.xml')" />


  <!-- <xsl:variable name="outdir">
  <xsl:value-of select="'../data/output/Driver'"/>
</xsl:variable>
<xsl:param name="filename" as="xs:string" required="yes"/> -->
<xsl:template match="/">

  <xsl:message>+======================+</xsl:message>
  <xsl:message>| General Information: |</xsl:message>
  <xsl:message>+======================+</xsl:message>
  <xsl:message>uuid: <xsl:value-of select="$uuid"/></xsl:message>
  <xsl:message>outdir: <xsl:value-of select="$outdir"/></xsl:message>
  <xsl:message>layer: <xsl:value-of select="$layer"/></xsl:message>
  <xsl:message>element: <xsl:value-of select="$element"/></xsl:message>
  <xsl:message>lang: <xsl:value-of select="$lang"/></xsl:message>
  <xsl:message>filename: <xsl:value-of select="$filename"/></xsl:message>

<xsl:apply-templates select="/Regulation"/>
</xsl:template>

<xsl:template match="/Regulation">
  <!-- <xsl:result-document href="{$outdir}/{$filename}" method="xml"> -->
  <xsl:call-template name="driver"/>
</xsl:template>

<xsl:template name="driver">
  <!-- Create the main Driver element on the Motivation layer -->
  <xsl:result-document href="{$filename}" method="xml">
  <archimate:Driver>
    <xsl:attribute name="name">
      <xsl:value-of select="Identification/ShortTitle"/>
    </xsl:attribute>
    <xsl:attribute name="id">
      <xsl:value-of select = "Identification/InstrumentNumber" />
    </xsl:attribute>
    <xsl:attribute name="documentation">
      <xsl:value-of select="Identification/LongTitle"/>
    </xsl:attribute>
    <properties>
      <xsl:attribute name="key"><xsl:text>Type</xsl:text></xsl:attribute>
      <xsl:attribute name="value"><xsl:value-of select = "$type" /></xsl:attribute>
    </properties>
    <properties>
      <xsl:attribute name="key"><xsl:text>URL-HTML</xsl:text></xsl:attribute>
      <xsl:attribute name="value"><xsl:value-of select = "$urlhtml" /></xsl:attribute>
    </properties>
    <properties>
      <xsl:attribute name="key"><xsl:text>URL-XML</xsl:text></xsl:attribute>
      <xsl:attribute name="value"><xsl:value-of select = "$urlxml" /></xsl:attribute>
    </properties>
    <properties>
      <xsl:attribute name="key"><xsl:text>Git-File-Name</xsl:text></xsl:attribute>
      <xsl:attribute name="value"><xsl:value-of select = "concat($element,'-Legis-',$uuid,'-',$lang,'.xml')" /></xsl:attribute>
    </properties>
    <properties>
      <xsl:attribute name="key"><xsl:text>Object-UUID</xsl:text></xsl:attribute>
      <xsl:attribute name="value"><xsl:value-of select = "$uuid" /></xsl:attribute>
    </properties>
    </archimate:Driver>
</xsl:result-document>

  </xsl:template>





</xsl:stylesheet>
