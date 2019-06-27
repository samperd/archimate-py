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
    <xsl:param name="url" as="xs:string" required="yes"/>
    <!--<xsl:param name="outdir" as="xs:string" required="yes"/>
    <xsl:param name="filename" as="xs:string" required="yes"/> -->
    <xsl:variable
name="doc"
select="document({$url})">

<xsl:template match="/">
  <!-- <BillNumber><xsl:value-of select="document({$doc})/Statute/Identification/BillNumber"/><BillNumber> -->
  <stuff>things</stuff>

</xsl:template>



</xsl:stylesheet>
