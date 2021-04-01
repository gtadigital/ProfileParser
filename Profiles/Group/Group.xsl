<?xml version="1.0" encoding="UTF-8"?>
<!-- author: ETH Zurich, gta digital, Matteo Lorenzini, Zoe Reinke -->
<!-- license: please refer to the license.txt file in our git repository (https://github.com/gtadigital/XSLT) -->
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:pr="https://schema.easydb.de/EASYDB/1.0/objects/" exclude-result-prefixes="pr">
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
			<act_system_object_id>
				<xsl:value-of select="pr:_system_object_id"/>
			</act_system_object_id>
			<act_last_modified>
				<xsl:value-of select="pr:act_last_modified"/>
			</act_last_modified>
			<_uuid>
				<xsl:value-of select="pr:_uuid"/>
			</_uuid>
			<act_nc_name>
				<xsl:value-of select="pr:act_nc_name"/>
			</act_nc_name>
			<act_nc_name_lang_akronym>
				<xsl:value-of select="pr:act_nc_name_lang/pr:generic_lang/pr:generic_lang_akronym"/>
			</act_nc_name_lang_akronym>
			<xsl:for-each select="pr:_nested__act__act_nc_altname">
				<xsl:element name="act_altName">
					<xsl:for-each select="pr:act__act_nc_altname">
						<xsl:element name="act_alt_nameLiteral">
							<act_nc_altname_literal>
								<xsl:value-of select="pr:act_nc_altname_literal"/>
							</act_nc_altname_literal>
							<act_nc_altname_lang_akronym>
								<xsl:value-of select="pr:act_nc_altname_lang/pr:generic_lang/pr:generic_lang_akronym"/>
							</act_nc_altname_lang_akronym>
							<act_nc_altname_type_de>
								<xsl:value-of select="pr:act_nc_altname_type/pr:generic_nametype/pr:generic_nametype_name/pr:de-DE"/>
							</act_nc_altname_type_de>
							<act_nc_altname_type_en>
								<xsl:value-of select="pr:act_nc_altname_type/pr:generic_nametype/pr:generic_nametype_name/pr:en-US"/>
							</act_nc_altname_type_en>
							<act_nc_altname_timespan_from>
								<xsl:choose>
									<xsl:when test="string-length(pr:act_nc_altname_timespan/pr:from) = 4">
										<xsl:value-of select="concat(pr:act_nc_altname_timespan/pr:from,'-01-01')"/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="pr:act_nc_altname_timespan/pr:from"/>
									</xsl:otherwise>
								</xsl:choose>
							</act_nc_altname_timespan_from>
							<act_nc_altname_timespan_to>
								<xsl:choose>
									<xsl:when test="string-length(pr:act_nc_altname_timespan/pr:to) = 4">
										<xsl:value-of select="concat(pr:act_nc_altname_timespan/pr:to,'-01-01')"/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="pr:act_nc_altname_timespan/pr:to"/>
									</xsl:otherwise>
								</xsl:choose>
							</act_nc_altname_timespan_to>
						</xsl:element>
					</xsl:for-each>
				</xsl:element>
			</xsl:for-each>
			<grp_formation_place>
				<xsl:value-of select="pr:grp_exist_formation_place/pr:pl/pr:_uuid"/>
			</grp_formation_place>
			<grp_formation_timespan_from>
				<xsl:choose>
					<xsl:when test="string-length(pr:grp_exist_formation_date/pr:from) = 4">
						<xsl:value-of select="concat(pr:grp_exist_formation_date/pr:from,'-01-01')"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="pr:grp_exist_formation_date/pr:from"/>
					</xsl:otherwise>
				</xsl:choose>
			</grp_formation_timespan_from>
			<grp_formation_timespan_to>
				<xsl:choose>
					<xsl:when test="string-length(pr:grp_exist_formation_date/pr:to) = 4">
						<xsl:value-of select="concat(pr:grp_exist_formation_date/pr:to,'-01-01')"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="pr:grp_exist_formation_date/pr:to"/>
					</xsl:otherwise>
				</xsl:choose>
			</grp_formation_timespan_to>
			<grp_dissolution_place>
				<xsl:value-of select="pr:grp_exist_dissolution_place/pr:pl/pr:_uuid"/>
			</grp_dissolution_place>
			<grp_dissolution_time_span_from>
				<xsl:choose>
					<xsl:when test="string-length(pr:grp_exist_dissolution_date/pr:from) = 4">
						<xsl:value-of select="concat(pr:grp_exist_dissolution_date/pr:from,'-01-01')"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="pr:grp_exist_dissolution_date/pr:from"/>
					</xsl:otherwise>
				</xsl:choose>
			</grp_dissolution_time_span_from>
			<grp_dissolution_time_span_to>
				<xsl:choose>
					<xsl:when test="string-length(pr:grp_exist_dissolution_date/pr:to) = 4">
						<xsl:value-of select="concat(pr:grp_exist_dissolution_date/pr:to,'-01-01')"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="pr:grp_exist_dissolution_date/pr:to"/>
					</xsl:otherwise>
				</xsl:choose>
			</grp_dissolution_time_span_to>
			<xsl:for-each select="pr:_nested__act__grp_loc_locations">
				<xsl:element name="grp_loc_places">
					<grp_location_place>
						<xsl:value-of select="pr:act__grp_loc_locations/pr:grp_loc_location/pr:pl/pr:_uuid"/>
					</grp_location_place>
				</xsl:element>
			</xsl:for-each>
			<xsl:for-each select="pr:_nested__act__act_doc_biographical_note">
				<xsl:element name="act_short_bio">
					<act_doc_biographical_note_literal>
						<xsl:value-of select="pr:act__act_doc_biographical_note/pr:act_doc_biographical_note_literal"/>
					</act_doc_biographical_note_literal>
					<act_doc_biographical_note_akronym>
						<xsl:value-of select="pr:act__act_doc_biographical_note/pr:act_doc_biographical_note_lang/pr:generic_lang/pr:generic_lang_akronym"/>
					</act_doc_biographical_note_akronym>
					<act_doc_biographical_note_source_uuid>
						<xsl:value-of select="pr:act__act_doc_biographical_note/pr:act_doc_biographical_note_source/pr:generic_contributor/pr:_uuid"/>
					</act_doc_biographical_note_source_uuid>
				</xsl:element>
			</xsl:for-each>
			<xsl:element name="gnd_identifiers">
				<act_nc_identifier_gnd_1>
					<xsl:value-of select="pr:act_nc_identifier_gnd"/>
				</act_nc_identifier_gnd_1>
				<act_nc_identifier_gnd_2>
					<xsl:value-of select="pr:custom/pr:string[position() = 2]"/>
				</act_nc_identifier_gnd_2>
			</xsl:element>
			<act_nc_identifier_ulan>
				<xsl:value-of select="pr:act_nc_identifier_ulan"/>
			</act_nc_identifier_ulan>
			<xsl:element name="wikidata_identifiers">
				<act_nc_identifier_wikidata_1>
					<xsl:value-of select="pr:act_nc_identifier_wikidata"/>
				</act_nc_identifier_wikidata_1>
				<act_nc_identifier_wikidata_2>
					<xsl:value-of select="pr:act_nc_identifier_wikidata__v2"/>
				</act_nc_identifier_wikidata_2>
			</xsl:element>
			<act_nc_identifier_akl>
				<xsl:value-of select="pr:act_nc_identifier_akl"/>
			</act_nc_identifier_akl>
			<act_nc_identifier_ulan>
				<xsl:value-of select="pr:act_nc_identifier_ulan"/>
			</act_nc_identifier_ulan>
			<xsl:element name="hls_identifier">
				<act_nc_nc_identifier_hls_1>
					<xsl:value-of select="pr:act_nc_nc_identifier_hls"/>
				</act_nc_nc_identifier_hls_1>
				<act_nc_nc_identifier_hls_2>
					<xsl:value-of select="pr:act_nc_identifier_hls_v2"/>
				</act_nc_nc_identifier_hls_2>
			</xsl:element>
			<xsl:element name="sikart_identifier">
				<act_nc_identifier_sikart_1>
					<xsl:value-of select="pr:act_nc_identifier_sikart"/>
				</act_nc_identifier_sikart_1>
				<act_nc_identifier_sikart_2>
					<xsl:value-of select="pr:act_nc_identifier_sikart_v2"/>
				</act_nc_identifier_sikart_2>
			</xsl:element>
			<xsl:element name="archinform_identifier">
				<act_nc_identifier_archinform_1>
					<xsl:value-of select="pr:act_nc_identifier_archinform"/>
				</act_nc_identifier_archinform_1>
				<act_nc_identifier_archinform_2>
					<xsl:value-of select="pr:act_nc_identifier_archinform_v2"/>
				</act_nc_identifier_archinform_2>
			</xsl:element>
			<xsl:element name="alat_identifier">
				<act_nc_identifier_alat_1>
					<xsl:value-of select="pr:act_nc_identifier_alat"/>
				</act_nc_identifier_alat_1>
				<act_nc_identifier_alat_2>
					<xsl:value-of select="pr:act_nc_identifier_alat_v2"/>
				</act_nc_identifier_alat_2>
			</xsl:element>
			<xsl:element name="fotoch_identifier">
				<act_nc_identifier_fotoch_1>
					<xsl:value-of select="pr:act_nc_identifier_fotoch"/>
				</act_nc_identifier_fotoch_1>
				<act_nc_identifier_fotoch_2>
					<xsl:value-of select="pr:act_nc_identifier_fotoch_v2"/>
				</act_nc_identifier_fotoch_2>
			</xsl:element>
			<xsl:for-each select="pr:_nested__act__act_social_national_affiliation">
				<xsl:element name="act_social_national_affiliation">
					<xsl:for-each select="pr:act__act_social_national_affiliation">
						<act_social_national_affiliation_uuid>
							<xsl:value-of select="pr:act_social_national_affiliation_nationality/pr:act_nat/pr:_uuid"/>
						</act_social_national_affiliation_uuid>
					</xsl:for-each>
				</xsl:element>
			</xsl:for-each>
			<!--
			<xsl:for-each select="pr:_nested__act__grp_social_founding_members">
			<xsl:element name="">
			</xsl:element>
			</xsl:for-each>
			-->
			<xsl:for-each select="pr:_nested__act__grp_social_national_affiliation">
				<xsl:element name="act_nat_uuid">
					<act_national_affiliation>
						<xsl:value-of select="pr:act__grp_social_national_affiliation/pr:act_social_national_affiliation_nationality/pr:act_nat/pr:act_nat_uuid"/>
					</act_national_affiliation>
				</xsl:element>
			</xsl:for-each>
			<xsl:for-each select="pr:_nested__act__act_activity_floruit">
				<xsl:element name="actor_activity_floruit">
					<act_activity_floruit_place>
						<xsl:value-of select="pr:act__act_activity_floruit/pr:act_activity_floruit_place/pr:pl/pr:_uuid"/>
					</act_activity_floruit_place>
					<act_activity_floruit_time-span_from>
						<xsl:choose>
							<xsl:when test="string-length(pr:act__act_activity_floruit/pr:act_activity_floruit_timespan/pr:from) = 4">
								<xsl:value-of select="concat(pr:act__act_activity_floruit/pr:act_activity_floruit_timespan/pr:from,'-1-1')"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="pr:act__act_activity_floruit/pr:act_activity_floruit_timespan/pr:from"/>
							</xsl:otherwise>
						</xsl:choose>
					</act_activity_floruit_time-span_from>
					<act_activity_floruit_time-span_to>
						<xsl:choose>
							<xsl:when test="string-length(pr:act__act_activity_floruit/pr:act_activity_floruit_timespan/pr:to) = 4">
								<xsl:value-of select="concat(pr:act__act_activity_floruit/pr:act_activity_floruit_timespan/pr:to,'-1-1')"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="pr:act__act_activity_floruit/pr:act_activity_floruit_timespan/pr:to"/>
							</xsl:otherwise>
						</xsl:choose>
					</act_activity_floruit_time-span_to>
				</xsl:element>
			</xsl:for-each>
			<xsl:for-each select="pr:_nested__act__act_activity_occupations">
				<xsl:element name="act_occupations">
					<act_activity_occupation_de>
						<xsl:value-of select="pr:act__act_activity_occupations/pr:act_activity_occupation/pr:act_occ/pr:_standard/pr:de-DE"/>
					</act_activity_occupation_de>
					<act_activity_occupation_en>
						<xsl:value-of select="pr:act__act_activity_occupations/pr:act_activity_occupation/pr:act_occ/pr:_standard/pr:en-US"/>
					</act_activity_occupation_en>
					<act_activity_occupation_uuid>
						<xsl:value-of select="pr:act__act_activity_occupations/pr:act_activity_occupation/pr:act_occ/pr:_uuid"/>
					</act_activity_occupation_uuid>
					<act_activity_occupation_aat>
						<xsl:value-of select="pr:act__act_activity_occupations/pr:act_activity_occupation/pr:act_occ/pr:custom/pr:string"/>
					</act_activity_occupation_aat>
				</xsl:element>
			</xsl:for-each>
		</entry>
	</xsl:template>
</xsl:stylesheet>
