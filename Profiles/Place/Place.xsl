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
	 	<xsl:value-of select="pr:pl_uuid"/>
	 </plIdentifier_uuid>
	 <plIdentifier_uuid_type>
	 	<xsl:value-of select="pr:pl_uuid/@type"/>
	 </plIdentifier_uuid_type>
	 <plIdentifier_uuid_provider></plIdentifier_uuid_provider>
	 <plIdentifier_nameGeneric>
	 	<xsl:value-of select="pr:pl_name_display"/>
	 </plIdentifier_nameGeneric>
	 <plIdentifier_nameGeneric_source>
	 	<xsl:value-of select="pr:_nested__pl__pl_nc_name/pr:pl__pl_nc_name/pr:pl_nc_name_source/pr:generic_contributor/pr:_standard/pr:de-DE"/>
	 </plIdentifier_nameGeneric_source>
	 <plIdentifier_nameEn>
	 	<xsl:value-of select="pr:_path/pr:pl[4]/pr:_standard/pr:en-US"/>
	 </plIdentifier_nameEn>
	 <plIdentifier_nameEn_source/>
	 <plIdentifier_nameDe>
	 	<xsl:value-of select="pr:_path/pr:pl[4]/pr:_standard/pr:de-DE"/>
	 </plIdentifier_nameDe>
	 <plIdentifier_nameDe_source/>
	 <plIdentifier_nameFr>
	 	<xsl:value-of select="pr:_path/pr:pl[4]/pr:_standard/pr:fr-FR"/>
	 </plIdentifier_nameFr>
	 <plIdentifier_nameFr_source/>
	 <plIdentifier_nameIT>
	 	<xsl:value-of select="pr:_path/pr:pl[4]/pr:_standard/pr:it-IT"/>
	 </plIdentifier_nameIT>
	 <plIdentifier_nameIt_source/>
	 <plIdentifier_type>
	 	<xsl:value-of select="pr:pl_nc_type/pr:pl_type/pr:_path/pr:pl_type/pr:_id"/>
	 </plIdentifier_type>
	 <plParthood_currentPartOf>
	 	<xsl:value-of select="pr:pl_ph_current_partof_place/pr:pl/pr:_uuid"/>
	 </plParthood_currentPartOf>
	 <plParthood_currentHasPart/>
	 <plParthood_parentString>
	 	<xsl:value-of select="pr:pl_parent_string"/>
	 </plParthood_parentString>
	 <plParthood_parentStringSource>
	 	<xsl:value-of select="pr:_nested__pl__pl_nc_name/pr:pl__pl_nc_name/pr:pl_nc_name_source/pr:generic_contributor/pr:_standard/pr:de-DE"/>
	 </plParthood_parentStringSource>
	 <plSubstance_geoWKT>
	 	<xsl:value-of select="pr:pl_sub_coordinates_wkt_v1"/>
	 </plSubstance_geoWKT>
	 <plIdentifier_geonamesURI>
	 	<xsl:value-of select="pr:pl_nc_indentifier_geonames"/>
	 </plIdentifier_geonamesURI>
	 <plIdentifier_geonamesType>
	 	<xsl:value-of select="pr:pl_nc_indentifier_geonames/@type"/>
	 </plIdentifier_geonamesType>
	 <plIdentifier_geonamesProvider/>
	 <plIdentifier_geonamesSource>
	 	<xsl:value-of select="pr:pl_nc_indentifier_geonames_source"/>
	 </plIdentifier_geonamesSource>
	 <plIdentifier_tgn_uri>
	 	<xsl:value-of select="pr:pl_nc_indentifier_tgn"/>
	 </plIdentifier_tgn_uri>
	 <plIdentifier_tgn_type>
	 	 <xsl:value-of select="pr:pl_nc_indentifier_tgn/@type"/>
	 </plIdentifier_tgn_type>
	 <plIdentifier_tgn_provider>
	 	<xsl:value-of select="pr:_nested__pl__pl_nc_name/pr:pl__pl_nc_name/pr:pl_nc_name_source/pr:generic_contributor/pr:_standard/pr:de-DE"/>
	 </plIdentifier_tgn_provider>
	 <plIdentifier_tgn_preferredTerm></plIdentifier_tgn_preferredTerm>
	 <plIdentifier_tgn_parentURI>
	 	<xsl:value-of select="pr:pl_nc_indentifier_tgn"/>
	 </plIdentifier_tgn_parentURI>
	 <pl_uuid_parent>
	 	<xsl:value-of select="pr:pl_uuid_parent"/>
	 </pl_uuid_parent>
	 <plIdentifier_tgn_parentString></plIdentifier_tgn_parentString>
	 <plSubstance_tgn_lat></plSubstance_tgn_lat>
	 <plSubstance_tgn_long></plSubstance_tgn_long>
 </entry>
</xsl:template>
</xsl:stylesheet>
