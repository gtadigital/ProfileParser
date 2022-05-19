<?xml version="1.0" encoding="UTF-8"?>
<!-- author: ETH Zurich, gta digital, Matteo Lorenzini -->
<!-- license: please refer to the license.txt file in our git repository (https://github.com/gtadigital/XSLT) -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:pr="https://schema.easydb.de/EASYDB/1.0/objects/" exclude-result-prefixes="pr">
	<xsl:output method="xml" indent="yes"/>
	<xsl:template match="/">
		<root>
			<xsl:apply-templates/>
		</root>
	</xsl:template>
	<xsl:template match="@*|node()" mode="copy-no-namespaces">
		<xsl:copy>
			<xsl:apply-templates select="@*|node()" mode="copy-no-namespaces"/>
		</xsl:copy>
	</xsl:template>
	<xsl:template match="pr:objects/pr:act">
		
		<entry>
			<per_type_crm_uri>
				<xsl:value-of select="pr:act_type_crm_uri"/>
			</per_type_crm_uri>
			<per_identifiers>
				<_id>
					<xsl:value-of select="pr:_id"/>
				</_id>
				<per_cms_id>
					<xsl:value-of select="pr:_urls/pr:url[@type='easydb-id']"/>
				</per_cms_id>
				<per_nc_identifier_ulan>
					<xsl:value-of select="pr:act_nc_identifier_ulan_archive"/>
				</per_nc_identifier_ulan>
				<per_nc_identifier_wikidata>
					<xsl:value-of select="pr:act_nc_identifier_wikidata_archive"/>
				</per_nc_identifier_wikidata>
				<per_nc_identifier_akl>
					<xsl:value-of select="pr:act_nc_identifier_akl_archive"/>
				</per_nc_identifier_akl>
				<per_nc_identifier_morphe>
					<xsl:value-of select="pr:act_nc_identifier_morphe_archive"/>
				</per_nc_identifier_morphe>
				<per_nc_identifier_sikart>
					<xsl:value-of select="pr:act_nc_identifier_sikart_archive"/>
				</per_nc_identifier_sikart>
				<per_nc_identifier_hls>
					<xsl:value-of select="pr:act_nc_identifier_hls_archive"/>
				</per_nc_identifier_hls>
				<per_nc_identifier_archinform>
					<xsl:value-of select="pr:act_nc_identifier_archinform_archive"/>
				</per_nc_identifier_archinform>
				<per_nc_identifier_fotoch>
					<xsl:value-of select="pr:act_nc_identifier_fotoch_archive"/>
				</per_nc_identifier_fotoch>
				<per_nc_identifier_alat>
					<xsl:value-of select="pr:act_nc_identifier_alat_archive"/>
				</per_nc_identifier_alat>
			</per_identifiers>
			<per_last_modified>
				<xsl:value-of select="pr:_last_modified"/>
			</per_last_modified>
			<per_nc_name>
				<xsl:value-of select="pr:act_nc_name_archive"/>
			</per_nc_name>
			<per_nc_name_lang_akronym>
				<xsl:value-of select="pr:act_nc_name_lang_archive/pr:generic_lang/pr:generic_lang_akronym"/>
			</per_nc_name_lang_akronym>
			<per_nc_honname>
				<xsl:value-of select="pr:act_nc_honname_archive"/>
			</per_nc_honname>
			<per_nc_honname_lang_akronym>
				<xsl:value-of select="pr:act_nc_honname_lang_archive/pr:generic_lang/pr:generic_lang_akronym"/>
			</per_nc_honname_lang_akronym>
			<xsl:for-each select="pr:_nested__act__act_nc_altname_archive">
				<xsl:element name="act_altName">
					<xsl:for-each select="pr:act__act_nc_altname_archive">
						<xsl:element name="act_alt_nameLiteral">
							<per_nc_altname_literal>
								<xsl:value-of select="pr:act_nc_altname_literal_archive"/>
							</per_nc_altname_literal>
							<per_nc_altname_lang_akronym>
								<xsl:value-of select="pr:act_nc_altname_lang_archive/pr:generic_lang/pr:generic_lang_akronym"/>
							</per_nc_altname_lang_akronym>
							<per_nc_altname_type_de>
								<xsl:value-of select="pr:act_nc_altname_type_archive/pr:generic_nametype/pr:_standard/pr:de-DE"/>
							</per_nc_altname_type_de>
							<per_nc_altname_type_en>
								<xsl:value-of select="pr:act_nc_altname_type_archive/pr:generic_nametype/pr:_standard/pr:en-US"/>
							</per_nc_altname_type_en>
						</xsl:element>
					</xsl:for-each>
				</xsl:element>
			</xsl:for-each>
			<per_person_gender_de>
				<xsl:value-of select="pr:act_nc_gender_archive/pr:act_person_gender/pr:_standard/pr:de-DE"/>
			</per_person_gender_de>
			<per_person_gender_en>
				<xsl:value-of select="pr:act_nc_gender_archive/pr:act_person_gender/pr:_standard/pr:en-US"/>
			</per_person_gender_en>
			<per_short_bio>
				<xsl:element name="DE">
					<xsl:value-of select="pr:act_doc_biographical_note_archives/pr:de-DE"/>
				</xsl:element>
				<xsl:element name="EN">
					<xsl:value-of select="pr:act_doc_biographical_note_archives/pr:en-US"/>
				</xsl:element>
			</per_short_bio>
			<per_long_bio>
				<xsl:element name="DE">
					<xsl:value-of select="pr:act_doc_biographical_note_long_archives/pr:de-DE"/>
				</xsl:element>
				<xsl:element name="EN">
					<xsl:value-of select="pr:act_doc_biographical_note_long_archives/pr:en-US"/>
				</xsl:element>
			</per_long_bio>
			
			<per_exist_birth_place_id>
				<xsl:value-of select="pr:act_exist_birth_place_archive/pr:pl/pr:_id"/>
			</per_exist_birth_place_id>
			<per_exist_birth_timespan_from>
				<xsl:choose>
					<xsl:when test="string-length(pr:act_exist_birth_timespan_archive/pr:from) = 4">
						<xsl:value-of select="concat(pr:act_exist_birth_timespan_archive/pr:from,'-01-01')"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="pr:act_exist_birth_timespan_archive/pr:from"/>
					</xsl:otherwise>
				</xsl:choose>
			</per_exist_birth_timespan_from>
			<per_exist_birth_timespan_to>
				<xsl:choose>
					<xsl:when test="string-length(pr:act_exist_birth_timespan_archive/pr:to) = 4">
						<xsl:value-of select="concat(pr:act_exist_birth_timespan_archive/pr:to,'-01-01')"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="pr:act_exist_birth_timespan_archive/pr:to"/>
					</xsl:otherwise>
				</xsl:choose>
			</per_exist_birth_timespan_to>
			<per_exist_death_place>
				<xsl:value-of select="pr:act_exist_death_place_archive/pr:pl/pr:_id"/>
			</per_exist_death_place>
			<per_exist_death_timespan_from>
				<xsl:choose>
					<xsl:when test="string-length(pr:act_exist_death_timespan_archive/pr:from) = 4">
						<xsl:value-of select="concat(pr:act_exist_death_timespan_archive/pr:from,'-01-01')"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="pr:act_exist_death_timespan_archive/pr:from"/>
					</xsl:otherwise>
				</xsl:choose>
			</per_exist_death_timespan_from>
			<per_exist_death_timespan_to>
				<xsl:choose>
					<xsl:when test="string-length(pr:act_exist_death_timespan_archive/pr:from) = 4">
						<xsl:value-of select="concat(pr:act_exist_death_timespan_archive/pr:from,'-01-01')"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="pr:act_exist_death_timespan_archive/pr:from"/>
					</xsl:otherwise>
				</xsl:choose>
			</per_exist_death_timespan_to>
			<per_social_father_id>
				<xsl:value-of select="pr:act_social_father_archive/pr:act/pr:_id"/>
			</per_social_father_id>
			<per_social_mother_id>
				<xsl:value-of select="pr:act_social_mother_archive/pr:act/pr:_id"/>
			</per_social_mother_id>
			<xsl:for-each select="pr:_nested__act__act_social_national_affiliation_archive">
				<xsl:element name="act_social_national_affiliation_archive">
					<xsl:for-each select="pr:act__act_social_national_affiliation_archive">
						<per_social_national_affiliation_id>
							<xsl:value-of select="pr:act_social_national_affiliation_nationality_archive/pr:act_nat/pr:_id"/>
						</per_social_national_affiliation_id>
					</xsl:for-each>
				</xsl:element>
			</xsl:for-each>
		</entry>
	</xsl:template>
</xsl:stylesheet>
