<?xml version="1.0" encoding="UTF-8"?>
<!-- author: ETH Zurich, gta digital, Matteo Lorenzini	 -->
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
			
			<grp_last_modified>
				<xsl:value-of select="pr:_last_modified"/>
			</grp_last_modified>
			
			<grp_id>
				<xsl:value-of select="pr:_id"/>
			</grp_id>
			<grp_nc_name>
				<xsl:value-of select="pr:act_nc_name_archive"/>
			</grp_nc_name>
			<grp_nc_name_lang_akronym>
				<xsl:value-of select="pr:act_nc_name_lang_archive/pr:generic_lang/pr:generic_lang_akronym"/>
			</grp_nc_name_lang_akronym>
			<xsl:for-each select="pr:_nested__act__act_nc_altname_archive">
				<xsl:element name="act_altName">
					<xsl:for-each select="pr:act__act_nc_altname_archive">
						<xsl:element name="act_alt_nameLiteral">
							<grp_nc_altname_literal>
								<xsl:value-of select="pr:act_nc_altname_literal_archive"/>
							</grp_nc_altname_literal>
							<grp_nc_altname_lang_akronym>
								<xsl:value-of select="pr:act_nc_altname_lang_archive/pr:generic_lang/pr:generic_lang_akronym"/>
							</grp_nc_altname_lang_akronym>
							<grp_nc_altname_type_de>
								<xsl:value-of select="pr:act_nc_altname_type_archive/pr:generic_nametype/pr:generic_nametype_name/pr:de-DE"/>
							</grp_nc_altname_type_de>
							<grp_nc_altname_type_en>
								<xsl:value-of select="pr:act_nc_altname_type_archive/pr:generic_nametype/pr:generic_nametype_name/pr:en-US"/>
							</grp_nc_altname_type_en>
							<grp_nc_altname_timespan_from>
								<xsl:choose>
									<xsl:when test="string-length(pr:act_nc_altname_timespan_archive/pr:from) = 4">
										<xsl:value-of select="concat(pr:act_nc_altname_timespan_archive/pr:from,'-01-01')"/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="pr:act_nc_altname_timespan_archive/pr:from"/>
									</xsl:otherwise>
								</xsl:choose>
							</grp_nc_altname_timespan_from>
							<grp_nc_altname_timespan_to>
								<xsl:choose>
									<xsl:when test="string-length(pr:act_nc_altname_timespan_archive/pr:to) = 4">
										<xsl:value-of select="concat(pr:act_nc_altname_timespan_archive/pr:to,'-01-01')"/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="pr:act_nc_altname_timespan_archive/pr:to"/>
									</xsl:otherwise>
								</xsl:choose>
							</grp_nc_altname_timespan_to>
						</xsl:element>
					</xsl:for-each>
				</xsl:element>
			</xsl:for-each>
			<grp_formation_place>
				<xsl:value-of select="pr:grp_exist_formation_place_archive/pr:pl/pr:_id"/>
			</grp_formation_place>
			<grp_formation_timespan_from>
				<xsl:choose>
					<xsl:when test="string-length(pr:grp_exist_formation_date_archive/pr:from) = 4">
						<xsl:value-of select="concat(pr:grp_exist_formation_date_archive/pr:from,'-01-01')"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="pr:grp_exist_formation_date_archive/pr:from"/>
					</xsl:otherwise>
				</xsl:choose>
			</grp_formation_timespan_from>
			<grp_formation_timespan_to>
				<xsl:choose>
					<xsl:when test="string-length(pr:grp_exist_formation_date_archive/pr:to) = 4">
						<xsl:value-of select="concat(pr:grp_exist_formation_date_archive/pr:to,'-01-01')"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="pr:grp_exist_formation_date_archive/pr:to"/>
					</xsl:otherwise>
				</xsl:choose>
			</grp_formation_timespan_to>
			<grp_dissolution_place>
				<xsl:value-of select="pr:grp_exist_dissolution_place_archive/pr:pl/pr:_id"/>
			</grp_dissolution_place>
			<grp_dissolution_time_span_from>
				<xsl:choose>
					<xsl:when test="string-length(pr:grp_exist_dissolution_date_archive/pr:from) = 4">
						<xsl:value-of select="concat(pr:grp_exist_dissolution_date_archive/pr:from,'-01-01')"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="pr:grp_exist_dissolution_date_archive/pr:from"/>
					</xsl:otherwise>
				</xsl:choose>
			</grp_dissolution_time_span_from>
			<grp_dissolution_time_span_to>
				<xsl:choose>
					<xsl:when test="string-length(pr:grp_exist_dissolution_date_archive/pr:to) = 4">
						<xsl:value-of select="concat(pr:grp_exist_dissolution_date_archive/pr:to,'-01-01')"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="pr:grp_exist_dissolution_date_archive/pr:to"/>
					</xsl:otherwise>
				</xsl:choose>
			</grp_dissolution_time_span_to>
			<xsl:for-each select="pr:_nested__act__grp_loc_locations_archive">
				<xsl:element name="grp_loc_places">
					<grp_location_place>
						<xsl:value-of select="pr:act__grp_loc_locations_archive/pr:grp_loc_location_archive/pr:pl/pr:_id"/>
					</grp_location_place>
				</xsl:element>
			</xsl:for-each>
			<xsl:for-each select="pr:_nested__act__act_nc_altname_archive/pr:act__act_nc_altname_archive/pr:act_nc_altname_usedby_archive/pr:act/pr:_nested__act__act_doc_biographical_note/pr:act__act_doc_biographical_note">
				<xsl:element name="act_short_bio">
					<grp_doc_biographical_note_literal>
						<xsl:value-of select="pr:act_doc_biographical_note_literal"/>
					</grp_doc_biographical_note_literal>
				</xsl:element>
			</xsl:for-each>
			
			<xsl:element name="gnd_identifiers">
				<grp_nc_identifier_gnd_1>
					<xsl:value-of select="pr:act_nc_identifier_gnd"/>
				</grp_nc_identifier_gnd_1>
				<grp_nc_identifier_gnd_2>
					<xsl:value-of select="pr:custom/pr:string[position() = 2]"/>
				</grp_nc_identifier_gnd_2>
			</xsl:element>
			<grp_nc_identifier_ulan>
				<xsl:value-of select="pr:act_nc_identifier_ulan_archive"/>
			</grp_nc_identifier_ulan>
			<xsl:element name="wikidata_identifiers">
				<grp_nc_identifier_wikidata_1>
					<xsl:value-of select="pr:act_nc_identifier_wikidata_archive"/>
				</grp_nc_identifier_wikidata_1>
				<grp_nc_identifier_wikidata_2>
					<xsl:value-of select="pr:act_nc_identifier_wikidata__v2"/>
				</grp_nc_identifier_wikidata_2>
			</xsl:element>
			<grp_nc_identifier_akl>
				<xsl:value-of select="pr:act_nc_identifier_akl_archive"/>
			</grp_nc_identifier_akl>
			<grp_nc_identifier_ulan>
				<xsl:value-of select="pr:act_nc_identifier_ulan_archive"/>
			</grp_nc_identifier_ulan>
			<xsl:element name="hls_identifier">
				<grp_nc_nc_identifier_hls_1>
					<xsl:value-of select="pr:act_nc_nc_identifier_hls_archive"/>
				</grp_nc_nc_identifier_hls_1>
				<grp_nc_nc_identifier_hls_2>
					<xsl:value-of select="pr:act_nc_identifier_hls_v2"/>
				</grp_nc_nc_identifier_hls_2>
			</xsl:element>
			<xsl:element name="sikart_identifier">
				<grp_nc_identifier_sikart_1>
					<xsl:value-of select="pr:act_nc_identifier_sikart_archive"/>
				</grp_nc_identifier_sikart_1>
				<grp_nc_identifier_sikart_2>
					<xsl:value-of select="pr:act_nc_identifier_sikart_v2"/>
				</grp_nc_identifier_sikart_2>
			</xsl:element>
			<xsl:element name="archinform_identifier">
				<grp_nc_identifier_archinform_1>
					<xsl:value-of select="pr:act_nc_identifier_archinform_archive"/>
				</grp_nc_identifier_archinform_1>
				<grp_nc_identifier_archinform_2>
					<xsl:value-of select="pr:act_nc_identifier_archinform_v2"/>
				</grp_nc_identifier_archinform_2>
			</xsl:element>
			<xsl:element name="alat_identifier">
				<grp_nc_identifier_alat_1>
					<xsl:value-of select="pr:act_nc_identifier_alat_archive"/>
				</grp_nc_identifier_alat_1>
				<grp_nc_identifier_alat_2>
					<xsl:value-of select="pr:act_nc_identifier_alat_v2"/>
				</grp_nc_identifier_alat_2>
			</xsl:element>
			<xsl:element name="fotoch_identifier">
				<grp_nc_identifier_fotoch_1>
					<xsl:value-of select="pr:act_nc_identifier_fotoch_archive"/>
				</grp_nc_identifier_fotoch_1>
				<grp_nc_identifier_fotoch_2>
					<xsl:value-of select="pr:act_nc_identifier_fotoch_v2"/>
				</grp_nc_identifier_fotoch_2>
			</xsl:element>
			
			<xsl:for-each select="pr:_nested__act__grp_exist_formation_from_archive/pr:act__grp_exist_formation_from_archive/pr:grp_exist_formation_from_group_archive/pr:act/pr:_nested__act__act_social_national_affiliation/pr:act__act_social_national_affiliation/pr:act_social_national_affiliation_nationality/pr:act_nat">
				<xsl:element name="act_social_national_affiliation">
					<grp_social_national_affiliation_id>
						<xsl:value-of select="pr:_id"/>
					</grp_social_national_affiliation_id>
				</xsl:element>
			</xsl:for-each>
			
			<xsl:element name="grp_foundation_member">
				<xsl:for-each select="pr:_nested__act__grp_social_founding_members_archive/pr:act__grp_social_founding_members_archive/pr:grp_social_founding_member_archive/pr:act">
			
					<grp_foundation_member_id>
						<xsl:value-of select="pr:_id"/>
					</grp_foundation_member_id>
			
				</xsl:for-each>
			</xsl:element>
			<xsl:element name="act_nat_id">
			<xsl:for-each select="pr:_nested__act__grp_social_national_affiliation_archive">
				
					<grp_national_affiliation>
						<xsl:value-of select="pr:act__grp_social_national_affiliation_archive/pr:act_social_national_affiliation_nationality_archive/pr:act_nat/pr:_id"/>
					</grp_national_affiliation>
				
			</xsl:for-each>
			</xsl:element>
			<xsl:element name="actor_activity_floruit">
			<xsl:for-each select="pr:_nested__act__act_activity_floruit_archive">
				
					<grp_activity_floruit_place>
						<xsl:value-of select="pr:act__act_activity_floruit_archive/pr:act_activity_floruit_place_archive/pr:pl/pr:_id"/>
					</grp_activity_floruit_place>
					<grp_activity_floruit_time-span_from>
						<xsl:choose>
							<xsl:when test="string-length(pr:act__act_activity_floruit_archive/pr:act_activity_floruit_timespan_archive/pr:from) = 4">
								<xsl:value-of select="concat(pr:act__act_activity_floruit_archive/pr:act_activity_floruit_timespan_archive/pr:from,'-1-1')"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="pr:act__act_activity_floruit/pr:act_activity_floruit_timespan_archive/pr:from"/>
							</xsl:otherwise>
						</xsl:choose>
					</grp_activity_floruit_time-span_from>
					<grp_activity_floruit_time-span_to>
						<xsl:choose>
							<xsl:when test="string-length(pr:act__act_activity_floruit_archive/pr:act_activity_floruit_timespan_archive/pr:to) = 4">
								<xsl:value-of select="concat(pr:act__act_activity_floruit_archive/pr:act_activity_floruit_timespan_archive/pr:to,'-1-1')"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="pr:act__act_activity_floruit_archive/pr:act_activity_floruit_timespan_archive/pr:to"/>
							</xsl:otherwise>
						</xsl:choose>
					</grp_activity_floruit_time-span_to>
				
			</xsl:for-each>
			</xsl:element>
			<xsl:element name="act_occupations">
			<xsl:for-each select="pr:_nested__act__grp_exist_formation_from_archive/pr:act__grp_exist_formation_from_archive/pr:grp_exist_formation_from_group_archive/pr:act/pr:_nested__act__act_activity_occupations/pr:act__act_activity_occupations/pr:act_activity_occupation">
				
					<grp_activity_occupation_de>
						<xsl:value-of select="pr:act_occ/pr:_standard/pr:de-DE"/>
					</grp_activity_occupation_de>
					<grp_activity_occupation_en>
						<xsl:value-of select="pr:act_occ/pr:_standard/pr:en-US"/>
					</grp_activity_occupation_en>
					<grp_activity_occupation_id>
						<xsl:value-of select="pr:act_occ/pr:_id"/>
					</grp_activity_occupation_id>
					<grp_activity_occupation_aat>
						<xsl:value-of select="pr:act_activity_occupation/pr:act_occ/pr:custom/pr:string"/>
					</grp_activity_occupation_aat>
				
			</xsl:for-each>
			</xsl:element>
		</entry>
	</xsl:template>
</xsl:stylesheet>
