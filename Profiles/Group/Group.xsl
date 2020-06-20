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
<xsl:template match="pr:objects/pr:act">
 <entry>
	 <_01_actor_local_institutionalContributor>
	 	 <xsl:value-of select="pr:_nested__act__act_descr_short/pr:act__act_descr_short/pr:act_descr_short_source/pr:generic_contributor/pr:_standard/pr:en-US"/>
	 </_01_actor_local_institutionalContributor>
	<_01_actor_local_type>
		<xsl:value-of select="pr:act_type_crm/pr:act_type_crm/pr:act_type_crm_name"/>
	</_01_actor_local_type>
	<_01_actor_nameclass_identifier_identifier>
		<xsl:value-of select="pr:act_uuid"/>
	</_01_actor_nameclass_identifier_identifier>
	<_01_actor_nameclass_identifier_identifierURI/>
	<_01_actor_nameclass_identifier_identifierType/>
	<_01_actor_nameclass_identifier_identifierProvider/>
	<_01_actor_nameclass_identifier_identifierProviderURI/>
	<_01_actor_nameclass_name>
		<xsl:value-of select="pr:act_name"/>
	</_01_actor_nameclass_name>
	<_01_actor_nameclass_name_language>
		<xsl:value-of select="pr:act_name_lang/pr:generic_lang/pr:generic_lang_name/pr:en-US"/>
	</_01_actor_nameclass_name_language>
	<_01_actor_nameclass_nameHonorific>
		<xsl:value-of select="pr:act_honname"/>
	</_01_actor_nameclass_nameHonorific>
	<_01_actor_nameclass_gender/>
	<_02_actor_existence_birthDate_p81a/>
	<_02_actor_existence_birthDate_p81b/>
	<_02_actor_existence_birthDate_p82a/>
	<_02_actor_existence_birthDate_p82b/>
	<_02_actor_existence_birthDate_uncertainty/>
	<_02_actor_existence_birthPlace_UUID/>
	<_02_actor_existence_birthPlace_uri/>
	<_02_actor_existence_deathDate_p81a/>
	<_02_actor_existence_deathDate_p81b/>
	<_02_actor_existence_deathDate_p82a/>
	<_02_actor_existence_deathDate_p82b/>
	<_02_actor_existence_deathDate_uncertainty/>
	<_02_actor_existence_deathPlace_UUID/>
	<_02_actor_existence_deathPlace_uri/>
	<_05_actor_documentation_fullbio_de>
		<xsl:value-of select="pr:_nested__act__act_descr_long/pr:act__act_descr_long/pr:act_descr_long/pr:de-DE"/>
	</_05_actor_documentation_fullbio_de>
	<_05_actor_documentation_fullbio_en/>
	<_05_actor_documentation_shortbio_de>
		<xsl:value-of select="pr:act_description_bioshort/pr:de-DE"/>
	</_05_actor_documentation_shortbio_de>
	<_05_actor_documentation_shortbio_en>
		<xsl:value-of select="pr:act_description_bioshort/pr:en-US"/>
	</_05_actor_documentation_shortbio_en>
	<_99_actor_nameclass_identifierGND_identifier>
		<xsl:value-of select="pr:act_identifier_gnd"/>
	</_99_actor_nameclass_identifierGND_identifier>
	<_99_actor_nameclass_identifierGND_identifierProvider/>
	<_99_actor_nameclass_identifierGND_identifierType/>
	<_99_actor_nameclass_identifierSIKART_identifier>
		<xsl:value-of select="pr:act_identifier_sikart"/>
	</_99_actor_nameclass_identifierSIKART_identifier>
	<_99_actor_nameclass_identifierSIKART_identifierProvider/>
	<_99_actor_nameclass_identifierSIKART_identifierType/>
	<_99_actor_nameclass_identifierULAN_identifier>
		<xsl:value-of select="pr:act_identifier_ulan"/>
	</_99_actor_nameclass_identifierULAN_identifier>
	<_99_actor_nameclass_identifierULAN_identifierProvider/>
	<_99_actor_nameclass_identifierULAN_identifierType/>
	<_99_actor_nameclass_identifierWikidata_identifier>
		<xsl:value-of select="pr:act_identifier_wikidata"/>
	</_99_actor_nameclass_identifierWikidata_identifier>
	<_99_actor_nameclass_identifierWikidata_identifierProvider/>
	<_99_actor_nameclass_identifierWikidata_identifierType/>
	<_99_actor_nameclass_identifierWikipedia_identifier>
		<xsl:value-of select="pr:act_identifier_wikipedia"/>
	</_99_actor_nameclass_identifierWikipedia_identifier>
	<_99_actor_nameclass_identifierWikipedia_identifierProvider/>
	<_99_actor_nameclass_identifierWikipedia_identifierType/>
 </entry>
</xsl:template>
</xsl:stylesheet>
