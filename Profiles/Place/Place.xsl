<?xml version="1.0" encoding="UTF-8"?>

<!-- author: ETH Zurich, gta digital, Zoe Reinke, Matteo Lorenzini -->
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
	 <plIdentifier_name_literal>
		<xsl:value-of select="pr:_nested__pl__pl_nc_name/pr:pl__pl_nc_name[2]/pr:pl_nc_name_literal"/> 
	 </plIdentifier_name_literal>
	 <plIdentifier_type>
	 	<xsl:value-of select="pr:pl_nc_type/pr:pl_type/pr:_uuid"/>
	 </plIdentifier_type>
	 <plParthood_currentPartOf>
	 	<xsl:value-of select="pr:_nested__pl__pl_ph_current_partof_place_manual/pr:pl__pl_ph_current_partof_place_manual/pr:pl_ph_current_partof_place_manual_place/pr:pl/pr:_uuid"/> 
	 </plParthood_currentPartOf>
	 <plSubstance_geoWKT>
	 	<xsl:value-of select="pr:pl_sub_coordinates_wkt_v1"/>
	 </plSubstance_geoWKT>
	
	<!--Swisstopo-->
	<plIdentifier_swisstopo_provider>
		<xsl:value-of select="pr:pl_nc_indentifier_swisstopo_provider/pr:generic_contributor/pr:generic_contributor_sari_uuid"/>
	</plIdentifier_swisstopo_provider>
	<plIdentifier_swisstopo>
		<xsl:value-of select="pr:pl_nc_indentifier_swisstopo"/>
	</plIdentifier_swisstopo> 
	
	<!-- City of zurich -->
	<plIdentifier_stzh_provider>
		<xsl:value-of select="pr:pl_nc_identifier_stzh_provider/pr:generic_contributor/pr:generic_contributor_sari_uuid"/>
	</plIdentifier_stzh_provider>
	<!-- TGN -->
	<plIdentifier_tgn_provider>
	 	<xsl:value-of select="pr:pl_nc_indentifier_tgn_provider/pr:generic_contributor/pr:generic_contributor_sari_uuid"/>
	</plIdentifier_tgn_provider>
	 <!--Wikidata-->
	<plIdentifier_wikidata_provider>
		<xsl:value-of select="pr:pl_nc_indentifier_wikidata_provider/pr:generic_contributor/pr:generic_contributor_sari_uuid"/>
	</plIdentifier_wikidata_provider>
	<!--Geonames-->
	<plIdentifier_geonames_provider>
	 	<xsl:value-of select="pr:pl_nc_indentifier_geonames_provider/pr:generic_contributor/pr:generic_contributor_sari_uuid"/>
	</plIdentifier_geonames_provider>
	<!--GND-->
	<plIdentifier_gnd_provider>
		<xsl:value-of select="pr:pl_nc_indentifier_gnd_provider/pr:generic_contributor/pr:generic_contributor_sari_uuid"/>
	</plIdentifier_gnd_provider>
	<!--DbPedia-->
	<plIdentifier_dbpedia_provider>
		<xsl:value-of select="pr:pl_nc_indentifier_dbpedia_provider/pr:generic_contributor/pr:generic_contributor_sari_uuid"/>
	</plIdentifier_dbpedia_provider>
	<!--VIAF-->
	<plIdentifier_viaf_provider>
		<xsl:value-of select="pr:pl_nc_indentifier_viaf_provider/pr:generic_contributor/pr:generic_contributor_sari_uuid"/>
	</plIdentifier_viaf_provider>
	


	



	 

	
		

	 
 </entry>
</xsl:template>
</xsl:stylesheet>
