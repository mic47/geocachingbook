<?xml version="1.0" encoding='utf8'?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="text" encoding="utf8"/>
<xsl:strip-space elements="type" />
<xsl:template match="/">
<xsl:value-of select="//type"/>
<xsl:text>
</xsl:text>
</xsl:template>


</xsl:stylesheet>
