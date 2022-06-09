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
	<xsl:variable name="cms" select="pr:_urls/pr:url[@type='easydb-id']" />
		<xsl:variable name="ulan" select="pr:act_nc_identifier_ulan_archive" />
		<xsl:variable name="wikidata" select="pr:act_nc_identifier_wikidata_archive" />
		<xsl:variable name="akl" select="pr:act_nc_identifier_akl_archive" />
		<xsl:variable name="morphe" select="pr:act_nc_identifier_morphe_archive" />
		<xsl:variable name="sikart" select="pr:act_nc_identifier_sikart_archive" />
		<xsl:variable name="hls" select="pr:act_nc_identifier_hls_archive" />
		<xsl:variable name="archinform" select="pr:act_nc_identifier_archinform_archive" />
		<xsl:variable name="fotoch" select="pr:act_nc_identifier_fotoch_archive" />
		<xsl:variable name="alat" select="pr:act_nc_identifier_alat_archive" />
		<xsl:variable name="gnd" select="pr:custom/pr:string[@name='conceptURI']" />
		<xsl:variable name="cidoc" select="pr:act_type_crm_uri" />
		
		<entry>
			<grp_type_crm_uri>
				<xsl:value-of select="substring-after($cidoc,'http://www.cidoc-crm.org/cidoc-crm/')"/>
			</grp_type_crm_uri>
			
			<grp_last_modified>
				<xsl:value-of select="pr:_last_modified"/>
			</grp_last_modified>
		<grp_identifiers>
				<_id>
					<xsl:value-of select="pr:_id"/>
				</_id>
				<grp_cms_id>
					<xsl:value-of select="substring-after($cms,'https://collections.gta.arch.ethz.ch/detail/')"/>
				</grp_cms_id>
				<grp_nc_identifier_ulan>
					<xsl:value-of select="substring-after($ulan,'http://vocab.getty.edu/ulan/')"/>
				</grp_nc_identifier_ulan>
				<grp_nc_identifier_wikidata>
					<xsl:value-of select="substring-after($wikidata,'https://www.wikidata.org/wiki/')"/>
				</grp_nc_identifier_wikidata>
				<grp_nc_identifier_akl>
					<xsl:value-of select="substring-before(substring-after($akl,'https://www.degruyter.com/database/AKL/entry/'),'/html')"/>
				</grp_nc_identifier_akl>
				<grp_nc_identifier_morphe>
					<xsl:value-of select="substring-after($morphe,'https://morphe.epfl.ch/index.php/')"/>
				</grp_nc_identifier_morphe>
				<grp_nc_identifier_sikart>
					<xsl:value-of select="substring-after($sikart,'http://www.sikart.ch/kuenstlerinnen.aspx?id=')"/>
				</grp_nc_identifier_sikart>
				<grp_nc_identifier_hls>	
					<xsl:value-of select="substring-before(substring-after($hls,'https://hls-dhs-dss.ch/de/articles/'),'/')"/>
				</grp_nc_identifier_hls>
				<grp_nc_identifier_archinform>
					<xsl:value-of select="substring-before(substring-after($archinform,'https://deu.archinform.net/arch/'),'.htm')"/>
				</grp_nc_identifier_archinform>
				<grp_nc_identifier_fotoch>
					<xsl:value-of select="substring-after($fotoch,'https://www.foto-ch.ch/?a=fotograph&amp;id=')"/>
				</grp_nc_identifier_fotoch>
				<grp_nc_identifier_alat>
					<xsl:value-of select="substring-before(substring-after($alat,'http://www.architektenlexikon.at/de/'),'.htm')"/>
				</grp_nc_identifier_alat>
				<per_nc_identifier_gnd>
					<xsl:value-of select="substring-after($gnd,'https://d-nb.info/gnd/')"/>
				</per_nc_identifier_gnd>
			</grp_identifiers>
			
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
										<xsl:value-of select="concat(pr:act_nc_altname_timespan_archive/pr:to,'-12-31')"/>
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
			<grp_nc_honname>
				<xsl:value-of select="pr:act_nc_honname_archive"/>
			</grp_nc_honname>
			<grp_nc_honname_lang_akronym>
				<xsl:value-of select="pr:act_nc_honname_lang_archive/pr:generic_lang/pr:generic_lang_akronym"/>
			</grp_nc_honname_lang_akronym>
			
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
						<xsl:value-of select="concat(pr:grp_exist_formation_date_archive/pr:to,'-12-31')"/>
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
						<xsl:value-of select="concat(pr:grp_exist_dissolution_date_archive/pr:to,'-12-31')"/>
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
			<grp_short_bio>
				<xsl:element name="DE">
					<xsl:value-of select="pr:act_doc_biographical_note_archives/pr:de-DE"/>
				</xsl:element>
				<xsl:element name="EN">
					<xsl:value-of select="pr:act_doc_biographical_note_archives/pr:en-US"/>
				</xsl:element>
			</grp_short_bio>
			<grp_long_bio>
				<xsl:element name="DE">
					<xsl:value-of select="pr:act_doc_biographical_note_long_archives/pr:de-DE"/>
				</xsl:element>
				<xsl:element name="EN">
					<xsl:value-of select="pr:act_doc_biographical_note_long_archives/pr:en-US"/>
				</xsl:element>
			</grp_long_bio>
			
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
								<xsl:value-of select="concat(pr:act__act_activity_floruit_archive/pr:act_activity_floruit_timespan_archive/pr:from,'-01-01')"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="pr:act__act_activity_floruit/pr:act_activity_floruit_timespan_archive/pr:from"/>
							</xsl:otherwise>
						</xsl:choose>
					</grp_activity_floruit_time-span_from>
					<grp_activity_floruit_time-span_to>
						<xsl:choose>
							<xsl:when test="string-length(pr:act__act_activity_floruit_archive/pr:act_activity_floruit_timespan_archive/pr:to) = 4">
								<xsl:value-of select="concat(pr:act__act_activity_floruit_archive/pr:act_activity_floruit_timespan_archive/pr:to,'-12-31')"/>
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
			
				</xsl:for-each>
			</xsl:element>
		</entry>
	</xsl:template>
</xsl:stylesheet>
