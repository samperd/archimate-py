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

  <xsl:variable name="uid" as="xs:string" select="UniqueId" />
<xsl:variable name="lang" as="xs:string" select="Statute/@xml:lang" />
<xsl:variable name="filename" as="xs:string" select="concat($outdir,'/',$element,'-',$uuid,'-',$lang,'.xml')" />


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

<xsl:apply-templates select="/Statute"/>
</xsl:template>

<xsl:template match="/Statute">
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
      <xsl:value-of select = "Identification/Chapter/ConsolidatedNumber" />
    </xsl:attribute>
    <xsl:attribute name="documentation">
      <xsl:value-of select="Identification/LongTitle"/>
    </xsl:attribute>
    <properties>
      <xsl:attribute name="key"><xsl:text>Type</xsl:text></xsl:attribute>
      <xsl:attribute name="value"><xsl:text>Act</xsl:text></xsl:attribute>
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
      <xsl:attribute name="key"><xsl:text>Bill-Number</xsl:text></xsl:attribute>
      <xsl:attribute name="value"><xsl:value-of select = "Identification/BillNumber" /></xsl:attribute>
    </properties>
    <properties>
      <xsl:attribute name="key"><xsl:text>Consolidated-Number</xsl:text></xsl:attribute>
      <xsl:attribute name="value"><xsl:value-of select = "Identification/Chapter/ConsolidatedNumber" /></xsl:attribute>
    </properties>
    <properties>
      <xsl:attribute name="key"><xsl:text>Assented-To</xsl:text></xsl:attribute>
      <xsl:attribute name="value"><xsl:value-of select = "Identification/BillHistory/Stages[@stage='assented-to']/Date/string-join(YYYY|MM|DD,'-')" /></xsl:attribute>
    </properties>
    <xsl:call-template name="stakeholders"/>
    </archimate:Driver>
</xsl:result-document>

  </xsl:template>

  <xsl:template name="stakeholders">

<!-- Create New Stakeholders

  <archimate:Stakeholder
      xmlns:archimate="http://www.archimatetool.com/archimate"
      name="Sample Stakeholder"
      id="fdac9f4b-ba27-4861-9af3-9d37d2edf683"/>
-->

<Stakeholders>
  <archimate:Stakeholder xmlns:archimate="http://www.archimatetool.com/archimate">
    <xsl:attribute name="name"><xsl:text>Stakeholder</xsl:text></xsl:attribute>
    <xsl:attribute name="id"><xsl:text>NULL</xsl:text></xsl:attribute>
    <xsl:attribute name="documentation"><xsl:text>documentation</xsl:text></xsl:attribute>
    <xsl:text>Stakeholder</xsl:text>
    <properties>
      <xsl:attribute name="key"><xsl:text>Type</xsl:text></xsl:attribute>
      <xsl:attribute name="value"><xsl:text>Stakeholder</xsl:text></xsl:attribute>
    </properties>
    <properties>
      <xsl:attribute name="key"><xsl:text>Source</xsl:text></xsl:attribute>
      <xsl:attribute name="value"><xsl:value-of select = "Identification/BillNumber" /></xsl:attribute>
    </properties>
  </archimate:Stakeholder>
</Stakeholders>

</xsl:template>

<xsl:template name="assessments">
<!-- Create New Assessments

  <archimate:Assessment
      xmlns:archimate="http://www.archimatetool.com/archimate"
      name="Sample Assessment"
      id="f08257dd-57ba-400a-868d-e47bdf8fd7a2"/> -->
<Assessments>
  <archimate:Stakeholder xmlns:archimate="http://www.archimatetool.com/archimate">
    <xsl:attribute name="name"><xsl:text>Stakeholder</xsl:text></xsl:attribute>
    <xsl:attribute name="id"><xsl:text>NULL</xsl:text></xsl:attribute>
    <xsl:attribute name="documentation"><xsl:text>documentation</xsl:text></xsl:attribute>
    <xsl:text>Stakeholder</xsl:text>
    <properties>
      <xsl:attribute name="key"><xsl:text>Type</xsl:text></xsl:attribute>
      <xsl:attribute name="value"><xsl:text>Stakeholder</xsl:text></xsl:attribute>
    </properties>
  </archimate:Stakeholder>
</Assessments>

</xsl:template>

