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
    <xsl:template match="pr:objects/pr:oeu">
        <entry>

            <_uuid>
                <xsl:value-of select="pr:_uuid"/>
            </_uuid>
            <_last_modified>
                <xsl:value-of select="pr:_last_modified"/>
            </_last_modified>
            <xsl:for-each select="pr:tags/pr:tag">
                <xsl:element name="oeu_tag">
                    <oeu_tag_de>
                        <xsl:value-of select="pr:name/pr:de-DE"/>
                    </oeu_tag_de>
                    <oeu_tag_en>
                        <xsl:value-of select="pr:name/pr:en-US"/>
                    </oeu_tag_en>
                </xsl:element>
            </xsl:for-each>

            <oeu_nc_name_de>
                <xsl:value-of select="pr:oeu_nc_name/pr:de-DE"/>
            </oeu_nc_name_de>
            <oeu_nc_name_en>
                <xsl:value-of select="pr:oeu_nc_name/pr:en-US"/>
            </oeu_nc_name_en>

            <xsl:for-each select="pr:_nested__oeu__oeu_archive_nc_alt_name">
                <xsl:element name="oeu_altName">
                    <xsl:for-each select="pr:oeu__oeu_archive_nc_alt_name">
                        <xsl:element name="oeu_alt_nameLiteral">
                            <oeu_nc_altname_literal>
                                <xsl:value-of select="pr:oeu_archive_nc_alt_name_literal"/>
                            </oeu_nc_altname_literal>
                            <xsl:element name="oeu_alt_name_lan">
                                <oeu_archive_nc_alt_name_lang_de>
                                    <xsl:value-of
                                            select="pr:oeu_archive_nc_alt_name_lang/pr:generic_lang/pr:_standard/pr:de-DE"/>
                                </oeu_archive_nc_alt_name_lang_de>
                                <oeu_archive_nc_alt_name_lang_en>
                                    <xsl:value-of
                                            select="pr:oeu_archive_nc_alt_name_lang/pr:generic_lang/pr:_standard/pr:en-US"/>
                                </oeu_archive_nc_alt_name_lang_en>
                                <oeu_archive_nc_alt_name_lang_it>
                                    <xsl:value-of
                                            select="pr:oeu_archive_nc_alt_name_lang/pr:generic_lang/pr:_standard/pr:it-IT"/>
                                </oeu_archive_nc_alt_name_lang_it>
                                <oeu_archive_nc_alt_name_lang_fr>
                                    <xsl:value-of
                                            select="pr:oeu_archive_nc_alt_name_lang/pr:generic_lang/pr:_standard/pr:fr-FR"/>
                                </oeu_archive_nc_alt_name_lang_fr>
                            </xsl:element>
                        </xsl:element>
                    </xsl:for-each>
                    <oeu_nc_altname_uuid>
                        <xsl:value-of select="pr:oeu__oeu_archive_nc_alt_name/pr:oeu_archive_nc_alt_name_used_by/pr:act/pr:_uuid"></xsl:value-of>
                    </oeu_nc_altname_uuid>
                    <oeu_name_used_timespan_from>
                        <xsl:value-of select="pr:oeu__oeu_archive_nc_alt_name/pr:oeu_archive_nc_alt_name_used_timespan/pr:from"></xsl:value-of>
                    </oeu_name_used_timespan_from>
                    <oeu_name_used_timespan_to>
                        <xsl:value-of select="pr:oeu__oeu_archive_nc_alt_name/pr:oeu_archive_nc_alt_name_used_timespan/pr:to"></xsl:value-of>
                    </oeu_name_used_timespan_to>
                </xsl:element>
            </xsl:for-each>
            <xsl:for-each select="pr:_nested__oeu__oeu_nc_identifier/pr:oeu__oeu_nc_identifier">
                <xsl:element name="oeu__oeu_nc_identifier">
                    <oeu_nc_identifier_literal>
                        <xsl:value-of select="pr:oeu_nc_identifier_literal"></xsl:value-of>
                    </oeu_nc_identifier_literal>
                    <xsl:for-each select="pr:oeu_nc_identifier_type/pr:generic_identifier_type/pr:_path/pr:generic_identifier_type">
                        <xsl:element name="oeu_generic_identifier_type">
                        <oeu_nc_generic_identifier_type_uuid>
                        <xsl:value-of select="pr:_uuid"></xsl:value-of>
                        </oeu_nc_generic_identifier_type_uuid>
                        </xsl:element>
                        <xsl:element name="oeu_generic_identifier_type_name">
                            <oeu_nc_generic_identifier_type_name>
                                <xsl:value-of select="pr:_standard/pr:en-US"></xsl:value-of>
                            </oeu_nc_generic_identifier_type_name>
                        </xsl:element>

                    </xsl:for-each>
                    <oeu_nc_identifier_usedby_uuid>
                    <xsl:value-of select="pr:oeu_nc_identifier_usedby/pr:act/pr:_uuid"></xsl:value-of>
                    </oeu_nc_identifier_usedby_uuid>
                </xsl:element>
            </xsl:for-each>
        </entry>
    </xsl:template>
</xsl:stylesheet>
