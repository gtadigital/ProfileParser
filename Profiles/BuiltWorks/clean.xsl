<xsl:stylesheet version="1.0" 
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
<xsl:strip-space elements="*"/>

<!-- identity transform -->
<xsl:template match="@*|node()">
    <xsl:copy>
        <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
</xsl:template>

<xsl:template match="oeu_nc_construction_time_span_from[string-length(.) = 4]">
  <xsl:copy>
    <xsl:value-of select="concat(., '-01-01')"/>
  </xsl:copy>
</xsl:template>
<xsl:template match="oeu_nc_construction_time_span_to[string-length(.) = 4]">
  <xsl:copy>
    <xsl:value-of select="concat(., '-01-01')"/>
  </xsl:copy>
</xsl:template>
<xsl:template match="oeu_nc_destruction_time_span_from[string-length(.) = 4]">
  <xsl:copy>
    <xsl:value-of select="concat(., '-01-01')"/>
  </xsl:copy>
</xsl:template>
<xsl:template match="oeu_nc_destruction_time_span_to[string-length(.) = 4]">
  <xsl:copy>
    <xsl:value-of select="concat(., '-01-01')"/>
  </xsl:copy>
</xsl:template>

</xsl:stylesheet>