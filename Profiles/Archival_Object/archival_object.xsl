<?xml version="1.0" encoding="UTF-8"?>
<!-- author: ETH Zurich, gta digital, Matteo Lorenzini -->
<!-- license: please refer to the license.txt file in our git repository (https://github.com/gtadigital/XSLT) -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
				xmlns:pr="https://schema.easydb.de/EASYDB/1.0/objects/"
				version="1.0"
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
	<xsl:template match="pr:do"/>
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
</xsl:stylesheet>
