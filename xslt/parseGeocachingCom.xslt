<?xml version="1.0" encoding='utf8'?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="xml" version="1.0" encoding="utf8" indent="yes"/>
<xsl:template match="/">
<cache>
	<code><xsl:value-of select="//span[@class='GCCode']"/></code>
	<location><xsl:value-of select="//span[@id='ctl00_ContentBody_LatLon']"/></location>
	<name><xsl:value-of select="//span[@id='ctl00_ContentBody_CacheName']"/></name>
	<link>http://www.geocaching.com/seek/<xsl:value-of select="//form[@name='aspnetForm' and @id='aspnetForm']/@action"/></link>
	<type><xsl:value-of select="//td[@class='cacheImage']/a/img/@title"/></type>
	<author><xsl:value-of select="//td[@class='minorCacheDetails']/span[@class='minorCacheDetails' and substring(normalize-space(text()),1,10)='A cache by']/a"/></author>
	<hidden><xsl:value-of select="substring-after(normalize-space(//td[@class='minorCacheDetails']/span[@class='minorCacheDetails' and substring(normalize-space(text()),1,8)='Hidden :']),'Hidden : ')"/></hidden>
	
	<difficulty>
	<xsl:value-of select="substring-before(normalize-space(//span[@id='ctl00_ContentBody_uxLegendScale']/img/@alt),' out of')"/>
	</difficulty>

	<terrain><xsl:value-of select="substring-before(//span[@id='ctl00_ContentBody_Localize6']/img/@alt,' out of')"/></terrain>
	<size><xsl:value-of select="substring-after(substring-before(//span[@class='minorCacheDetails']/img[substring-before(@alt,':')='Size']/../small,')'),'(')"/></size>
	<hints><xsl:copy-of select="//div[@id='div_hint' and @class='HalfLeft']"/></hints>
	<hint-key><xsl:value-of select="//div[@class='DecryptionKeyWidget']/p[@class='WidgetBody']"/></hint-key>
	<short-description><xsl:copy-of select="//span[@id='ctl00_ContentBody_ShortDescription']"/></short-description>
	<long-description><xsl:copy-of select="//span[@id='ctl00_ContentBody_LongDescription']"/></long-description>
	<last-visit><xsl:value-of select="substring-before(normalize-space(//table[@class='LogsTable Table']/tr[1]/td | //table[@class='LogsTable Table']/tbody/tr[1]/td),' by ')"/></last-visit>
	<visits><xsl:value-of select="substring-before(normalize-space(//h3[contains(text(),'Logged Visits')]),' Logged Visits')"/></visits>
	<xsl:for-each select="//table[@id='ctl00_ContentBody_Waypoints']/tbody/tr[@ishidden='false']">
	<waypoint>
		<name><xsl:value-of select="td[6]/a"/></name>
		<position><xsl:value-of select="normalize-space(td[7])"/></position>
	</waypoint>
	</xsl:for-each>
</cache>
</xsl:template>


</xsl:stylesheet>
