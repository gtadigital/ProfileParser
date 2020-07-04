<?xml version="1.0" encoding="UTF-8"?>

<!-- author: ETH Zurich, gta digital, Zoe Reinke, Matteo Lorenzini -->
<!-- license: please refer to the license.txt file in our git repository (https://github.com/gtadigital/XSLT) -->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:pr="https://schema.easydb.de/EASYDB/1.0/objects/" exclude-result-prefixes="pr">
	<xsl:output method="xml" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:template match="/">
		<root>
			<xsl:apply-templates/>
		</root>
	</xsl:template>
	<xsl:template match="@*|node()">
		<xsl:copy>
			<xsl:apply-templates select="@*|node()"/>
		</xsl:copy>
	</xsl:template>
	<xsl:template match="pr:objects/pr:pl">
		<entry>
			<plIdentifier_uuid>
				<xsl:value-of select="pr:_uuid"/>
			</plIdentifier_uuid>
			<xsl:for-each select="pr:_nested__pl__pl_nc_name/pr:pl__pl_nc_name">
				<plIdentifier_name_literal>
					<xsl:value-of select="pr:pl_nc_name_literal"/>
				</plIdentifier_name_literal>
				<xsl:copy>
					<plIdentifier_name_lang>
						<xsl:copy-of select="pr:pl_nc_name_language/pr:generic_lang/pr:_standard|pr:de-DE"/>
					</plIdentifier_name_lang>
				</xsl:copy>
			</xsl:for-each>
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
				<xsl:value-of select="pr:pl_nc_identifier_swisstopo_provider/pr:generic_contributor/pr:generic_contributor_sari_uuid"/>
			</plIdentifier_swisstopo_provider>
			<plIdentifier_swisstopoURI>
				<xsl:value-of select="pr:pl_nc_identifier_swisstopo"/>
			</plIdentifier_swisstopoURI>

			<!-- City of zurich -->
			<plIdentifier_stzh_provider>
				<xsl:value-of select="pr:pl_nc_identifier_stzh_provider/pr:generic_contributor/pr:generic_contributor_sari_uuid"/>
			</plIdentifier_stzh_provider>
			<plIdentifier_stzhURI>
				<xsl:value-of select="pr:pl_nc_identifier_stzh"/>
			</plIdentifier_stzhURI>
			<!-- TGN -->
			<plIdentifier_tgn_provider>
				<xsl:value-of select="pr:pl_nc_identifier_tgn_provider/pr:generic_contributor/pr:generic_contributor_sari_uuid"/>
			</plIdentifier_tgn_provider>
			<plIdentifier_tgnURI>
				<xsl:value-of select="pr:pl_nc_identifier_tgn"/>
			</plIdentifier_tgnURI>
			<!--Wikidata-->
			<plIdentifier_wikidata_provider>
				<xsl:value-of select="pr:pl_nc_identifier_wikidata_provider/pr:generic_contributor/pr:generic_contributor_sari_uuid"/>
			</plIdentifier_wikidata_provider>
			<plIdentifier_wikidataURI>
				<xsl:value-of select="pr:pl_nc_identifier_wikidata"/>
			</plIdentifier_wikidataURI>
			<!--Geonames-->
			<plIdentifier_geonames_provider>
				<xsl:value-of select="pr:pl_nc_identifier_geonames_provider/pr:generic_contributor/pr:generic_contributor_sari_uuid"/>
			</plIdentifier_geonames_provider>
			<plIdentifier_geonamesURI>
				<xsl:value-of select="pr:pl_nc_identifier_geonames"/>
			</plIdentifier_geonamesURI>
			<!--GND-->
			<plIdentifier_gnd_provider>
				<xsl:value-of select="pr:pl_nc_identifier_gnd_provider/pr:generic_contributor/pr:generic_contributor_sari_uuid"/>
			</plIdentifier_gnd_provider>
			<plIdentifier_gndURI>
				<xsl:value-of select="pr:pl_nc_identifier_gnd"/>
			</plIdentifier_gndURI>
			<!--DbPedia-->
			<plIdentifier_dbpedia_provider>
				<xsl:value-of select="pr:pl_nc_identifier_dbpedia_provider/pr:generic_contributor/pr:generic_contributor_sari_uuid"/>
			</plIdentifier_dbpedia_provider>
			<plIdentifier_dbpediaURI>
				<xsl:value-of select="pr:pl_nc_identifier_dbpedia"/>
			</plIdentifier_dbpediaURI>
			<!--VIAF-->
			<plIdentifier_viaf_provider>
				<xsl:value-of select="pr:pl_nc_identifier_viaf_provider/pr:generic_contributor/pr:generic_contributor_sari_uuid"/>
			</plIdentifier_viaf_provider>
			<plIdentifier_viafURI>
				<xsl:value-of select="pr:pl_nc_identifier_viaf"/>
			</plIdentifier_viafURI>
		</entry>
	</xsl:template>
</xsl:stylesheet>
