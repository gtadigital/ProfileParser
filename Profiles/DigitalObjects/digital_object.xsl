<?xml version="1.0" encoding="UTF-8"?>
<!-- author: ETH Zurich, gta digital, Thomas Hänsli -->
<!-- license: please refer to the license.txt file in our git repository (https://github.com/gtadigital/XSLT) -->

<!-- Note: this xsl allows extraction of diret links to the asset repository (EasyDB Asset Server) from EasyDB output.-->
<!-- See readme file for additional information abd sample .rdf  -->

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
	<xsl:template match="pr:objects/pr:do">
		<entry> 
			<do_system_object_id>
				<xsl:value-of select="pr:_system_object_id"/>
			</do_system_object_id>
			<do_object_id>
				<xsl:value-of select="pr:_id"/>
			</do_object_id>
        	<do_timestamp_created>
				<xsl:value-of select="pr:_created"/>
			</do_timestamp_created>
            <do_timestamp_modified>
				<xsl:value-of select="pr:_last_modified"/>
			</do_timestamp_modified>

        	<do_small_url>  
                <xsl:value-of select="pr:do_digitalobject/pr:files/pr:file/pr:versions/pr:version[@name='small']/pr:url"/>
            </do_small_url>

            <do_preview_url>  
                <xsl:value-of select="pr:do_digitalobject/pr:files/pr:file/pr:versions/pr:version[@name='preview']/pr:url"/>
            </do_preview_url>

            <do_original_url>  
                <xsl:value-of select="pr:do_digitalobject/pr:files/pr:file/pr:versions/pr:version[@name='original']/pr:url"/>
            </do_original_url>

            <do_huge_url>  
                <xsl:value-of select="pr:do_digitalobject/pr:files/pr:file/pr:versions/pr:version[@name='huge']/pr:url"/>
            </do_huge_url>

           <do_full_url>  
                <xsl:value-of select="pr:do_digitalobject/pr:files/pr:file/pr:versions/pr:version[@name='full']/pr:url"/>
            </do_full_url>


            <do_small_download_url>  
                <xsl:value-of select="pr:do_digitalobject/pr:files/pr:file/pr:versions/pr:version[@name='small']/pr:download_url"/>
            </do_small_download_url>

            <do_preview_download_url>  
                <xsl:value-of select="pr:do_digitalobject/pr:files/pr:file/pr:versions/pr:version[@name='preview']/pr:download_url"/>
            </do_preview_download_url>

            <do_original_download_url>  
                <xsl:value-of select="pr:do_digitalobject/pr:files/pr:file/pr:versions/pr:version[@name='original']/pr:download_url"/>
            </do_original_download_url>

            <do_huge_download_url>  
                <xsl:value-of select="pr:do_digitalobject/pr:files/pr:file/pr:versions/pr:version[@name='huge']/pr:download_url"/>
            </do_huge_download_url>

           <do_full_download_url>  
                <xsl:value-of select="pr:do_digitalobject/pr:files/pr:file/pr:versions/pr:version[@name='full']/pr:download_url"/>
            </do_full_download_url>


		</entry> 
	</xsl:template>
</xsl:stylesheet>


