<?xml version="1.0" encoding="UTF-8"?>
<!-- author: ETH Zurich, gta digital, Matteo Lorenzini -->
<!-- license: please refer to the license.txt file in our git repository (https://github.com/gtadigital/XSLT) -->
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:pr="https://schema.easydb.de/EASYDB/1.0/objects/"
                exclude-result-prefixes="pr">
	<xsl:output method="xml"
	            indent="yes"
	            encoding="UTF-8"/>
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
	<xsl:template match="pr:objects/pr:oeu">
		<entry>
			<!-- UUID -->
			<oeu_nc_uuid>
				<xsl:value-of select="pr:_uuid"/>
			</oeu_nc_uuid>
			<!-- MODIFICATION -->
			<oeu_nc_last_modified>
				<xsl:value-of select="pr:_last_modified"/>
			</oeu_nc_last_modified>
			<!-- TAG -->
			<xsl:element name="oeu_tag_name">
				<oeu_nc_tag_de>
					<xsl:value-of select="pr:tags/pr:tag[2]/pr:name/pr:de-DE"/>
				</oeu_nc_tag_de>
				<oeu_nc_tag_en>
					<xsl:value-of select="pr:tags/pr:tag[2]/pr:name/pr:en-US"/>
				</oeu_nc_tag_en>
			</xsl:element>
			<!--  BUILT APPELLATION -->
			<xsl:element name="oeu_nc_preferred_built_work_name">
				<oeu_nc_name_de>
					<xsl:value-of select="pr:oeu_nc_name/pr:de-DE"/>
				</oeu_nc_name_de>
				<oeu_nc_name_en>
					<xsl:value-of select="pr:oeu_nc_name/pr:en-US"/>
				</oeu_nc_name_en>
			</xsl:element>
			<!--  BUILT WORK ALTERNATIVE NAME -->
			<xsl:element name="oeu_nc_alternative_built_work_name">
				<xsl:for-each select="pr:_nested__oeu__oeu_archive_nc_alt_name/pr:oeu__oeu_archive_nc_alt_name">
					<oeu_nc_altname_literal>
						<xsl:value-of select="pr:oeu_archive_nc_alt_name_literal"/>
					</oeu_nc_altname_literal>
					<xsl:element name="oeu_alt_name_lan">
						<oeu_nc_archive_alt_name_lang_de>
							<xsl:value-of select="pr:oeu_archive_nc_alt_name_lang/pr:generic_lang/pr:_standard/pr:de-DE"/>
						</oeu_nc_archive_alt_name_lang_de>
						<oeu_nc_archive_alt_name_lang_en>
							<xsl:value-of select="pr:oeu_archive_nc_alt_name_lang/pr:generic_lang/pr:_standard/pr:en-US"/>
						</oeu_nc_archive_alt_name_lang_en>
						<oeu_nc_archive_alt_name_lang_it>
							<xsl:value-of select="pr:oeu_archive_nc_alt_name_lang/pr:generic_lang/pr:_standard/pr:it-IT"/>
						</oeu_nc_archive_alt_name_lang_it>
						<oeu_nc_archive_alt_name_lang_fr>
							<xsl:value-of select="pr:oeu_archive_nc_alt_name_lang/pr:generic_lang/pr:_standard/pr:fr-FR"/>
						</oeu_nc_archive_alt_name_lang_fr>
					</xsl:element>
					<oeu_nc_altname_used_uuid>
						<xsl:value-of select="pr:oeu_archive_nc_alt_name_used_by/pr:act/pr:_uuid"/>
					</oeu_nc_altname_used_uuid>
					<oeu_nc_name_used_timespan_from>
						<xsl:value-of select="pr:oeu_archive_nc_alt_name_used_timespan/pr:from"/>
					</oeu_nc_name_used_timespan_from>
					<oeu_nc_name_used_timespan_to>
						<xsl:value-of select="pr:oeu_archive_nc_alt_name_used_timespan/pr:to"/>
					</oeu_nc_name_used_timespan_to>
				</xsl:for-each>
			</xsl:element>
			<!-- IDENTIFIER -->
			<xsl:element name="oeu__oeu_nc_identifier">
				<xsl:for-each select="pr:_nested__oeu__oeu_nc_identifier/pr:oeu__oeu_nc_identifier">
					<oeu_nc_identifier_literal>
						<xsl:value-of select="pr:oeu_nc_identifier_literal"/>
					</oeu_nc_identifier_literal>
					<xsl:for-each select="pr:oeu_nc_identifier_type/pr:generic_identifier_type/pr:_path/pr:generic_identifier_type[2]">
						<xsl:element name="oeu_generic_identifier_type">
							<oeu_nc_generic_identifier_type_uuid>
								<xsl:value-of select="pr:_uuid"/>
							</oeu_nc_generic_identifier_type_uuid>
						</xsl:element>
						<xsl:element name="oeu_generic_identifier_type_name">
							<oeu_nc_generic_identifier_type_name>
								<xsl:value-of select="pr:_standard/pr:en-US"/>
							</oeu_nc_generic_identifier_type_name>
						</xsl:element>
					</xsl:for-each>
					<oeu_nc_identifier_usedby_uuid>
						<xsl:value-of select="pr:oeu_nc_identifier_usedby/pr:act/pr:_uuid"/>
					</oeu_nc_identifier_usedby_uuid>
				</xsl:for-each>
			</xsl:element>
			<!-- ACTOR RELATION-->
			<xsl:element name="oeu_nc_actor_relation">
				<xsl:for-each select="pr:_nested__oeu__oeu_archive_ar_creation/pr:oeu__oeu_archive_ar_creation">
					<xsl:element name="oeu_nc_actor">
						<oeu_nc_actor_uuid>
							<xsl:value-of select="pr:oeu_archive_ar_creation_actor/pr:act/pr:_uuid"/>
						</oeu_nc_actor_uuid>
						<oeu_nc_actor_type>
							<xsl:value-of select="pr:oeu_archive_ar_creation_actor/pr:act/pr:act_type_crm/pr:act_type_crm/pr:_standard/pr:de-DE"/>
						</oeu_nc_actor_type>
						<oeu_nc_act_role_uuid>
							<xsl:value-of select="pr:oeu_archive_ar_creation_actor_role/pr:act_role/pr:_uuid"/>
						</oeu_nc_act_role_uuid>
					</xsl:element>
				</xsl:for-each>
			</xsl:element>
			<!-- DESCRIPTION -->
			<xsl:element name="oeu_nc_description">
				<xsl:element name="oeu_nc_description_scientific">
					<oeu_nc_description_scientific_de>
						<xsl:value-of select="pr:oeu_descr_description_scientificcomment/pr:de-DE"/>
					</oeu_nc_description_scientific_de>
					<oeu_nc_description_scientific_en>
						<xsl:value-of select="pr:oeu_descr_description_scientificcomment/pr:en-US"/>
					</oeu_nc_description_scientific_en>
				</xsl:element>
				<xsl:element name="oeu_nc_description">
					<oeu_nc_description_de>
						<xsl:value-of select="pr:oeu_descr_description_descr/pr:de-DE"/>
					</oeu_nc_description_de>
					<oeu_nc_description_en>
						<xsl:value-of select="pr:oeu_descr_description_descr/pr:en-US"/>
					</oeu_nc_description_en>
				</xsl:element>
			</xsl:element>
			<!-- BIBLIOGRAPHIC ITEM -->
			<xsl:element name="oeu_nc_bibliographic_item">
				<xsl:for-each select="pr:_nested__oeu__oeu_archive_doc_citation/pr:oeu__oeu_archive_doc_citation">
					<xsl:element name="citation">
						<oeu_nc_bibliographic_item_uuid>
							<xsl:value-of select="pr:oeu_archive_doc_citation_bi/pr:bi/pr:_uuid"/>
						</oeu_nc_bibliographic_item_uuid>
						<oeu_nc_citation_page>
							<xsl:value-of select="pr:oeu_archive_doc_citation_bi_page"/>
						</oeu_nc_citation_page>
					</xsl:element>
				</xsl:for-each>
			</xsl:element>
			<!-- CONSTRUCTION -->
			<xsl:element name="oeu_nc_construction">
				<xsl:for-each select="pr:_nested__oeu__oeu_archive_exist_construct_places/pr:oeu__oeu_archive_exist_construct_places">
					<xsl:element name="oeu_nc_construction_place">
						<oeu_nc_construction_place_uuid>
							<xsl:value-of select="pr:oeu_archive_exist_construct_place_v2/pr:pl/pr:_uuid"/>
						</oeu_nc_construction_place_uuid>
					</xsl:element>
				</xsl:for-each>
				<xsl:element name="construction_time_span">
					<oeu_nc_construction_time_span_from>
						<xsl:choose>
							<xsl:when test="string-length(pr:oeu_archive_exist_construct_timespan/pr:from) = 4">
								<xsl:value-of select="concat(pr:oeu_archive_exist_construct_timespan/pr:from,'-01-01')"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="pr:oeu_archive_exist_construct_timespan/pr:from"/>
							</xsl:otherwise>
						</xsl:choose>
					</oeu_nc_construction_time_span_from>
					<oeu_nc_construction_time_span_to>
						<xsl:choose>
							<xsl:when test="string-length(pr:oeu_archive_exist_construct_timespan/pr:to) = 4">
								<xsl:value-of select="concat(pr:oeu_archive_exist_construct_timespan/pr:to,'-01-01')"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="pr:oeu_archive_exist_construct_timespan/pr:to"/>
							</xsl:otherwise>
						</xsl:choose>
					</oeu_nc_construction_time_span_to>
				</xsl:element>
				<xsl:element name="construction_uncertainity">
					<oeu_nc_construction_time_span_uncertainity>
						<xsl:value-of select="pr:oeu_archive_exist_construct_timespan_uncert/pr:generic_uncertainty/pr:generic_uncertainty_uri"/>
					</oeu_nc_construction_time_span_uncertainity>
				</xsl:element>
			</xsl:element>
			<!-- DESCTRUCTION -->
			<xsl:element name="oeu_nc_destruction">
				<xsl:for-each select="pr:_nested__oeu__oeu_archive_exist_destruct_places/pr:oeu__oeu_archive_exist_destruct_places">
					<xsl:element name="oeu_nc_destruction_place">
						<oeu_nc_destruction_place_uuid>
							<xsl:value-of select="pr:oeu_archive_exist_destruct_place_v2/pr:pl/pr:_uuid"/>
						</oeu_nc_destruction_place_uuid>
					</xsl:element>
				</xsl:for-each>
				<xsl:element name="destruction_time_span">
					<oeu_nc_destruction_time_span_from>
						<xsl:choose>
							<xsl:when test="string-length(pr:oeu_archive_exist_destruct_timespan/pr:from) = 4">
								<xsl:value-of select="concat(pr:oeu_archive_exist_destruct_timespan/pr:from,'-01-01')"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="pr:oeu_archive_exist_destruct_timespan/pr:from"/>
							</xsl:otherwise>
						</xsl:choose>
					</oeu_nc_destruction_time_span_from>
					<oeu_nc_destruction_time_span_to>
						<xsl:choose>
							<xsl:when test="string-length(pr:oeu_archive_exist_destruct_timespan/pr:to) = 4">
								<xsl:value-of select="concat(pr:oeu_archive_exist_destruct_timespan/pr:to,'-01-01')"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="pr:oeu_archive_exist_destruct_timespan/pr:to"/>
							</xsl:otherwise>
						</xsl:choose>
					</oeu_nc_destruction_time_span_to>
				</xsl:element>
				<xsl:element name="destruction_uncertainity">
					<oeu_nc_destruction_time_span_uncertainity>
						<xsl:value-of select="pr:oeu_archive_exist_destruct_timespan_uncert/pr:generic_uncertainty/pr:generic_uncertainty_uri"/>
					</oeu_nc_destruction_time_span_uncertainity>
				</xsl:element>
			</xsl:element>
		</entry>
	</xsl:template>
</xsl:stylesheet>
