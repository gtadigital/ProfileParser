<?xml version="1.0" encoding="UTF-8"?>
<!-- author: ETH Zurich, gta digital, Matteo Lorenzini -->
<!-- license: please refer to the license.txt file in our git repository (https://github.com/gtadigital/XSLT) -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:pr="https://schema.easydb.de/EASYDB/1.0/objects/" version="1.0" exclude-result-prefixes="pr">
	<xsl:output method="xml" indent="yes" encoding="UTF-8"/>
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

	<xsl:template match="pr:do"/>
	<xsl:template match="pr:objects/pr:do">
		<xsl:variable name="IIIF-locator" select="pr:do_loc_locator " />
		<xsl:variable name="time-span-from-creation" select="pr:do_existence_creation_date/pr:from" />
		<xsl:variable name="time-span-to-creation" select="pr:do_existence_creation_date/pr:to" />
		<xsl:variable name="time-span-from-modification" select="pr:do_existence_modification_date/pr:from" />
		<xsl:variable name="time-span-to-modification" select="pr:do_existence_modification_date/pr:to" />
		<entry>
			<!-- UUID -->
			<do_system_object_id>
				<xsl:value-of select="pr:_system_object_id"/>
			</do_system_object_id>
			<do_record_uuid>
				<xsl:value-of select="pr:_uuid"/>
			</do_record_uuid>
			<!-- ID -->
			<_id>
				<xsl:value-of select="pr:_id"/>
			</_id>
			<!-- TITLE -->
			<xsl:element name="do_file_name">
				<do_title_de>
					<xsl:value-of select="pr:do_nc_title/pr:de-DE"/>
				</do_title_de>
				<do_title_en>
					<xsl:value-of select="pr:do_nc_title/pr:en-US"/>
				</do_title_en>
			</xsl:element>
			<!-- CREATION -->
			<xsl:element name="do_creation_date">
				<do_production_time_span_from>
					<xsl:choose>
						<xsl:when test="string-length(pr:do_existence_creation_date/pr:from) = 4">
							<xsl:value-of select="concat(pr:do_existence_creation_date/pr:from,'-01-01')"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="substring-before($time-span-from-creation,'T')"/>
						</xsl:otherwise>
					</xsl:choose>
				</do_production_time_span_from>
				<do_production_time_span_to>
					<xsl:choose>
						<xsl:when test="string-length(pr:do_existence_creation_date/pr:to) = 4">
							<xsl:value-of select="concat(pr:do_existence_creation_date/pr:to,'-01-01')"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="substring-before($time-span-to-creation,'T')"/>
						</xsl:otherwise>
					</xsl:choose>
				</do_production_time_span_to>
			</xsl:element>
			<!-- MODIFICATION -->
			<xsl:element name="do_modification">
				<xsl:for-each select="pr:_nested__do__do_existence_modification/pr:do__do_existence_modification">
					<xsl:element name="do_modification_date">
						<do_modification_time_span_from>
							<xsl:choose>
								<xsl:when test="string-length(pr:do_existence_modification_date/pr:from) = 4">
									<xsl:value-of select="concat(pr:do_existence_modification_date/pr:from,'-01-01')"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="substring-before($time-span-from-modification,'T')"/>
								</xsl:otherwise>
							</xsl:choose>
						</do_modification_time_span_from>
						<do_modification_time_span_to>
							<xsl:choose>
								<xsl:when test="string-length(pr:do_existence_modification_date/pr:to) = 4">
									<xsl:value-of select="concat(pr:do_existence_modification_date/pr:to,'-01-01')"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="substring-before($time-span-to-modification,'T')"/>
								</xsl:otherwise>
							</xsl:choose>
						</do_modification_time_span_to>
					</xsl:element>
					<xsl:element name = "do_modification_actor">
						<do_modification_actor_id>
							<xsl:value-of select = "pr:do_actrel_modification_actor/pr:act/pr:_id"/>
						</do_modification_actor_id>
						<do_modification_actor_appellation_en>
							<xsl:value-of select = "pr:do_actrel_modification_actor/pr:act/pr:_standard/pr:en-US"/>
						</do_modification_actor_appellation_en>
						<do_modification_actor_appellation_de>
							<xsl:value-of select = "pr:do_actrel_modification_actor/pr:act/pr:_standard/pr:de-DE"/>
						</do_modification_actor_appellation_de>
						<do_modification_actor_type>
							<xsl:value-of select = "pr:do_actrel_modification_actor/pr:act/pr:act_type_crm_uri"/>
						</do_modification_actor_type>
					</xsl:element>
				</xsl:for-each>
			</xsl:element>
			<!-- IIIF SPEC-->
			<do_locator>
				<xsl:value-of select="substring-after($IIIF-locator,'https://iiif.gta.arch.ethz.ch/iiif/2/')"/>
			</do_locator>
			<do_locator_type>
				<xsl:value-of select ="pr:do_loc_locator_type/pr:en-US"/>
			</do_locator_type>
			<!-- RIGHTS-->
			<do_rights_holder>
				<xsl:value-of select ="pr:_nested__do__do_rights/pr:do__do_rights/pr:do_rights_holder/pr:act/pr:_id"/>
			</do_rights_holder>
			<do_rights_holder_type>
				<xsl:value-of select ="pr:_nested__do__do_rights/pr:do__do_rights/pr:do_rights_holder/pr:act/pr:act_type_crm_uri"/>
			</do_rights_holder_type>
			<do_rights_holder_appellation>
				<xsl:value-of select ="pr:_nested__do__do_rights/pr:do__do_rights/pr:do_rights_holder/pr:act/pr:_standard/pr:en-US"/>
			</do_rights_holder_appellation>
			<do_rights_type>
				<xsl:value-of select ="pr:_nested__do__do_rights/pr:do__do_rights/pr:do_rights_type/pr:generic_rights_type/pr:_id"/>
			</do_rights_type>
			<do_rights_type_description_en>
				<xsl:value-of select ="pr:_nested__do__do_rights/pr:do__do_rights/pr:do_rights_description/pr:en-US"/>
			</do_rights_type_description_en>
			<do_rights_type_description_de>
				<xsl:value-of select ="pr:_nested__do__do_rights/pr:do__do_rights/pr:do_rights_description/pr:de-DE"/>
			</do_rights_type_description_de>
		</entry>
	</xsl:template>
	<xsl:template match="pr:objects/pr:ao">
		<entry>
			<!-- UUID -->
			<ao_system_object_id>
				<xsl:value-of select="pr:_system_object_id"/>
			</ao_system_object_id>
			<ao_record_uuid>
				<xsl:value-of select="pr:_uuid"/>
			</ao_record_uuid>
			<_id>
				<xsl:value-of select="pr:_id"/>
			</_id>
			<!-- PARENT ID -->
			<_id_parent>
				<xsl:value-of select="pr:_id_parent"/>
			</_id_parent>
			<!-- MODIFICATION -->
			<ao_last_modified>
				<xsl:value-of select="pr:_last_modified"/>
			</ao_last_modified>
			<!-- CREATION -->
			<ao_created>
				<xsl:value-of select="pr:_created"/>
			</ao_created>
			<!--Hierarchy-->
			<xsl:element name="ao_type_isag">
				<ao_type_isad_uri>
					<xsl:value-of select="pr:ao_type_isag/pr:ao_type_isad/pr:ao_type_isad_uri"/>
				</ao_type_isad_uri>
			</xsl:element>
			<!-- IDENTIFIERS -->
			<ao_preferred_identifier>
				<xsl:value-of select="pr:ao_nc_identifier"/>
			</ao_preferred_identifier>
			<!--  ALTERNATIVE IDENTIFIER -->
			<xsl:element name="ao_alternative_identifiers_list">
				<xsl:for-each select="pr:_nested__ao__ao_nc_identifier_alt/pr:ao__ao_nc_identifier_alt">
					<xsl:element name="ao_alternative_identifiers">
						<ao_identifier_alt_id>
							<xsl:value-of select="pr:ao_nc_identifier_alt_id"/>
						</ao_identifier_alt_id>
						<ao_identifiers_type_uuid>
							<xsl:value-of select="pr:ao_nc_identifier_alt_type/pr:generic_identifier_type/pr:_uuid"/>
						</ao_identifiers_type_uuid>
						<xsl:element name="ao_identifiers_type_name">
							<ao_identifiers_type_name_de>
								<xsl:value-of select="pr:ao_nc_identifier_alt_type/pr:generic_identifier_type/pr:generic_identifier_type_name/pr:de-DE"/>
							</ao_identifiers_type_name_de>
							<ao_identifiers_type_name_en>
								<xsl:value-of select="pr:ao_nc_identifier_alt_type/pr:generic_identifier_type/pr:generic_identifier_type_name/pr:en-US"/>
							</ao_identifiers_type_name_en>
						</xsl:element>
						<ao_alternative_identifiers_usedby_uuid>
							<xsl:value-of select="pr:ao_nc_identifier_alt_usedby/pr:act/pr:_uuid"/>
						</ao_alternative_identifiers_usedby_uuid>
					</xsl:element>
				</xsl:for-each>
			</xsl:element>
			<ao_acquisition_identifier>
				<xsl:value-of select="pr:ao_nc_identifier_acquisition_nr_v2"/>
			</ao_acquisition_identifier>
			<!-- TITLE -->
			<xsl:element name="ao_file_name">
				<ao_title_de>
					<xsl:value-of select="pr:ao_nc_title/pr:de-DE"/>
				</ao_title_de>
				<ao_title_en>
					<xsl:value-of select="pr:ao_nc_title/pr:en-US"/>
				</ao_title_en>
			</xsl:element>
			<xsl:element name="ao_alternative_titles_list">
				<xsl:for-each select="pr:_nested__ao__ao_nc_title_alt/pr:ao__ao_nc_title_alt">
					<xsl:element name="ao_alternative_titles">
						<ao_title_alt_title>
							<xsl:value-of select="pr:ao_nc_title_alt_title"/>
						</ao_title_alt_title>
						<ao_alternative_title_lang>
							<xsl:value-of select="pr:ao_nc_title_alt_lang/pr:generic_lang/pr:generic_lang_akronym"/>
						</ao_alternative_title_lang>
						<xsl:element name="ao_alternative_title_used_by_actor">
							<xsl:for-each select="pr:ao_nc_title_alt_usedby/pr:act">
								<ao_title_used_by_actor_uuid>
									<xsl:value-of select="pr:_uuid"/>
								</ao_title_used_by_actor_uuid>
								<ao_title_used_by_actor_type>
									<xsl:value-of select="pr:act_type_crm/pr:act_type_crm/pr:act_type_crm_name"/>
								</ao_title_used_by_actor_type>
							</xsl:for-each>
						</xsl:element>
					</xsl:element>
				</xsl:for-each>
			</xsl:element>
			<!-- TYPE -->
			<xsl:element name="ao_document_type_list">
				<xsl:for-each select="pr:ao_nc_type/pr:ao_type">
					<xsl:element name="ao_document_type">
						<ao_document_type_uuid>
							<xsl:value-of select="pr:_uuid"/>
						</ao_document_type_uuid>
						<ao_document_type_appellation_de>
							<xsl:value-of select="pr:_standard/pr:de-DE"/>
						</ao_document_type_appellation_de>
					</xsl:element>
				</xsl:for-each>
			</xsl:element>
			<ao_generic_content_lang>
				<xsl:value-of select="pr:ao_nc_lang/pr:generic_lang/pr:generic_lang_akronym"/>
			</ao_generic_content_lang>
			<!-- CREATION -->
			<!-- ACTOR CREATOR -->
			<xsl:element name="actor">
				<xsl:for-each select="pr:_nested__ao__ao_actorrelation_creation/pr:ao__ao_actorrelation_creation">
					<xsl:element name="ao_actor_creator">
						<xsl:element name="ao_actor_type">
							<ao_actor_creator_type_uuid>
								<xsl:value-of select="pr:ao_actorrelation_creation_actor/pr:act/pr:_uuid"/>
							</ao_actor_creator_type_uuid>
							<ao_actor_creator_type>
								<xsl:value-of select="pr:ao_actorrelation_creation_actor/pr:act/pr:act_type_crm/pr:act_type_crm/pr:act_type_crm_name"/>
							</ao_actor_creator_type>
						</xsl:element>
						<xsl:element name="ao_actor_role">
							<xsl:for-each select="pr:ao_actorrelation_creation_role/pr:act_role">
								<ao_actor_creator_role_uuid>
									<xsl:value-of select="pr:_uuid"/>
								</ao_actor_creator_role_uuid>
								<ao_actor_creator_role_name>
									<xsl:value-of select="pr:act_role_name_display/pr:de-DE"/>
								</ao_actor_creator_role_name>
							</xsl:for-each>
						</xsl:element>
					</xsl:element>
				</xsl:for-each>
			</xsl:element>
			<!-- ACTOR USER -->
			<xsl:element name="actor_user">
				<xsl:for-each select="pr:_nested__ao__ao_actorrelation_usedby/pr:ao__ao_actorrelation_usedby">
					<xsl:element name="ao_actor_user">
						<xsl:element name="ao_actor_user_type_">
							<ao_actor_user_type_uuid>
								<xsl:value-of select="pr:ao_actorrelation_usedby_actor/pr:act/pr:_uuid"/>
							</ao_actor_user_type_uuid>
							<ao_actor_user_type>
								<xsl:value-of select="pr:ao_actorrelation_usedby_actor/pr:act/pr:act_type_crm_archive/pr:act_type_crm/pr:act_type_crm_name"/>
							</ao_actor_user_type>
						</xsl:element>
						<xsl:element name="ao_actor_user_role">
							<xsl:for-each select="pr:ao_actorrelation_usedby_role/pr:act_role">
								<ao_actor_user_uuid>
									<xsl:value-of select="pr:_uuid"/>
								</ao_actor_user_uuid>
								<ao_actor_user_role_name_de>
									<xsl:value-of select="pr:act_role_name_display/pr:de-DE"/>
								</ao_actor_user_role_name_de>
								<ao_actor_user_role_name_en>
									<xsl:value-of select="pr:act_role_name_display/pr:en-US"/>
								</ao_actor_user_role_name_en>
							</xsl:for-each>
						</xsl:element>
					</xsl:element>
				</xsl:for-each>
			</xsl:element>
			<!-- Production -->
			<xsl:element name="ao_production_list">
				<xsl:for-each select="pr:_nested__ao__ao_exist_prod_places/pr:ao__ao_exist_prod_places/pr:ao_exist_prod_place/pr:pl">
					<xsl:element name="ao_production">
						<ao_production_place_uuid>
							<xsl:value-of select="pr:_uuid"/>
						</ao_production_place_uuid>
					</xsl:element>
				</xsl:for-each>
				<xsl:element name="ao_production_time_span">
					<ao_production_time_span_from>
						<xsl:choose>
							<xsl:when test="string-length(pr:ao_exist_prod_timespan/pr:from) = 4">
								<xsl:value-of select="concat(pr:ao_exist_prod_timespan/pr:from,'-01-01')"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="pr:ao_exist_prod_timespan/pr:from"/>
							</xsl:otherwise>
						</xsl:choose>
					</ao_production_time_span_from>
					<ao_production_time_span_to>
						<xsl:choose>
							<xsl:when test="string-length(pr:ao_exist_prod_timespan/pr:to) = 4">
								<xsl:value-of select="concat(pr:ao_exist_prod_timespan/pr:to,'-01-01')"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="pr:ao_exist_prod_timespan/pr:to"/>
							</xsl:otherwise>
						</xsl:choose>
					</ao_production_time_span_to>
				</xsl:element>
			</xsl:element>
			<!-- Destruction -->
			<xsl:element name="ao_destruction">
				<xsl:for-each select="pr:_nested__ao__ao_exist_destr_places/pr:ao__ao_exist_destr_places/pr:ao_exist_destr_place/pr:pl">
					<xsl:element name="ao_destruction_place">
						<ao_destruction_place_uuid>
							<xsl:value-of select="pr:_uuid"/>
						</ao_destruction_place_uuid>
					</xsl:element>
				</xsl:for-each>
				<xsl:element name="ao_destruction_time_span">
					<ao_destruction_time_span_from>
						<xsl:choose>
							<xsl:when test="string-length(pr:ao_exist_destr_timespan/pr:from) = 4">
								<xsl:value-of select="concat(pr:ao_exist_destr_timespan/pr:from,'-01-01')"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="pr:ao_exist_destr_timespan/pr:from"/>
							</xsl:otherwise>
						</xsl:choose>
					</ao_destruction_time_span_from>
					<ao_destruction_time_span_to>
						<xsl:choose>
							<xsl:when test="string-length(pr:ao_exist_destr_timespan/pr:to) = 4">
								<xsl:value-of select="concat(pr:ao_exist_destr_timespan/pr:to,'-01-01')"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="pr:ao_exist_destr_timespan/pr:to"/>
							</xsl:otherwise>
						</xsl:choose>
					</ao_destruction_time_span_to>
				</xsl:element>
			</xsl:element>
			<!-- Korr from place -->
			<xsl:element name="ao_correspondance_from">
				<xsl:for-each select="pr:_nested__ao__ao_korr_from_places/pr:ao__ao_korr_from_places/pr:ao_korr_from_place/pr:pl">
					<xsl:element name="ao_correspondance_from_place">
						<ao_correspondance_place_from>
							<xsl:value-of select="pr:_uuid"/>
						</ao_correspondance_place_from>
					</xsl:element>
				</xsl:for-each>
				<xsl:element name="ao_correspondance_from_time_span">
					<ao_correspondance_time_span_from_earliest>
						<xsl:choose>
							<xsl:when test="string-length(pr:ao_korr_from_timespan/pr:from) = 4">
								<xsl:value-of select="concat(pr:ao_korr_from_timespan/pr:from,'-1-1')"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="pr:ao_korr_from_timespan/pr:from"/>
							</xsl:otherwise>
						</xsl:choose>
					</ao_correspondance_time_span_from_earliest>
					<ao_correspondance_time_span_from_latest>
						<xsl:choose>
							<xsl:when test="string-length(pr:ao_korr_from_timespan/pr:to) = 4">
								<xsl:value-of select="concat(pr:ao_korr_from_timespan/pr:to,'-1-1')"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="pr:ao_korr_from_timespan/pr:to"/>
							</xsl:otherwise>
						</xsl:choose>
					</ao_correspondance_time_span_from_latest>
				</xsl:element>
			</xsl:element>
			<!-- Korr to place -->
			<xsl:element name="ao_correspondance_to">
				<xsl:for-each select="pr:_nested__ao__ao_korr_to_places/pr:ao__ao_korr_to_places/pr:ao_korr_to_place/pr:pl">
					<xsl:element name="ao_correspondance_to_place">
						<ao_correspondance_place_to>
							<xsl:value-of select="pr:_uuid"/>
						</ao_correspondance_place_to>
					</xsl:element>
				</xsl:for-each>
				<xsl:element name="ao_correspondance_to_time_span">
					<ao_correspondance_time_span_to_earliest>
						<xsl:choose>
							<xsl:when test="string-length(pr:ao_korr_to_timespan/pr:from) = 4">
								<xsl:value-of select="concat(pr:ao_korr_to_timespan/pr:from,'-1-1')"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="pr:ao_korr_to_timespan/pr:from"/>
							</xsl:otherwise>
						</xsl:choose>
					</ao_correspondance_time_span_to_earliest>
					<ao_correspondance_time_span_to_latest>
						<xsl:choose>
							<xsl:when test="string-length(pr:ao_korr_to_timespan/pr:to) = 4">
								<xsl:value-of select="concat(pr:ao_korr_to_timespan/pr:to,'-1-1')"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="pr:ao_korr_to_timespan/pr:to"/>
							</xsl:otherwise>
						</xsl:choose>
					</ao_correspondance_time_span_to_latest>
				</xsl:element>
			</xsl:element>
			<!-- Coverage Places -->
			<xsl:element name="ao_cover_places">
				<xsl:for-each select="pr:_nested__ao__ao_cover_places/pr:ao__ao_cover_places">
					<xsl:element name="ao_cover_place">
						<ao_cover_places_uuid>
							<xsl:value-of select="pr:ao_cover_places/pr:pl/pr:_uuid"/>
						</ao_cover_places_uuid>
					</xsl:element>
					<xsl:element name="ao_cover_place_role">
						<xsl:for-each select="pr:ao_cover_place_role/pr:generic_reference">
							<ao_cover_place_type_de>
								<xsl:value-of select="pr:generic_reference_name/pr:de-DE"/>
							</ao_cover_place_type_de>
							<ao_cover_place_type_en>
								<xsl:value-of select="pr:generic_reference_name/pr:en-US"/>
							</ao_cover_place_type_en>
						</xsl:for-each>
					</xsl:element>
				</xsl:for-each>
			</xsl:element>
			<!-- Coverage Actor -->
			<xsl:element name="ao_cover_actors">
				<xsl:for-each select="pr:_nested__ao__ao_cover_actors/pr:ao__ao_cover_actors">
					<xsl:element name="ao_cover_actors_type">
						<ao_cover_actor_uuid>
							<xsl:value-of select="pr:ao_cover_actors/pr:act/pr:_uuid"/>
						</ao_cover_actor_uuid>
						<!--
						<ao_cover_actor_type>
							<xsl:value-of select="pr:ao_cover_actors/pr:act/pr:act_type_crm/pr:act_type_crm/pr:act_type_crm_name"/>
						</ao_cover_actor_type>
						-->
						<ao_cover_actor_type>
							<xsl:value-of select="pr:ao_cover_actors/pr:act/pr:act_type_crm/pr:act_type_crm/pr:_standard/pr:de-DE"/>
						</ao_cover_actor_type>
					</xsl:element>
					<xsl:element name="ao_cover_actor_role">
						<xsl:for-each select="pr:ao_cover_actor_reference_type/pr:generic_reference">
							<ao_cover_actor_type_de>
								<xsl:value-of select="pr:generic_reference_name/pr:de-DE"/>
							</ao_cover_actor_type_de>
							<ao_cover_actor_type_en>
								<xsl:value-of select="pr:generic_reference_name/pr:en-US"/>
							</ao_cover_actor_type_en>
						</xsl:for-each>
					</xsl:element>
				</xsl:for-each>
			</xsl:element>
			<!-- Coverage Oeuvres -->
			<xsl:element name="ao_cover_oeuvres">
				<xsl:for-each select="pr:_nested__ao__ao_cover_oeuvres/pr:ao__ao_cover_oeuvres">
					<xsl:element name="ao_cover_oeuvre_type">
						<ao_cover_oeuvres_uuid>
							<xsl:value-of select="pr:ao_cover_oeuvres/pr:oeu/pr:_uuid"/>
						</ao_cover_oeuvres_uuid>
					</xsl:element>
					<xsl:element name="ao_cover_oeuvres_role">
						<xsl:for-each select="pr:ao_cover_oeuvre_role/pr:generic_reference_types">
							<ao_cover_oeuvres_type_de>
								<xsl:value-of select="pr:generic_reference_name/pr:de-DE"/>
							</ao_cover_oeuvres_type_de>
							<ao_cover_oeuvres_type_en>
								<xsl:value-of select="pr:generic_reference_name/pr:en-US"/>
							</ao_cover_oeuvres_type_en>
						</xsl:for-each>
					</xsl:element>
				</xsl:for-each>
			</xsl:element>
			<!-- Descriptions -->
			<xsl:element name="ao_descriptions">
				<ao_descr_scholar_descriptions_de>
					<xsl:value-of select="pr:ao_descr_scholardescription/pr:de-DE"/>
				</ao_descr_scholar_descriptions_de>
				<ao_scholar_descriptions_en>
					<xsl:value-of select="pr:ao_descr_scholardescription/pr:en-US"/>
				</ao_scholar_descriptions_en>
				<ao_ao_descr_notes_de>
					<xsl:value-of select="pr:ao_descr_notes/pr:de-DE"/>
				</ao_ao_descr_notes_de>
				<ao_ao_descr_notes_en>
					<xsl:value-of select="pr:ao_descr_notes/pr:en-US"/>
				</ao_ao_descr_notes_en>
				<ao_descr_holding_de>
					<xsl:value-of select="pr:ao_descr_holding/pr:de-DE"/>
				</ao_descr_holding_de>
				<ao_descr_holding_en>
					<xsl:value-of select="pr:ao_descr_holding/pr:en-US"/>
				</ao_descr_holding_en>
				<ao_descr_archivierung>
					<xsl:value-of select="pr:ao_descr_archivierung"/>
				</ao_descr_archivierung>
				<ao_descr_transcription>
					<xsl:value-of select="pr:ao_descr_transcription"/>
				</ao_descr_transcription>
				<ao_descr_actor_display_legacy>
					<xsl:value-of select="pr:ao_descr_actor_display"/>
				</ao_descr_actor_display_legacy>
				<ao_descr_place_display_de>
					<xsl:value-of select="pr:ao_descr_place_display/pr:de-DE"/>
				</ao_descr_place_display_de>
				<ao_descr_chrono_display_de>
					<xsl:value-of select="pr:ao_descr_chrono_display/pr:de-DE"/>
				</ao_descr_chrono_display_de>
			</xsl:element>
			<!-- Archive location -->
			<xsl:element name="ao_archive_location">
				<xsl:for-each select="pr:_reverse_nested__x_ao_loc__ao/pr:x_ao_loc">
					<xsl:element name="ao_loc_name_archive">
						<ao_loc_name>
							<xsl:value-of select="pr:loc/pr:loc/pr:loc_name"/>
						</ao_loc_name>
					</xsl:element>
				</xsl:for-each>
			</xsl:element>
			<!-- Current Owner -->
			<xsl:element name="ao_current_owner_list">
				<xsl:for-each select="pr:_nested__ao__ao_actorrelation_current_owners/pr:ao__ao_actorrelation_current_owners/pr:ao_actorrelation_current_owner">
					<xsl:element name="ao_current_owner">
						<ao_current_owner_uuid>
							<xsl:value-of select="pr:act/pr:_uuid"/>
						</ao_current_owner_uuid>
						<xsl:for-each select="pr:act/pr:act_type_crm/pr:act_type_crm">
							<xsl:element name="ao_owner_type">
								<ao_owner_type_name>
									<xsl:value-of select="pr:act_type_crm_name"/>
								</ao_owner_type_name>
							</xsl:element>
						</xsl:for-each>
					</xsl:element>
				</xsl:for-each>
			</xsl:element>
			<!-- Former Owner -->
			<xsl:element name="ao_former_ownerhsip">
				<xsl:for-each select="pr:_nested__ao__ao_actorrelation_former_ownership/pr:ao__ao_actorrelation_former_ownership">
					<xsl:element name="ao_former_owner">
						<ao_former_owner_uuid>
							<xsl:value-of select="pr:ao_actorrelation_former_ownership_owner/pr:act/pr:_uuid"/>
						</ao_former_owner_uuid>
						<xsl:for-each select="pr:ao_actorrelation_former_ownership_owner/pr:act/pr:act_type_crm/pr:act_type_crm">
							<xsl:element name="ao_former_owner_type">
								<ao_owner_type_name>
									<xsl:value-of select="pr:act_type_crm_name"/>
								</ao_owner_type_name>
							</xsl:element>
						</xsl:for-each>
						<xsl:element name="ownership_obtaining">
							<ao_actorrelation_former_ownership_timespan_obtaining_from>
								<xsl:choose>
									<xsl:when test="string-length(pr:ao_actorrelation_former_ownership_timespan_obtaining/pr:from) = 4">
										<xsl:value-of select="concat(pr:ao_actorrelation_former_ownership_timespan_obtaining/pr:from,'-1-1')"/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="pr:ao_actorrelation_former_ownership_timespan_obtaining/pr:from"/>
									</xsl:otherwise>
								</xsl:choose>
							</ao_actorrelation_former_ownership_timespan_obtaining_from>
							<ao_actorrelation_former_ownership_timespan_obtaining_to>
								<xsl:choose>
									<xsl:when test="string-length(pr:ao_actorrelation_former_ownership_timespan_obtaining/pr:to) = 4">
										<xsl:value-of select="concat(pr:ao_actorrelation_former_ownership_timespan_obtaining/pr:to,'-1-1')"/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="pr:ao_actorrelation_former_ownership_timespan_obtaining/pr:to"/>
									</xsl:otherwise>
								</xsl:choose>
							</ao_actorrelation_former_ownership_timespan_obtaining_to>
						</xsl:element>
						<xsl:element name="ownership_ceding">
							<ao_actorrelation_former_ownership_timespan_ceding_from>
								<xsl:choose>
									<xsl:when test="string-length(pr:ao_actorrelation_former_ownership_timespan_ceding/pr:from) = 4">
										<xsl:value-of select="concat(pr:ao_actorrelation_former_ownership_timespan_ceding/pr:from,'-1-1')"/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="pr:ao_actorrelation_former_ownership_timespan_ceding/pr:from"/>
									</xsl:otherwise>
								</xsl:choose>
							</ao_actorrelation_former_ownership_timespan_ceding_from>
							<ao_actorrelation_former_ownership_timespan_ceding_to>
								<xsl:choose>
									<xsl:when test="string-length(pr:ao_actorrelation_former_ownership_timespan_ceding/pr:to) = 4">
										<xsl:value-of select="concat(pr:ao_actorrelation_former_ownership_timespan_ceding/pr:to,'-1-1')"/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="pr:ao_actorrelation_former_ownership_timespan_ceding/pr:to"/>
									</xsl:otherwise>
								</xsl:choose>
							</ao_actorrelation_former_ownership_timespan_ceding_to>
						</xsl:element>
					</xsl:element>
				</xsl:for-each>
				<ao_former_ownership_note_de>
					<xsl:value-of select="pr:ao_actorrelation_former_ownership_note/pr:de-DE"/>
				</ao_former_ownership_note_de>
				<ao_former_ownership_note_en>
					<xsl:value-of select="pr:ao_actorrelation_former_ownership_note/pr:en-US"/>
				</ao_former_ownership_note_en>
			</xsl:element>
			<xsl:element name="ao_entry_tax">
				<xsl:for-each select="pr:_nested__ao__tax_transurbicide/pr:ao__tax_transurbicide">
					<xsl:element name="ao_entry_tax_transurbicide">
						<tax_transurbicide_label>
							<xsl:value-of select="pr:tax_transurbicide/pr:tax_transurbicide/pr:tax_transurbicide_name/pr:en-US"/>
						</tax_transurbicide_label>
						<tax_transurbicide_uri>
							<xsl:value-of select="pr:tax_transurbicide/pr:tax_transurbicide/pr:tax_transurbicide_uri_gta_digital"/>
						</tax_transurbicide_uri>
					</xsl:element>
				</xsl:for-each>
			</xsl:element>
		</entry>
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
			<!-- Isler specific name -->
			<xsl:element name="oeu_isler_name">
				<xsl:value-of select="pr:oeu_isler_name/pr:de-DE"/>
			</xsl:element>
			<!-- Isler specific description -->
			<xsl:element name="oeu_isler_descr_description">
				<xsl:value-of select="pr:oeu_isler_descr_description/pr:de-DE"/>
			</xsl:element>
			<!-- Isler specific note -->
			<xsl:element name="oeu_isler_descr_notes">
				<xsl:value-of select="pr:oeu_isler_descr_notes/pr:de-DE"/>
			</xsl:element>
			<!-- Isler shell data -->
			<xsl:element name="_nested__oeu__oeu_isler_subst_shell">
				<xsl:for-each select="pr:_nested__oeu__oeu_isler_subst_shell/pr:oeu__oeu_isler_subst_shell">
					<xsl:element name="shell_info">
						<xsl:element name="oeu__isler_subst_shell_nr">
							<xsl:value-of select="pr:oeu__isler_subst_shell_nr"/>
						</xsl:element>
						<xsl:element name="typology_shell_uuid">
							<xsl:value-of select="pr:oeu_isler_subst_shell_type/pr:typology_shell/pr:_uuid"/>
						</xsl:element>
						<xsl:element name="typology_shell_name">
							<xsl:value-of select="pr:oeu_isler_subst_shell_type/pr:typology_shell/pr:typology_shell_name/pr:de-DE"/>
						</xsl:element>
						<xsl:element name="oeu_isler_subst_shell_measurement_value">
							<xsl:value-of select="pr:oeu_isler_subst_shell_measurement_value"/>
						</xsl:element>
						<xsl:element name="_nested__oeu__oeu_isler_subst_shell__oeu_isler_subst_shell_materials">
							<xsl:value-of select="pr:_nested__oeu__oeu_isler_subst_shell__oeu_isler_subst_shell_materials/pr:oeu__oeu_isler_subst_shell__oeu_isler_subst_shell_materials/pr:oeu_isler_subst_shell_material/pr:generic_materials/pr:generic_material_name/pr:de-DE"/>
						</xsl:element>
						<xsl:element name="_nested__oeu__oeu_isler_subst_shell__oeu_isler_subst_shell_materials_uuid">
							<xsl:value-of select="pr:_nested__oeu__oeu_isler_subst_shell__oeu_isler_subst_shell_materials/pr:oeu__oeu_isler_subst_shell__oeu_isler_subst_shell_materials/pr:oeu_isler_subst_shell_material/pr:generic_materials/pr:_uuid"/>
						</xsl:element>
					</xsl:element>
				</xsl:for-each>
			</xsl:element>
		</entry>
	</xsl:template>
	 
	<xsl:template match="pr:objects/pr:act">
		<entry>
			<grp_system_object_id>
				<xsl:value-of select="pr:_system_object_id"/>
			</grp_system_object_id>
			<grp_last_modified>
				<xsl:value-of select="pr:act_last_modified"/>
			</grp_last_modified>
			<_uuid>
				<xsl:value-of select="pr:_uuid"/>
			</_uuid>
			<grp_nc_name>
				<xsl:value-of select="pr:act_nc_name"/>
			</grp_nc_name>
			<grp_nc_name_lang_akronym>
				<xsl:value-of select="pr:act_nc_name_lang/pr:generic_lang/pr:generic_lang_akronym"/>
			</grp_nc_name_lang_akronym>
			<xsl:for-each select="pr:_nested__act__act_nc_altname">
				<xsl:element name="act_altName">
					<xsl:for-each select="pr:act__act_nc_altname">
						<xsl:element name="act_alt_nameLiteral">
							<grp_nc_altname_literal>
								<xsl:value-of select="pr:act_nc_altname_literal"/>
							</grp_nc_altname_literal>
							<grp_nc_altname_lang_akronym>
								<xsl:value-of select="pr:act_nc_altname_lang/pr:generic_lang/pr:generic_lang_akronym"/>
							</grp_nc_altname_lang_akronym>
							<grp_nc_altname_type_de>
								<xsl:value-of select="pr:act_nc_altname_type/pr:generic_nametype/pr:generic_nametype_name/pr:de-DE"/>
							</grp_nc_altname_type_de>
							<grp_nc_altname_type_en>
								<xsl:value-of select="pr:act_nc_altname_type/pr:generic_nametype/pr:generic_nametype_name/pr:en-US"/>
							</grp_nc_altname_type_en>
							<grp_nc_altname_timespan_from>
								<xsl:choose>
									<xsl:when test="string-length(pr:act_nc_altname_timespan/pr:from) = 4">
										<xsl:value-of select="concat(pr:act_nc_altname_timespan/pr:from,'-01-01')"/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="pr:act_nc_altname_timespan/pr:from"/>
									</xsl:otherwise>
								</xsl:choose>
							</grp_nc_altname_timespan_from>
							<grp_nc_altname_timespan_to>
								<xsl:choose>
									<xsl:when test="string-length(pr:act_nc_altname_timespan/pr:to) = 4">
										<xsl:value-of select="concat(pr:act_nc_altname_timespan/pr:to,'-01-01')"/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="pr:act_nc_altname_timespan/pr:to"/>
									</xsl:otherwise>
								</xsl:choose>
							</grp_nc_altname_timespan_to>
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
					<grp_doc_biographical_note_literal>
						<xsl:value-of select="pr:act__act_doc_biographical_note/pr:act_doc_biographical_note_literal"/>
					</grp_doc_biographical_note_literal>
					<grp_doc_biographical_note_akronym>
						<xsl:value-of select="pr:act__act_doc_biographical_note/pr:act_doc_biographical_note_lang/pr:generic_lang/pr:generic_lang_akronym"/>
					</grp_doc_biographical_note_akronym>
					<grp_doc_biographical_note_source_uuid>
						<xsl:value-of select="pr:act__act_doc_biographical_note/pr:act_doc_biographical_note_source/pr:generic_contributor/pr:_uuid"/>
					</grp_doc_biographical_note_source_uuid>
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
				<xsl:value-of select="pr:act_nc_identifier_ulan"/>
			</grp_nc_identifier_ulan>
			<xsl:element name="wikidata_identifiers">
				<grp_nc_identifier_wikidata_1>
					<xsl:value-of select="pr:act_nc_identifier_wikidata"/>
				</grp_nc_identifier_wikidata_1>
				<grp_nc_identifier_wikidata_2>
					<xsl:value-of select="pr:act_nc_identifier_wikidata__v2"/>
				</grp_nc_identifier_wikidata_2>
			</xsl:element>
			<grp_nc_identifier_akl>
				<xsl:value-of select="pr:act_nc_identifier_akl"/>
			</grp_nc_identifier_akl>
			<grp_nc_identifier_ulan>
				<xsl:value-of select="pr:act_nc_identifier_ulan"/>
			</grp_nc_identifier_ulan>
			<xsl:element name="hls_identifier">
				<grp_nc_nc_identifier_hls_1>
					<xsl:value-of select="pr:act_nc_nc_identifier_hls"/>
				</grp_nc_nc_identifier_hls_1>
				<grp_nc_nc_identifier_hls_2>
					<xsl:value-of select="pr:act_nc_identifier_hls_v2"/>
				</grp_nc_nc_identifier_hls_2>
			</xsl:element>
			<xsl:element name="sikart_identifier">
				<grp_nc_identifier_sikart_1>
					<xsl:value-of select="pr:act_nc_identifier_sikart"/>
				</grp_nc_identifier_sikart_1>
				<grp_nc_identifier_sikart_2>
					<xsl:value-of select="pr:act_nc_identifier_sikart_v2"/>
				</grp_nc_identifier_sikart_2>
			</xsl:element>
			<xsl:element name="archinform_identifier">
				<grp_nc_identifier_archinform_1>
					<xsl:value-of select="pr:act_nc_identifier_archinform"/>
				</grp_nc_identifier_archinform_1>
				<grp_nc_identifier_archinform_2>
					<xsl:value-of select="pr:act_nc_identifier_archinform_v2"/>
				</grp_nc_identifier_archinform_2>
			</xsl:element>
			<xsl:element name="alat_identifier">
				<grp_nc_identifier_alat_1>
					<xsl:value-of select="pr:act_nc_identifier_alat"/>
				</grp_nc_identifier_alat_1>
				<grp_nc_identifier_alat_2>
					<xsl:value-of select="pr:act_nc_identifier_alat_v2"/>
				</grp_nc_identifier_alat_2>
			</xsl:element>
			<xsl:element name="fotoch_identifier">
				<grp_nc_identifier_fotoch_1>
					<xsl:value-of select="pr:act_nc_identifier_fotoch"/>
				</grp_nc_identifier_fotoch_1>
				<grp_nc_identifier_fotoch_2>
					<xsl:value-of select="pr:act_nc_identifier_fotoch_v2"/>
				</grp_nc_identifier_fotoch_2>
			</xsl:element>
			<xsl:for-each select="pr:_nested__act__act_social_national_affiliation">
				<xsl:element name="act_social_national_affiliation">
					<xsl:for-each select="pr:act__act_social_national_affiliation">
						<grp_social_national_affiliation_uuid>
							<xsl:value-of select="pr:act_social_national_affiliation_nationality/pr:act_nat/pr:_uuid"/>
						</grp_social_national_affiliation_uuid>
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
					<grp_national_affiliation>
						<xsl:value-of select="pr:act__grp_social_national_affiliation/pr:act_social_national_affiliation_nationality/pr:act_nat/pr:act_nat_uuid"/>
					</grp_national_affiliation>
				</xsl:element>
			</xsl:for-each>
			<xsl:for-each select="pr:_nested__act__act_activity_floruit">
				<xsl:element name="actor_activity_floruit">
					<grp_activity_floruit_place>
						<xsl:value-of select="pr:act__act_activity_floruit/pr:act_activity_floruit_place/pr:pl/pr:_uuid"/>
					</grp_activity_floruit_place>
					<grp_activity_floruit_time-span_from>
						<xsl:choose>
							<xsl:when test="string-length(pr:act__act_activity_floruit/pr:act_activity_floruit_timespan/pr:from) = 4">
								<xsl:value-of select="concat(pr:act__act_activity_floruit/pr:act_activity_floruit_timespan/pr:from,'-1-1')"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="pr:act__act_activity_floruit/pr:act_activity_floruit_timespan/pr:from"/>
							</xsl:otherwise>
						</xsl:choose>
					</grp_activity_floruit_time-span_from>
					<grp_activity_floruit_time-span_to>
						<xsl:choose>
							<xsl:when test="string-length(pr:act__act_activity_floruit/pr:act_activity_floruit_timespan/pr:to) = 4">
								<xsl:value-of select="concat(pr:act__act_activity_floruit/pr:act_activity_floruit_timespan/pr:to,'-1-1')"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="pr:act__act_activity_floruit/pr:act_activity_floruit_timespan/pr:to"/>
							</xsl:otherwise>
						</xsl:choose>
					</grp_activity_floruit_time-span_to>
				</xsl:element>
			</xsl:for-each>
			<xsl:for-each select="pr:_nested__act__act_activity_occupations">
				<xsl:element name="act_occupations">
					<grp_activity_occupation_de>
						<xsl:value-of select="pr:act__act_activity_occupations/pr:act_activity_occupation/pr:act_occ/pr:_standard/pr:de-DE"/>
					</grp_activity_occupation_de>
					<grp_activity_occupation_en>
						<xsl:value-of select="pr:act__act_activity_occupations/pr:act_activity_occupation/pr:act_occ/pr:_standard/pr:en-US"/>
					</grp_activity_occupation_en>
					<grp_activity_occupation_uuid>
						<xsl:value-of select="pr:act__act_activity_occupations/pr:act_activity_occupation/pr:act_occ/pr:_uuid"/>
					</grp_activity_occupation_uuid>
					<grp_activity_occupation_aat>
						<xsl:value-of select="pr:act__act_activity_occupations/pr:act_activity_occupation/pr:act_occ/pr:custom/pr:string"/>
					</grp_activity_occupation_aat>
				</xsl:element>
			</xsl:for-each>
		</entry>
	</xsl:template>
	
	<xsl:template match="pr:objects/pr:act[pr:act_type_crm/pr:act_type_crm/pr:_standard/pr:de-DE='E21_Person']">
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
	
	<xsl:template match="pr:objects/pr:pl">
		<xsl:variable name="wikidata" select="pr:pl_nc_identifier_wikidata" />
		<xsl:variable name="tgn" select="pr:pl_nc_identifier_tgn" />
		<xsl:variable name="geonames" select="pr:pl_nc_identifier_geonames" />
		<xsl:variable name="gnd" select="pr:pl_nc_identifier_gnd" />
		<xsl:variable name="dbpedia" select="pr:pl_nc_identifier_dbpedia" />
		<xsl:variable name="viaf" select="pr:pl_nc_identifier_viaf" />

		<entry>
			<plIdentifier_uuid>
				<xsl:value-of select="pr:_uuid"/>
			</plIdentifier_uuid>

			<xsl:for-each select="pr:_nested__pl__pl_nc_name/pr:pl__pl_nc_name">
				<xsl:element name="plidentifier_name">
					<plIdentifier_name_literal>
						<xsl:value-of select="pr:pl_nc_name_literal"/>
					</plIdentifier_name_literal>
					<plIdentifier_nameLang>
						<xsl:for-each select="pr:pl_nc_name_language/pr:generic_lang/pr:_standard">
							<xsl:element name="lang">
								<xsl:value-of select="pr:de-DE"/>

							</xsl:element>
							<xsl:element name="lang">
								<xsl:value-of select="pr:en-US"/>
							</xsl:element>
							<xsl:element name="lang">
								<xsl:value-of select="pr:it-IT"/>
							</xsl:element>
							<xsl:element name="lang">
								<xsl:value-of select="pr:fr-FR"/>
							</xsl:element>
						</xsl:for-each>
					</plIdentifier_nameLang>
					<plSource_uuid>
						<xsl:value-of select="pr:pl_nc_name_source/pr:generic_contributor/pr:generic_contributor_sari_uuid"/>
					</plSource_uuid>
				</xsl:element>
			</xsl:for-each>
			<plIdentifier_type>
				<xsl:value-of select="pr:pl_nc_type/pr:pl_type/pr:_uuid"/>
			</plIdentifier_type>

			<plParthood_currentPartOf>
				<xsl:value-of select="pr:pl_ph_current_partof_place/pr:pl/pr:_uuid"/>
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
				<!--<xsl:value-of select="pr:pl_nc_identifier_tgn"/>-->
				<xsl:value-of select="substring-after($tgn,'http://vocab.getty.edu/tgn/')"/>
			</plIdentifier_tgnURI>
			<!--Wikidata-->
			<plIdentifier_wikidata_provider>
				<xsl:value-of select="pr:pl_nc_identifier_wikidata_provider/pr:generic_contributor/pr:generic_contributor_sari_uuid"/>
			</plIdentifier_wikidata_provider>
			<plIdentifier_wikidataURI>
				<!--<xsl:value-of select="pr:pl_nc_identifier_wikidata"/>-->
				<xsl:value-of select="substring-after($wikidata,'https://www.wikidata.org/entity/')"/>
			</plIdentifier_wikidataURI>
			<!--Geonames-->
			<plIdentifier_geonames_provider>
				<xsl:value-of select="pr:pl_nc_identifier_geonames_provider/pr:generic_contributor/pr:generic_contributor_sari_uuid"/>
			</plIdentifier_geonames_provider>
			<plIdentifier_geonamesURI>
				<!--<xsl:value-of select="pr:pl_nc_identifier_geonames"/>-->
				<xsl:value-of select="substring-after($geonames,'https://www.geonames.org/')"/>
			</plIdentifier_geonamesURI>
			<!--GND-->
			<plIdentifier_gnd_provider>
				<xsl:value-of select="pr:pl_nc_identifier_gnd_provider/pr:generic_contributor/pr:generic_contributor_sari_uuid"/>
			</plIdentifier_gnd_provider>
			<plIdentifier_gndURI>
				<!--<xsl:value-of select="pr:pl_nc_identifier_gnd"/>-->
				<xsl:value-of select="substring-after($gnd,'http://d-nb.info/gnd/')"/>
			</plIdentifier_gndURI>
			<!--DbPedia-->
			<plIdentifier_dbpedia_provider>
				<xsl:value-of select="pr:pl_nc_identifier_dbpedia_provider/pr:generic_contributor/pr:generic_contributor_sari_uuid"/>
			</plIdentifier_dbpedia_provider>
			<plIdentifier_dbpediaURI>
				<!--<xsl:value-of select="pr:pl_nc_identifier_dbpedia"/>-->
				<xsl:value-of select="substring-after($dbpedia,'http://dbpedia.org/resource/')"/>
			</plIdentifier_dbpediaURI>
			<!--VIAF-->
			<plIdentifier_viaf_provider>
				<xsl:value-of select="pr:pl_nc_identifier_viaf_provider/pr:generic_contributor/pr:generic_contributor_sari_uuid"/>
			</plIdentifier_viaf_provider>
			<plIdentifier_viafURI>
				<!--<xsl:value-of select="pr:pl_nc_identifier_viaf"/>-->
				<xsl:value-of select="substring-after($viaf,'http://viaf.org/viaf/')"/>
			</plIdentifier_viafURI>
		</entry>
	</xsl:template>
</xsl:stylesheet>
