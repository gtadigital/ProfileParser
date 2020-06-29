<?xml version="1.0" encoding="UTF-8"?>

<!-- author: ETH Zurich, gta digital, Zoe Reinke -->
<!-- license: please refer to the license.txt file in our git repository (https://github.com/gtadigital/XSLT) -->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:pr="https://schema.easydb.de/EASYDB/1.0/objects/" exclude-result-prefixes="pr">
<xsl:output method="xml" indent="yes"/>
<xsl:template match="/">
 <root>
  <xsl:apply-templates/>
 </root>
</xsl:template>
<xsl:template match="pr:objects/pr:pl">
 <entry>
	 <plIdentifier_uuid>
		<xsl:value-of select="pr:_uuid"/> 
	 </plIdentifier_uuid>
	 <plIdentifier_uuid_provider></plIdentifier_uuid_provider>
	 <plIdentifier_nameEn>
	 	<xsl:value-of select="pr:_path/pr:pl[5]/pr:_standard/pr:en-US"/>
	 </plIdentifier_nameEn>
	 <plIdentifier_nameEn_source/>
	 <plIdentifier_nameDe>
	 	<xsl:value-of select="pr:_path/pr:pl[5]/pr:_standard/pr:de-DE"/>
	 </plIdentifier_nameDe>
	 <plIdentifier_nameDe_source/>
	 <plIdentifier_nameFr>
	 	<xsl:value-of select="pr:_path/pr:pl[5]/pr:_standard/pr:fr-FR"/>
	 </plIdentifier_nameFr>
	 <plIdentifier_nameFr_source/>
	 <plIdentifier_nameIT>
	 	<xsl:value-of select="pr:_path/pr:pl[5]/pr:_standard/pr:it-IT"/>
	 </plIdentifier_nameIT>
	 <plIdentifier_nameIt_source/>
	 <plIdentifier_type>
	 	<xsl:value-of select="pr:pl_nc_type/pr:pl_type/pr:_uuid"/>
	 </plIdentifier_type>
	 <plParthood_currentPartOf>
	 	<xsl:value-of select="pr:pl_ph_current_partof_place/pr:pl/pr:_uuid"/>
	 </plParthood_currentPartOf>
	 <plSubstance_geoWKT>
	 	<xsl:value-of select="pr:pl_sub_coordinates_wkt_v1"/>
	 </plSubstance_geoWKT>
									
	<plIdentifier_swisstopo>
		<xsl:value-of select="pr:pl_nc_indentifier_swisstopo"/>
	</plIdentifier_swisstopo>


	<plIdentifier_wikidata>
		<xsl:value-of select="pr:pl_nc_indentifier_wikidata"/>
	</plIdentifier_wikidata>

	 <plIdentifier_gnd>
		<xsl:value-of select="pr:pl_nc_indentifier_gnd"/>
	 </plIdentifier_gnd>
	 <plIdentifier_geonamesURI>
	 	<xsl:value-of select="pr:pl_nc_indentifier_geonames"/>
	 </plIdentifier_geonamesURI>
	<plIdentifier_dbpediaURI>
		<xsl:value-of select="pr:pl_nc_indentifier_dbpedia"/>
	</plIdentifier_dbpediaURI>
		
	<plIdentifier_viafURI>
		<xsl:value-of select="pr:pl_nc_indentifier_viaf"/>
	</plIdentifier_viafURI>

	 <plIdentifier_tgn_uri>
	 	<xsl:value-of select="pr:pl_nc_indentifier_tgn"/>
	 </plIdentifier_tgn_uri>
	 
 </entry>
</xsl:template>
</xsl:stylesheet>
