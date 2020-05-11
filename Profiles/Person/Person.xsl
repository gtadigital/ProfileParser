<?xml version="1.0" encoding="UTF-8"?>

<!--author: ETH Zurich, gta digital, Zoe Reinke-->
<!--license: please refer to the license.txt file in our git repository (https://github.com/gtadigital/XSLT)-->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:pr="https://schema.easydb.de/EASYDB/1.0/objects/" exclude-result-prefixes="pr">
<xsl:output method="xml" indent="yes"/>
<xsl:template match="/">
 <root>
  <xsl:apply-templates/>
 </root>
</xsl:template>
<xsl:template match="pr:objects/pr:act">
 <entry>
 	<_01_actor_local_type>
   		<xsl:value-of select="pr:act_type_crm/pr:act_type_crm/pr:_standard/de-DE"/>
  	</_01_actor_local_type>
  	<_01_actor_nameclass_identifier_identifier>
   		<xsl:value-of select="pr:act_uuid"/>
  	</_01_actor_nameclass_identifier_identifier>
  	<_01_actor_nameclass_name>
   		<xsl:value-of select="pr:act_name"/>
  	</_01_actor_nameclass_name>
  	<_01_actor_nameclass_name_language>
  	</_01_actor_nameclass_name_language>
  	<_01_actor_nameclass_nameHonorific>
  		<xsl:value-of select="pr:act_honnames"/>
  	</_01_actor_nameclass_nameHonorific>
  	<_01_actor_nameclass_gender>
  		<xsl:value-of select="pr:act_person_gender/pr:act_person_gender/pr:_standard/pr:de-DE"/>
  	</_01_actor_nameclass_gender>
  	<_02_actor_existence_birthplace_UUID>
  	</_02_actor_existence_birthplace_UUID>
  	<_02_actor_existence_deathPlace_UUID>
  	</_02_actor_existence_deathPlace_UUID>
  	<_05_actor_documentation_fullbio_de>
  		<xsl:value-of select="pr:_nested_act_act_descr_long/pr:act_act_descr_long/pr:act_descr_long/pr:de-DE"/>
  	</_05_actor_documentation_fullbio_de>
  	<_05_actor_documentation_fullbio_en>
  	</_05_actor_documentation_fullbio_en>
  	<_05_actor_documentation_shortbio_de>
  		<xsl:value-of select="pr:act_description_bioshort/pr:de-DE"/>
  	</_05_actor_documentation_shortbio_de>
  	<_05_actor_documentation_shortbio_en>
  		<xsl:value-of select="pr:act_description_bioshort/pr:en-US"/>
  	</_05_actor_documentation_shortbio_en>
  	<_99_actor_nameclass_identifierGND_identifier>
  		<xsl:value-of select="pr:act_identifier_gnd"/>
  	</_99_actor_nameclass_identifierGND_identifier>
  	<_99_actor_nameclass_identifierSIKART_identifier>
  		<xsl:value-of select="pr:act_identifier_sikart"/>
  	</_99_actor_nameclass_identifierSIKART_identifier>
  	<_99_actor_nameclass_identifierULAN_identifier>
  		<xsl:value-of select="pr:act_identifier_ulan"/>
  	</_99_actor_nameclass_identifierULAN_identifier>
  	<_99_actor_nameclass_identifierWikidata_identifier>
  		<xsl:value-of select="pr:act_identifier_wikidata"/>
  	</_99_actor_nameclass_identifierWikidata_identifier>
  	<_99_actor_nameclass_identifierWikipedia_identifier>
  		<xsl:value-of select="pr:act_identifier_wikipedia"/>
  	</_99_actor_nameclass_identifierWikipedia_identifier>
 </entry>
</xsl:template>
</xsl:stylesheet>
