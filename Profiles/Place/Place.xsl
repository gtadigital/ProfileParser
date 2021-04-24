<?xml version="1.0" encoding="UTF-8"?>

<!-- author: ETH Zurich, gta digital, Zoe Reinke, Matteo Lorenzini -->
<!-- license: please refer to the license.txt file in our git repository (https://github.com/gtadigital/XSLT) -->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:pr="https://schema.easydb.de/EASYDB/1.0/objects/" exclude-result-prefixes="pr">
    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>
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
                <xsl:value-of
                        select="pr:pl_nc_identifier_swisstopo_provider/pr:generic_contributor/pr:generic_contributor_sari_uuid"/>
            </plIdentifier_swisstopo_provider>
            <plIdentifier_swisstopoURI>
                <xsl:value-of select="pr:pl_nc_identifier_swisstopo"/>
            </plIdentifier_swisstopoURI>

            <!-- City of zurich -->
            <plIdentifier_stzh_provider>
                <xsl:value-of
                        select="pr:pl_nc_identifier_stzh_provider/pr:generic_contributor/pr:generic_contributor_sari_uuid"/>
            </plIdentifier_stzh_provider>
            <plIdentifier_stzhURI>
                <xsl:value-of select="pr:pl_nc_identifier_stzh"/>
            </plIdentifier_stzhURI>
            <!-- TGN -->
            <plIdentifier_tgn_provider>
                <xsl:value-of
                        select="pr:pl_nc_identifier_tgn_provider/pr:generic_contributor/pr:generic_contributor_sari_uuid"/>
            </plIdentifier_tgn_provider>
            <plIdentifier_tgnURI>
                <!--<xsl:value-of select="pr:pl_nc_identifier_tgn"/>-->
				<xsl:value-of select="substring-after($tgn,'http://vocab.getty.edu/tgn/')"/>
            </plIdentifier_tgnURI>
            <!--Wikidata-->
            <plIdentifier_wikidata_provider>
                <xsl:value-of
                        select="pr:pl_nc_identifier_wikidata_provider/pr:generic_contributor/pr:generic_contributor_sari_uuid"/>
            </plIdentifier_wikidata_provider>
            <plIdentifier_wikidataURI>
                <!--<xsl:value-of select="pr:pl_nc_identifier_wikidata"/>-->
				<xsl:value-of select="substring-after($wikidata,'https://www.wikidata.org/entity/')"/>
            </plIdentifier_wikidataURI>
            <!--Geonames-->
            <plIdentifier_geonames_provider>
                <xsl:value-of
                        select="pr:pl_nc_identifier_geonames_provider/pr:generic_contributor/pr:generic_contributor_sari_uuid"/>
            </plIdentifier_geonames_provider>
            <plIdentifier_geonamesURI>
                <!--<xsl:value-of select="pr:pl_nc_identifier_geonames"/>-->
				<xsl:value-of select="substring-after($geonames,'https://www.geonames.org/')"/>
            </plIdentifier_geonamesURI>
            <!--GND-->
            <plIdentifier_gnd_provider>
                <xsl:value-of
                        select="pr:pl_nc_identifier_gnd_provider/pr:generic_contributor/pr:generic_contributor_sari_uuid"/>
            </plIdentifier_gnd_provider>
            <plIdentifier_gndURI>
                <!--<xsl:value-of select="pr:pl_nc_identifier_gnd"/>-->
				<xsl:value-of select="substring-after($gnd,'http://d-nb.info/gnd/')"/>
            </plIdentifier_gndURI>
            <!--DbPedia-->
            <plIdentifier_dbpedia_provider>
                <xsl:value-of
                        select="pr:pl_nc_identifier_dbpedia_provider/pr:generic_contributor/pr:generic_contributor_sari_uuid"/>
            </plIdentifier_dbpedia_provider>
            <plIdentifier_dbpediaURI>
                <!--<xsl:value-of select="pr:pl_nc_identifier_dbpedia"/>-->
				<xsl:value-of select="substring-after($dbpedia,'http://dbpedia.org/resource/')"/>
            </plIdentifier_dbpediaURI>
            <!--VIAF-->
            <plIdentifier_viaf_provider>
                <xsl:value-of
                        select="pr:pl_nc_identifier_viaf_provider/pr:generic_contributor/pr:generic_contributor_sari_uuid"/>
            </plIdentifier_viaf_provider>
            <plIdentifier_viafURI>
                <!--<xsl:value-of select="pr:pl_nc_identifier_viaf"/>-->
				<xsl:value-of select="substring-after($viaf,'http://viaf.org/viaf/')"/>
            </plIdentifier_viafURI>
        </entry>
    </xsl:template>
</xsl:stylesheet>