<xsl:template name="goals">
<!-- Create New Goals
<archimate:Goal
    xmlns:archimate="http://www.archimatetool.com/archimate"
    name="Sample Goal"
    id="1aa21f35-a719-4a9d-a66c-fef97e43d2ee"/>-->
    <Goals>
      <archimate:Stakeholder xmlns:archimate="http://www.archimatetool.com/archimate">
        <xsl:attribute name="name"><xsl:text>Stakeholder</xsl:text></xsl:attribute>
        <xsl:attribute name="id"><xsl:text>NULL</xsl:text></xsl:attribute>
        <xsl:attribute name="documentation"><xsl:text>documentation</xsl:text></xsl:attribute>
        <xsl:text>Stakeholder</xsl:text>
        <properties>
          <xsl:attribute name="key"><xsl:text>Type</xsl:text></xsl:attribute>
          <xsl:attribute name="value"><xsl:text>Stakeholder</xsl:text></xsl:attribute>
        </properties>
      </archimate:Stakeholder>
    </Goals>

  </xsl:template>

  <xsl:template name="outcomes">

<!-- Create New Outcomes
<archimate:Outcome
    xmlns:archimate="http://www.archimatetool.com/archimate"
    name="Sample Outcome"
    id="b027c0af-952e-4f14-af59-fecf6be1d7cc"/>-->
    <Outcomes>
      <archimate:Stakeholder xmlns:archimate="http://www.archimatetool.com/archimate">
      <xsl:attribute name="name"><xsl:text>Stakeholder</xsl:text></xsl:attribute>
      <xsl:attribute name="id"><xsl:text>NULL</xsl:text></xsl:attribute>
      <xsl:attribute name="documentation"><xsl:text>documentation</xsl:text></xsl:attribute>
      <xsl:text>Stakeholder</xsl:text>
      <properties>
        <xsl:attribute name="key"><xsl:text>Type</xsl:text></xsl:attribute>
        <xsl:attribute name="value"><xsl:text>Stakeholder</xsl:text></xsl:attribute>
      </properties>
    </archimate:Stakeholder>
  </Outcomes>


</xsl:template>

<xsl:template name="principles">
<!-- Create New Principles
<archimate:Principle
    xmlns:archimate="http://www.archimatetool.com/archimate"
    name="Sample Principle"
    id="1f672827-1e20-43b8-be62-6950faf28e70"/>-->
    <Principles>
      <archimate:Stakeholder xmlns:archimate="http://www.archimatetool.com/archimate">
        <xsl:attribute name="name"><xsl:text>Stakeholder</xsl:text></xsl:attribute>
        <xsl:attribute name="id"><xsl:text>NULL</xsl:text></xsl:attribute>
        <xsl:attribute name="documentation"><xsl:text>documentation</xsl:text></xsl:attribute>
        <xsl:text>Stakeholder</xsl:text>
        <properties>
          <xsl:attribute name="key"><xsl:text>Type</xsl:text></xsl:attribute>
          <xsl:attribute name="value"><xsl:text>Stakeholder</xsl:text></xsl:attribute>
        </properties>
      </archimate:Stakeholder>
    </Principles>

  </xsl:template>

  <xsl:template name="requirements">
<!-- Create New Requirements
<archimate:Requirement
    xmlns:archimate="http://www.archimatetool.com/archimate"
    name="Sample Requirement"
    id="dcd6e8b3-1a51-4907-a912-833f54f26895"/> -->
    <Requirements>
      <archimate:Stakeholder xmlns:archimate="http://www.archimatetool.com/archimate">
        <xsl:attribute name="name"><xsl:text>Stakeholder</xsl:text></xsl:attribute>
        <xsl:attribute name="id"><xsl:text>NULL</xsl:text></xsl:attribute>
        <xsl:attribute name="documentation"><xsl:text>documentation</xsl:text></xsl:attribute>
        <xsl:text>Stakeholder</xsl:text>
        <properties>
          <xsl:attribute name="key"><xsl:text>Type</xsl:text></xsl:attribute>
          <xsl:attribute name="value"><xsl:text>Stakeholder</xsl:text></xsl:attribute>
        </properties>
      </archimate:Stakeholder>
    </Requirements>

  </xsl:template>

  <xsl:template name="constraints">
