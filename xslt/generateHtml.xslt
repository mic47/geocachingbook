<?xml version="1.0" encoding='utf8'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="utf8" indent="yes"/>
<xsl:template match='/'>
<xsl:for-each select="//cache">
<html>
<head>
<title>
<xsl:value-of select="code"/>:	<xsl:value-of select="name"/>
</title>
</head>
<body>

<div class="CCache">
	<h2 class="chapter">
		<xsl:value-of select="code"/>:
		<xsl:value-of select="name"/>
	</h2>
	
	Difficulty/Terrain: <xsl:value-of select="difficulty"/>/<xsl:value-of select="terrain"/>, <xsl:value-of select="size"/> size, <xsl:value-of select="type"/> <br/>
	Location: <xsl:value-of select="location"/><br/>
	Hidden on <xsl:value-of select="hidden"/> by <xsl:value-of select="author"/>. Found <xsl:value-of select="visits"/> times (last on <xsl:value-of select="last-visit"/>)<br/>
	<xsl:if test="warning!=''">
	<xsl:copy-of select="warning"/>
	</xsl:if>

	<b>Short description:</b> <xsl:copy-of select="short-description"/><br/><br/>
	<b>Long description:</b> <xsl:copy-of select="long-description" /><br/><br/>
	<b>Hints:</b> <xsl:copy-of select='hints'/><br/><br/>
	<xsl:if test="waypoint!=''">
	<table>
		<tr>
			<td><b>Name</b></td>
			<td><b>Position</b></td>
		</tr>
		<xsl:for-each select="waypoint">
		<tr>
			<td><xsl:copy-of select="name"/></td>
			<td><xsl:copy-of select="position"/></td>
		</tr>
		</xsl:for-each>

	</table>
	<div style="height: 200px;">
	<b>Notes:</b>
	</div>
	</xsl:if>

</div>
</body>
</html>
</xsl:for-each>
</xsl:template>


</xsl:stylesheet>
