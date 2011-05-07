<?xml version="1.0" encoding='utf8'?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="text"/>
<xsl:template match="/">
<xsl:for-each select='//table[@class="SearchResultsTable Table"]//td/a[@class="lnk"]'>
<xsl:value-of select="@href"/>
<xsl:text>
</xsl:text>
</xsl:for-each>
</xsl:template>


</xsl:stylesheet>
