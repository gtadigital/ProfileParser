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
    <!--<xsl:variable name="IIIF-locator" select="pr:do_loc_locator " />-->
 
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
                            <xsl:value-of select="pr:do_existence_creation_date/pr:from"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </do_production_time_span_from>
                <do_production_time_span_to>
                    <xsl:choose>
                        <xsl:when test="string-length(pr:do_existence_creation_date/pr:to) = 4">
                            <xsl:value-of select="concat(pr:do_existence_creation_date/pr:to,'-12-31')"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="pr:do_existence_creation_date/pr:to"/>
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
                                    <xsl:value-of select="pr:do_existence_modification_date/pr:from"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </do_modification_time_span_from>
                        <do_modification_time_span_to>
                            <xsl:choose>
                                <xsl:when test="string-length(pr:do_existence_modification_date/pr:to) = 4">
                                    <xsl:value-of select="concat(pr:do_existence_modification_date/pr:to,'-12-31')"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="pr:do_existence_modification_date/pr:to"/>
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
            <!-- IIIF SPEC
            <do_locator>
                <xsl:value-of select="substring-after($IIIF-locator,'https://iiif.gta.arch.ethz.ch/iiif/2/')"/>
            </do_locator>
            <do_locator_type>
                <xsl:value-of select ="pr:do_loc_locator_type/pr:en-US"/>
            </do_locator_type>-->
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
</xsl:stylesheet>
