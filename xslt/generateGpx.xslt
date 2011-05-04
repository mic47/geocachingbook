<?xml version="1.0" encoding='utf8'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="xml" version="1.0" encoding="utf8" indent="yes"/>
<xsl:template match='/'>
<gpx creator="Mic47" version="1.1" xmlns="http://www.topografix.com/GPX/1/1" xmlns:groundspeak="http://www.groundspeak.com/cache/1/1">
	<metadata/>
<xsl:for-each select="//cache">
	<wpt >
		<xsl:attribute name="lat">
			<xsl:value-of select='substring-before(location," ")'/>
		</xsl:attribute>
		<xsl:attribute name="lon">
			<xsl:value-of select='substring-after(location," ")'/>
		</xsl:attribute>
		<name><xsl:value-of select="code"/></name>
		<cmt><xsl:value-of select="name"/></cmt>
		<desc><xsl:value-of select="name"/></desc>
		<sym>Geocache</sym>
		<type>Geocache</type>
	</wpt>
</xsl:for-each>
</gpx>
</xsl:template>
</xsl:stylesheet>