<!-- Create New Contraints
<archimate:Constraint
    xmlns:archimate="http://www.archimatetool.com/archimate"
    name="Sample Constraint"
    id="ab182ddb-d585-4910-844f-d6cb78762ed5"/> -->
    <Constraints>
      <archimate:Stakeholder xmlns:archimate="http://www.archimatetool.com/archimate">
        <xsl:attribute name="name"><xsl:text>Stakeholder</xsl:text></xsl:attribute>
        <xsl:attribute name="id"><xsl:text>NULL</xsl:text></xsl:attribute>
        <xsl:attribute name="documentation"><xsl:text>documentation</xsl:text></xsl:attribute>
        <xsl:text>Stakeholder</xsl:text>
        <properties>
          <xsl:attribute name="key"><xsl:text>Type</xsl:text></xsl:attribute>
          <xsl:attribute name="value"><xsl:text>Stakeholder</xsl:text></xsl:attribute>
        </properties>
      </archimate:Stakeholder>
    </Constraints>

  </xsl:template>

  <xsl:template name="meanings">

<!-- Create New Meaning

  <archimate:meaning>
    <assessment>Hello</assessment>
  </archimate:meaning>-->

  <Meanings>
    <archimate:Stakeholder xmlns:archimate="http://www.archimatetool.com/archimate">
      <xsl:attribute name="name"><xsl:text>Stakeholder</xsl:text></xsl:attribute>
      <xsl:attribute name="id"><xsl:text>NULL</xsl:text></xsl:attribute>
      <xsl:attribute name="documentation"><xsl:text>documentation</xsl:text></xsl:attribute>
      <xsl:text>Stakeholder</xsl:text>
      <properties>
        <xsl:attribute name="key"><xsl:text>Type</xsl:text></xsl:attribute>
        <xsl:attribute name="value"><xsl:text>Stakeholder</xsl:text></xsl:attribute>
      </properties>
    </archimate:Stakeholder>
  </Meanings>

</xsl:template>

<xsl:template name="values">

<!-- Create New Value
<archimate:Value
    xmlns:archimate="http://www.archimatetool.com/archimate"
    name="Value"
    id="1e0f8914-6540-49e6-a3ee-efbfaf9d2e51"/>-->
    <Values>
      <archimate:Stakeholder xmlns:archimate="http://www.archimatetool.com/archimate">
        <xsl:attribute name="name"><xsl:text>Stakeholder</xsl:text></xsl:attribute>
        <xsl:attribute name="id"><xsl:text>NULL</xsl:text></xsl:attribute>
        <xsl:attribute name="documentation"><xsl:text>documentation</xsl:text></xsl:attribute>
        <xsl:text>Stakeholder</xsl:text>
        <properties>
          <xsl:attribute name="key"><xsl:text>Type</xsl:text></xsl:attribute>
          <xsl:attribute name="value"><xsl:text>Stakeholder</xsl:text></xsl:attribute>
        </properties>
      </archimate:Stakeholder>
    </Values>

  </xsl:template>

  <xsl:template name="relationships">

<!-- Create New Relationships
<archimate:AssociationRelationship
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:archimate="http://www.archimatetool.com/archimate"
    id="a11e6eca-353b-4229-ac86-25ef6e2c51cd">
  <source
      xsi:type="archimate:Driver"
      href="Driver_520f9f36-3c72-4d59-b9a2-2abecfdd878a.xml#520f9f36-3c72-4d59-b9a2-2abecfdd878a"/>
  <target
      xsi:type="archimate:Driver"
      href="Driver_0b30330a-3736-4de3-9f1e-d1caccfb29ee.xml#0b30330a-3736-4de3-9f1e-d1caccfb29ee"/>
</archimate:AssociationRelationship>-->
<Relationships>
  <archimate:Stakeholder xmlns:archimate="http://www.archimatetool.com/archimate">
    <xsl:attribute name="name"><xsl:text>Stakeholder</xsl:text></xsl:attribute>
    <xsl:attribute name="id"><xsl:text>NULL</xsl:text></xsl:attribute>
    <xsl:attribute name="documentation"><xsl:text>documentation</xsl:text></xsl:attribute>
    <xsl:text>Stakeholder</xsl:text>
    <properties>
      <xsl:attribute name="key"><xsl:text>Type</xsl:text></xsl:attribute>
      <xsl:attribute name="value"><xsl:text>Stakeholder</xsl:text></xsl:attribute>
    </properties>
  </archimate:Stakeholder>
</Relationships>


</xsl:template>



    <!--
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
    </properties>-->



</xsl:stylesheet>
<!-- <xsl:for-each select="ActsRegsList/Acts/Act">
<xsl:variable name="uid">
  <xsl:value-of select="UniqueId" />
</xsl:variable>
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
 <xsl:result-document>
  <xsl:attribute name="href">
    <xsl:value-of select="$filename"/>
  </xsl:attribute>
  <xsl:attribute name="method">
    <xsl:value-of select="xml"/>
  </xsl:attribute>
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
</xsl:result-document> -->
