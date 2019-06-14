<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<html>
<body>
  Long Title: <xsl:apply-templates>
  <!--
  <xsl:value-of select="Statute/Identification/LongTitle"/><br/>
-->

<h2>Others</h2>
</body>
</html>
</xsl:template>


<xsl:template match="Statute"/>
Long Title: <xsl:value-of select="Identification/LongTitle"/><br/>
</xsl:template>


<!--
<xsl:template match="/Statute"/>
</xsl:template>
<xsl:template match="/Statute"/>
<xsl:apply-templates select="Identification"/>
</xsl:template>


<xsl:template match="Identification/"/>
<h2>Identification</h2>
Long Title: <xsl:value-of select="LongTitle"/><br/>
Short Title: <xsl:value-of select="ShortTitle"/><br/>
</xsl:template>
-->

</xsl:stylesheet>
