<?xml version="1.0" encoding="UTF-8"?>
<!-- author: ETH Zurich, gta digital, Matteo Lorenzini, Zoe Reinke -->
<!-- license: please refer to the license.txt file in our git repository (https://github.com/gtadigital/XSLT) -->
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:pr="https://schema.easydb.de/EASYDB/1.0/objects/"
                exclude-result-prefixes="pr">
	<xsl:output method="xml"
	            indent="yes"/>
	<xsl:template match="/">
		<root>
			<xsl:apply-templates/>
		</root>
	</xsl:template>
	<xsl:template match="@*|node()"
	              mode="copy-no-namespaces">
		<xsl:copy>
			<xsl:apply-templates select="@*|node()"
			                     mode="copy-no-namespaces"/>
		</xsl:copy>
	</xsl:template>
	<xsl:template match="pr:objects/pr:act">
	<xsl:variable name="wikidata" select="pr:act_nc_identifier_wikidata" />
	<xsl:variable name="gnd" select="pr:pl_nc_identifier_gnd" />
	<xsl:variable name="ulan" select="pr:act_nc_identifier_ulan" />
	<xsl:variable name="sikart" select="pr:act_nc_identifier_sikart" />
	
		<entry>
			<per_type_crm_de>
				<xsl:value-of select="pr:act_type_crm/pr:act_type_crm/pr:_standard/pr:de-DE"/>
			</per_type_crm_de>
			<per_type_crm_en>
				<xsl:value-of select="pr:act_type_crm/pr:act_type_crm/pr:_standard/pr:en-US"/>
			</per_type_crm_en>
			<per_type_crm_it>
				<xsl:value-of select="pr:act_type_crm/pr:act_type_crm/pr:_standard/pr:it-IT"/>
			</per_type_crm_it>
			<per_type_crm_fr>
				<xsl:value-of select="pr:act_type_crm/pr:act_type_crm/pr:_standard/pr:fr-FR"/>
			</per_type_crm_fr>
			<per_uuid>
				<xsl:value-of select="pr:_uuid"/>
			</per_uuid>
			<per_nc_name>
				<xsl:value-of select="pr:act_nc_name"/>
			</per_nc_name>
			<per_nc_name_lang_akronym>
				<xsl:value-of select="pr:act_nc_name_lang/pr:generic_lang/pr:generic_lang_akronym"/>
			</per_nc_name_lang_akronym>
			<per_nc_honname>
				<xsl:value-of select="pr:act_nc_honname"/>
			</per_nc_honname>
			<per_nc_honname_lang_akronym>
				<xsl:value-of select="pr:act_nc_honname_lang/pr:generic_lang/pr:generic_lang_akronym"/>
			</per_nc_honname_lang_akronym>
			<xsl:for-each select="pr:_nested__act__act_nc_altname">
				<xsl:element name="act_altName">
					<xsl:for-each select="pr:act__act_nc_altname">
						<xsl:element name="act_alt_nameLiteral">
							<per_nc_altname_literal>
								<xsl:value-of select="pr:act_nc_altname_literal"/>
							</per_nc_altname_literal>
							<per_nc_altname_lang_akronym>
								<xsl:value-of select="pr:act_nc_altname_lang/pr:generic_lang/pr:generic_lang_akronym"/>
							</per_nc_altname_lang_akronym>
							<per_nc_altname_type_de>
								<xsl:value-of select="pr:act_nc_altname_type/pr:generic_nametype/pr:_standard/pr:de-DE"/>
							</per_nc_altname_type_de>
							<per_nc_altname_type_en>
								<xsl:value-of select="pr:act_nc_altname_type/pr:generic_nametype/pr:_standard/pr:en-US"/>
							</per_nc_altname_type_en>
						</xsl:element>
					</xsl:for-each>
				</xsl:element>
			</xsl:for-each>
			<per_person_gender_de>
				<xsl:value-of select="pr:act_nc_gender/pr:act_person_gender/pr:_standard/pr:de-DE"/>
			</per_person_gender_de>
			<per_person_gender_en>
				<xsl:value-of select="pr:act_nc_gender/pr:act_person_gender/pr:_standard/pr:en-US"/>
			</per_person_gender_en>
			<xsl:for-each select="pr:_nested__act__act_doc_biographical_note">
				<xsl:element name="act_short_bio">
					<per_doc_biographical_note_literal>
						<xsl:value-of select="pr:act__act_doc_biographical_note/pr:act_doc_biographical_note_literal"/>
					</per_doc_biographical_note_literal>
					<per_doc_biographical_note_akronym>
						<xsl:value-of select="pr:act__act_doc_biographical_note/pr:act_doc_biographical_note_lang/pr:generic_lang/pr:generic_lang_akronym"/>
					</per_doc_biographical_note_akronym>
					<per_doc_biographical_note_source_uuid>
						<xsl:value-of select="pr:act__act_doc_biographical_note/pr:act_doc_biographical_note_source/pr:generic_contributor/pr:_uuid"/>
					</per_doc_biographical_note_source_uuid>
				</xsl:element>
			</xsl:for-each>
			<per_nc_identifier_gnd>
				<!--<xsl:value-of select="pr:act_nc_identifier_gnd"/>-->
				<xsl:value-of select="substring-after($gnd,'https://d-nb.info/gnd/')"/>
			</per_nc_identifier_gnd>
			<generic_contributor_sari_gnd_uuid>
				<xsl:value-of select="pr:act_nc_identifier_gnd_prov/pr:generic_contributor/pr:generic_contributor_sari_uuid"/>
			</generic_contributor_sari_gnd_uuid>
			<per_nc_identifier_sikart>
				<!--<xsl:value-of select="pr:act_nc_identifier_sikart"/>-->
			<xsl:value-of select="substring-after($sikart,'http://www.sikart.ch/KuenstlerInnen.aspx?id=')"/>
			</per_nc_identifier_sikart>
			<generic_contributor_sari_sikart_uuid>
				<xsl:value-of select="pr:act_nc_identifier_sikart_prov/pr:generic_contributor/pr:generic_contributor_sari_uuid"/>
			</generic_contributor_sari_sikart_uuid>
			<per_nc_identifier_ulan>
				<!--<xsl:value-of select="pr:act_nc_identifier_ulan"/>-->
				<xsl:value-of select="substring-after($ulan,'http://vocab.getty.edu/ulan/')"/>
			</per_nc_identifier_ulan>
			<generic_contributor_sari_ulan_uuid>
				<xsl:value-of select="pr:act_nc_identifier_ulan_prov/pr:generic_contributor/pr:generic_contributor_sari_uuid"/>
			</generic_contributor_sari_ulan_uuid>
			<per_nc_identifier_wikidata>
				<!--<xsl:value-of select="pr:act_nc_identifier_wikidata"/>-->
				<xsl:value-of select="substring-after($wikidata,'https://www.wikidata.org/wiki/')"/>
			</per_nc_identifier_wikidata>
			<generic_contributor_sari_wikidata_uuid>
				<xsl:value-of select="pr:act_nc_identifier_wikidata__prov/pr:generic_contributor/pr:generic_contributor_sari_uuid"/>
			</generic_contributor_sari_wikidata_uuid>
			<per_exist_birth_place_uuid>
				<xsl:value-of select="pr:act_exist_birth_place/pr:pl/pr:_uuid"/>
			</per_exist_birth_place_uuid>
			<per_exist_birth_timespan_from>
				<xsl:choose>
					<xsl:when test="string-length(pr:act_exist_birth_timespan/pr:from) = 4">
						<xsl:value-of select="concat(pr:act_exist_birth_timespan/pr:from,'-01-01')"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="pr:act_exist_birth_timespan/pr:from"/>
					</xsl:otherwise>
				</xsl:choose>
			</per_exist_birth_timespan_from>
			<per_exist_birth_timespan_to>
				<xsl:choose>
					<xsl:when test="string-length(pr:act_exist_birth_timespan/pr:to) = 4">
						<xsl:value-of select="concat(pr:act_exist_birth_timespan/pr:to,'-01-01')"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="pr:act_exist_birth_timespan/pr:to"/>
					</xsl:otherwise>
				</xsl:choose>
			</per_exist_birth_timespan_to>
			<per_exist_death_place>
				<xsl:value-of select="pr:act_exist_death_place/pr:pl/pr:_uuid"/>
			</per_exist_death_place>
			<per_exist_death_timespan_from>
				<xsl:choose>
					<xsl:when test="string-length(pr:act_exist_death_timespan/pr:from) = 4">
						<xsl:value-of select="concat(pr:act_exist_death_timespan/pr:from,'-01-01')"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="pr:act_exist_death_timespan/pr:from"/>
					</xsl:otherwise>
				</xsl:choose>
			</per_exist_death_timespan_from>
			<per_exist_death_timespan_to>
				<xsl:choose>
					<xsl:when test="string-length(pr:act_exist_death_timespan/pr:from) = 4">
						<xsl:value-of select="concat(pr:act_exist_death_timespan/pr:from,'-01-01')"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="pr:act_exist_death_timespan/pr:from"/>
					</xsl:otherwise>
				</xsl:choose>
			</per_exist_death_timespan_to>
			<per_social_father_uuid>
				<xsl:value-of select="pr:act_social_father/pr:act/pr:_uuid"/>
			</per_social_father_uuid>
			<per_social_mother_uuid>
				<xsl:value-of select="pr:act_social_mother/pr:act/pr:_uuid"/>
			</per_social_mother_uuid>
			<xsl:for-each select="pr:_nested__act__act_social_national_affiliation">
				<xsl:element name="act_social_national_affiliation">
					<xsl:for-each select="pr:act__act_social_national_affiliation">
						<per_social_national_affiliation_uuid>
							<xsl:value-of select="pr:act_social_national_affiliation_nationality/pr:act_nat/pr:_uuid"/>
						</per_social_national_affiliation_uuid>
					</xsl:for-each>
				</xsl:element>
			</xsl:for-each>
		</entry>
	</xsl:template>
</xsl:stylesheet>
