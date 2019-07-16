<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"  xmlns:archimate="http://www.archimatetool.com/archimate"  xmlns:xs="http://www.w3.org/2001/XMLSchema">
  <xsl:output version="1.0"    encoding="UTF-8"    standalone="yes"    indent="yes"    xmlns:archimate="http://www.archimatetool.com/archimate"/>
  <xsl:param name="uuid" as="xs:string" required="yes"/>
  <xsl:param name="outdir" as="xs:string" required="yes"/>
  <xsl:param name="layer" as="xs:string" required="yes"/>
  <xsl:param name="element" as="xs:string" required="yes"/>
  <!-- <xsl:variable name="outdir">
  <xsl:value-of select="'../data/output/Driver'"/>
</xsl:variable>
<xsl:param name="filename" as="xs:string" required="yes"/> -->
<xsl:template match="/">
  <!-- <xsl:result-document href="{$outdir}/{$filename}" method="xml"> -->

<xsl:message>Acts and Regs:</xsl:message>

<xsl:for-each select="ActsRegsList/Acts/Act">
  <!-- <xsl:variable name="uid">
  <xsl:value-of select="UniqueId" />
</xsl:variable>-->
<xsl:variable name="uid" as="xs:string" select="UniqueId" />
<xsl:variable name="lang" as="xs:string" select="Language" />
<xsl:variable name="filename" as="xs:string" select="concat($outdir,'/',$element,'-',$uid,'-',$lang,'.xml')" />

<xsl:message>lang: <xsl:value-of select="$lang"/></xsl:message>

<xsl:if test="$lang = 'eng'">
  <xsl:message>+======================+</xsl:message>
  <xsl:message>| General Information: |</xsl:message>
  <xsl:message>+======================+</xsl:message>
  <xsl:message>filename: <xsl:value-of select="$filename"/></xsl:message>
  <xsl:message>outdir: <xsl:value-of select="$outdir"/></xsl:message>
  <xsl:message>layer: <xsl:value-of select="$layer"/></xsl:message>
  <xsl:message>element: <xsl:value-of select="$element"/></xsl:message>
  <xsl:message>innerlang: <xsl:value-of select="$lang"/>
</xsl:message>
<xsl:result-document href="{$filename}" method="xml">
  <!--<xsl:result-document>
  <xsl:attribute name="href">
    <xsl:value-of select="$filename"/>
  </xsl:attribute>
  <xsl:attribute name="method">
    <xsl:value-of select="xml"/>
  </xsl:attribute>-->
  <archimate:Driver>
    <xsl:attribute name="name">
      <xsl:value-of select="Title"/>
    </xsl:attribute>
    <xsl:attribute name="id">
      <xsl:value-of select = "UniqueId" />
    </xsl:attribute>
    <xsl:attribute name="documentation">
      <xsl:text>Provides direction to government institutions to ensure compliance with the Privacy Act</xsl:text>
    </xsl:attribute>
    <properties>
      <xsl:attribute name="key">
        <xsl:text>Type</xsl:text>
      </xsl:attribute>
      <xsl:attribute name="value">
        <xsl:text>Policy</xsl:text>
      </xsl:attribute>
    </properties>
    <properties>
      <xsl:attribute name="key">
        <xsl:text>UUID</xsl:text>
      </xsl:attribute>
      <xsl:attribute name="value">
        <xsl:value-of select = "$uuid"/>
      </xsl:attribute>
    </properties>
    <properties>
      <xsl:attribute name="key">
        <xsl:text>UniqueId</xsl:text>
      </xsl:attribute>
      <xsl:attribute name="value">
        <xsl:value-of select = "UniqueId" />
      </xsl:attribute>
    </properties>
    <properties>
      <xsl:attribute name="key">
        <xsl:text>Language</xsl:text>
      </xsl:attribute>
      <xsl:attribute name="value">
        <xsl:value-of select = "Language" />
      </xsl:attribute>
    </properties>
    <properties>
      <xsl:attribute name="key">
        <xsl:text>URL:XML</xsl:text>
      </xsl:attribute>
      <xsl:attribute name="value">
        <xsl:value-of select = "LinkToXML" />
      </xsl:attribute>
    </properties>
    <properties>
      <xsl:attribute name="key">
        <xsl:text>URL:HTML</xsl:text>
      </xsl:attribute>
      <xsl:attribute name="value">
        <xsl:value-of select = "LinkToHTMLToC" />
      </xsl:attribute>
    </properties>
    <properties>
      <xsl:attribute name="key">
        <xsl:text>Current To Date</xsl:text>
      </xsl:attribute>
      <xsl:attribute name="value">
        <xsl:value-of select = "CurrentToDate" />
      </xsl:attribute>
    </properties>
  </archimate:Driver>
</xsl:result-document>
</xsl:if>
<!-- </xsl:result-document> -->
</xsl:for-each>
<xsl:result-document href="{$outdir}/folder.xml" method="xml">
  <archimate:Folder>
    <!--xmlns:archimate="http://www.archimatetool.com/archimate"
    name="Motivation"
    id="b6745801-0833-4efd-9792-4ac33d88e895"
    type="motivation">-->
    <xsl:message>+=====================+</xsl:message>
    <xsl:message>| Folder Information: |</xsl:message>
    <xsl:message>+=====================+</xsl:message>
    <xsl:message>name: <xsl:value-of select="$layer"/></xsl:message>
    <xsl:message>id: <xsl:value-of select="$uuid"/></xsl:message>
    <xsl:message>type: <xsl:value-of select="$layer"/></xsl:message>
    <xsl:attribute name="name"><xsl:value-of select = "$layer" /></xsl:attribute>
    <xsl:attribute name="id"><xsl:value-of select = "$uuid" /></xsl:attribute>
    <xsl:attribute name="type"><xsl:value-of select = "$layer" /></xsl:attribute>
  </archimate:Folder>


</xsl:result-document>

</xsl:template>
</xsl:stylesheet>
