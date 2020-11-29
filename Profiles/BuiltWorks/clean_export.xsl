<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="1.0">
	<xsl:output method="xml"
	            indent="yes"/>
	<xsl:template match="node()|SDLT">
		<xsl:if test="count(descendant::text()[string-length(normalize-space(.))>0] | @*[string-length(.)>0])">
			<xsl:copy>
				<xsl:apply-templates select="@*|node()"/>
			</xsl:copy>
		</xsl:if>
	</xsl:template>
	<xsl:template match="@*">
		<xsl:if test="string-length(.)>0">
			<xsl:copy/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="text()">
		<xsl:value-of select="normalize-space(.)"/>
	</xsl:template>
</xsl:stylesheet>
