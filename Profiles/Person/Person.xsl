<?xml version="1.0" encoding="UTF-8"?>

<!-- author: ETH Zurich, gta digital, Matteo Lorenzini, Zoe Reinke -->
<!-- license: please refer to the license.txt file in our git repository (https://github.com/gtadigital/XSLT) -->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
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

            <_01_actor_local_type>
                <xsl:value-of select="pr:act_type_crm/pr:act_type_crm/pr:_standard/pr:de-DE"/>
            </_01_actor_local_type>
            <_01_actor_local_type>
                <xsl:value-of select="pr:act_type_crm/pr:act_type_crm/pr:_standard/pr:en-US"/>
            </_01_actor_local_type>

            <_01_actor_local_type>
                <xsl:value-of select="pr:act_type_crm/pr:act_type_crm/pr:_standard/pr:it-IT"/>
            </_01_actor_local_type>

            <_01_actor_local_type>
                <xsl:value-of select="pr:act_type_crm/pr:act_type_crm/pr:_standard/pr:fr-FR"/>
            </_01_actor_local_type>

            <_01_actor_nameclass_identifier_identifier>
                <xsl:value-of select="pr:_uuid"/>
            </_01_actor_nameclass_identifier_identifier>

            <_01_actor_nameclass_name>
                <xsl:value-of select="pr:act_nc_name"/>
            </_01_actor_nameclass_name>

            <_01_actor_nameclass_name_language>
                <xsl:value-of select="pr:act_nc_name_lang/pr:generic_lang/pr:_standard/pr:de-DE"/>
            </_01_actor_nameclass_name_language>
            <_01_actor_nameclass_name_language>
                <xsl:value-of select="pr:act_nc_name_lang/pr:generic_lang/pr:_standard/pr:en-US"/>
            </_01_actor_nameclass_name_language>
            <_01_actor_nameclass_name_language>
                <xsl:value-of select="pr:act_nc_name_lang/pr:generic_lang/pr:_standard/pr:it-IT"/>
            </_01_actor_nameclass_name_language>
            <_01_actor_nameclass_name_language>
                <xsl:value-of select="pr:act_nc_name_lang/pr:generic_lang/pr:_standard/pr:fr-FR"/>
            </_01_actor_nameclass_name_language>

            <_01_actor_nameclass_nameHonorific>
                <xsl:value-of select="pr:act_nc_honname"/>
            </_01_actor_nameclass_nameHonorific>

            <_01_actor_nameclass_nameHonorific_language>
                <xsl:value-of select="pr:act_nc_honname_lang/pr:generic_lang/pr:_standard/pr:de-DE"/>
            </_01_actor_nameclass_nameHonorific_language>
            <_01_actor_nameclass_nameHonorific_language>
                <xsl:value-of select="pr:act_nc_honname_lang/pr:generic_lang/pr:_standard/pr:en-US"/>
            </_01_actor_nameclass_nameHonorific_language>
            <_01_actor_nameclass_nameHonorific_language>
                <xsl:value-of select="pr:act_nc_honname_lang/pr:generic_lang/pr:_standard/pr:it-IT"/>
            </_01_actor_nameclass_nameHonorific_language>
            <_01_actor_nameclass_nameHonorific_language>
                <xsl:value-of select="pr:act_nc_honname_lang/pr:generic_lang/pr:_standard/pr:fr-FR"/>
            </_01_actor_nameclass_nameHonorific_language>

            <xsl:for-each select="pr:_nested__act__act_nc_altname">
                <xsl:element name="act_alt_name">
                    <xsl:for-each select="pr:act__act_nc_altname">
                        <xsl:element name="act_alt_name_literal">
                            <act_nc_altname_literal>
                                <xsl:value-of select="pr:act_nc_altname_literal"/>
                            </act_nc_altname_literal>
                            <act_nc_altname_literal_lang>
                                <xsl:value-of select="pr:act_nc_altname_lang/pr:generic_lang/pr:_standard/pr:de-DE"/>
                            </act_nc_altname_literal_lang>
                            <act_nc_altname_literal_lang>
                                <xsl:value-of select="pr:act_nc_altname_lang/pr:generic_lang/pr:_standard/pr:en-US"/>
                            </act_nc_altname_literal_lang>
                            <act_nc_altname_literal_lang>
                                <xsl:value-of select="pr:act_nc_altname_lang/pr:generic_lang/pr:_standard/pr:it-IT"/>
                            </act_nc_altname_literal_lang>
                            <act_nc_altname_literal_lang>
                                <xsl:value-of select="pr:act_nc_altname_lang/pr:generic_lang/pr:_standard/pr:fr-FR"/>
                            </act_nc_altname_literal_lang>
                            <act_nc_altname_type>
                                <xsl:value-of
                                        select="pr:act_nc_altname_type/pr:generic_nametype/pr:_standard/pr:de-DE"/>
                            </act_nc_altname_type>
                            <act_nc_altname_type>
                                <xsl:value-of
                                        select="pr:act_nc_altname_type/pr:generic_nametype/pr:_standard/pr:en-US"/>
                            </act_nc_altname_type>
                        </xsl:element>
                    </xsl:for-each>
                </xsl:element>
            </xsl:for-each>

            <_01_actor_nameclass_gender>
                <xsl:value-of select="pr:act_nc_gender/pr:act_person_gender/pr:_standard/pr:de-DE"/>
            </_01_actor_nameclass_gender>
            <_01_actor_nameclass_gender>
                <xsl:value-of select="pr:act_nc_gender/pr:act_person_gender/pr:_standard/pr:en-US"/>
            </_01_actor_nameclass_gender>
            <xsl:for-each select="pr:_nested__act__act_doc_biographical_note">
                <xsl:element name="act_short_bio">
                    <act_doc_biographical_note_literal>
                        <xsl:value-of select="pr:act__act_doc_biographical_note/pr:act_doc_biographical_note_literal"/>
                    </act_doc_biographical_note_literal>
                    <act_doc_biographical_note_lang>
                        <xsl:value-of
                                select="pr:act__act_doc_biographical_note/pr:act_doc_biographical_note_lang/pr:generic_lang/pr:_standard/pr:de-DE"/>
                    </act_doc_biographical_note_lang>
                    <act_doc_biographical_note_lang>
                        <xsl:value-of
                                select="pr:act__act_doc_biographical_note/pr:act_doc_biographical_note_lang/pr:generic_lang/pr:_standard/pr:en-US"/>
                    </act_doc_biographical_note_lang>
                    <act_doc_biographical_note_lang>
                        <xsl:value-of
                                select="pr:act__act_doc_biographical_note/pr:act_doc_biographical_note_lang/pr:generic_lang/pr:_standard/pr:it-IT"/>
                    </act_doc_biographical_note_lang>
                    <act_doc_biographical_note_lang>
                        <xsl:value-of
                                select="pr:act__act_doc_biographical_note/pr:act_doc_biographical_note_lang/pr:generic_lang/pr:_standard/pr:fr-FR"/>
                    </act_doc_biographical_note_lang>
                    <act_doc_biographical_note_source>
                        <xsl:value-of
                                select="pr:act__act_doc_biographical_note/pr:act_doc_biographical_note_source/pr:generic_contributor/pr:_uuid"/>
                    </act_doc_biographical_note_source>
                </xsl:element>
            </xsl:for-each>

            <_99_actor_nameclass_identifierGND_identifier>
                <xsl:value-of select="pr:act_nc_identifier_gnd"/>
            </_99_actor_nameclass_identifierGND_identifier>
            <_99_actor_nameclass_identifierGND_identifier_provider>
                <xsl:value-of
                        select="pr:act_nc_identifier_gnd_prov/pr:generic_contributor/pr:generic_contributor_sari_uuid"/>
            </_99_actor_nameclass_identifierGND_identifier_provider>

            <_99_actor_nameclass_identifierSIKART_identifier>
                <xsl:value-of select="pr:act_nc_identifier_sikart"/>
            </_99_actor_nameclass_identifierSIKART_identifier>
            <_99_actor_nameclass_identifierSIKART_identifier_provider>
                <xsl:value-of
                        select="pr:act_nc_identifier_sikart_prov/pr:generic_contributor/pr:generic_contributor_sari_uuid"/>
            </_99_actor_nameclass_identifierSIKART_identifier_provider>

            <_99_actor_nameclass_identifierULAN_identifier>
                <xsl:value-of select="pr:act_nc_identifier_ulan"/>
            </_99_actor_nameclass_identifierULAN_identifier>
            <_99_actor_nameclass_identifierULAN_identifier_provider>
                <xsl:value-of
                        select="pr:act_nc_identifier_ulan_prov/pr:generic_contributor/pr:generic_contributor_sari_uuid"/>
            </_99_actor_nameclass_identifierULAN_identifier_provider>

            <_99_actor_nameclass_identifierWikidata_identifier>
                <xsl:value-of select="pr:act_nc_identifier_wikidata"/>
            </_99_actor_nameclass_identifierWikidata_identifier>
            <_99_actor_nameclass_identifierwikidata_identifier_provider>
                <xsl:value-of
                        select="pr:act_nc_identifier_wikidata__prov/pr:generic_contributor/pr:generic_contributor_sari_uuid"/>
            </_99_actor_nameclass_identifierwikidata_identifier_provider>


        </entry>
    </xsl:template>
</xsl:stylesheet>
