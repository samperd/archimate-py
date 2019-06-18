<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<html>
<body>
<h2>Consolidated federal Acts and regulations - Bulk XML file - Open Government Portal</h2>
<table border="1">
    <tr bgcolor="#9acd32">
      <th style="text-align:left">Statute id</th>
      <th style="text-align:left">ChapterNumber</th>
      <th style="text-align:left">Language</th>
      <th style="text-align:left">ShortTitle</th>
      <th style="text-align:left">ReversedShortTitle</th>
      <th style="text-align:left">LastConsolidationDate</th>
      <th style="text-align:left">ConsolidateFlag</th>
    </tr>

    <xsl:for-each select="Database/Statutes/Statute">
      <xsl:sort select="ChapterNumber"/>
      <tr>
        <xsl:variable name="ch-num" select="ChapterNumber"/>
      <td><xsl:value-of select="Statute"/></td>
      <td><a href="./Consolidation_2.0.0/English/Statutes/{$ch-num}.xml"><xsl:value-of select="ChapterNumber"/></a></td>
      <td><xsl:value-of select="Language"/></td>
      <td><xsl:value-of select="ShortTitle"/></td>
      <td><xsl:value-of select="ReversedShortTitle"/></td>
      <td><xsl:value-of select="LastConsolidationDate"/></td>
      <td><xsl:value-of select="ConsolidateFlag"/></td>
    </tr>
    </xsl:for-each>

</table>
</body>
</html>
</xsl:template>
</xsl:stylesheet>

<!--
<Statute id="167E">
<ChapterNumber>A-1</ChapterNumber>
<Language>en</Language>
<ShortTitle>Access to Information Act</ShortTitle>
<ReversedShortTitle>Access to Information Act</ReversedShortTitle>
<LastConsolidationDate>20190523</LastConsolidationDate>
<ConsolidateFlag>True</ConsolidateFlag>
-->
