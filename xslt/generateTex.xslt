<?xml version="1.0" encoding='utf8'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="text" encoding="utf8"/>
<xsl:template match='/'>
<xsl:for-each select="//cache">
\geocache{<xsl:value-of select="code"/>}\
{<xsl:value-of select="location"/>}\
{<xsl:value-of select="name"/>}\
{<xsl:value-of select="type"/>}\
{<xsl:value-of select="author"/>}\
{<xsl:value-of select="hidden"/>}\
{<xsl:value-of select="difficulty"/>}\
{<xsl:value-of select="terrain"/>}\
{<xsl:value-of select="size"/>}\
{<xsl:value-of select="hints"/>}\
{<xsl:value-of select="hint-key"/>}\
{<xsl:value-of select="short-desctiption"/>}\
{<xsl:value-of select="long-description"/>}\
{<xsl:value-of select="last-visit"/>}\
{<xsl:value-of select="visits"/>}\
{<xsl:value-of select="waypoint"/>}
</xsl:for-each>
</xsl:template>
</xsl:stylesheet>
