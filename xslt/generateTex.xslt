<?xml version="1.0" encoding='utf8'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="text" encoding="utf8"/>
<xsl:template match='/'>
<xsl:for-each select="//cache">
\cacheid{<xsl:value-of select="code"/>}
\cachelocation{<xsl:value-of select="location"/>}
\cachename{<xsl:apply-templates select="name"/>}
\cachetype{<xsl:value-of select="type"/>}
\cacheauthor{<xsl:apply-templates select="author"/>}
\cachehidden{<xsl:value-of select="hidden"/>}
\cachedifficulty{<xsl:value-of select="difficulty"/>}
\cacheterrain{<xsl:value-of select="terrain"/>}
\cachesize{<xsl:value-of select="size"/>}
\cachehint{<xsl:apply-templates select="hints"/>}
\cachekey{<xsl:apply-templates select="hint-key"/>}
\cacheshortdesc{<xsl:apply-templates select="short-desctiption"/>}
\cachelongdesc{<xsl:apply-templates select="long-description" />}
\cachelastfound{<xsl:value-of select="last-visit"/>}
\cachevisits{<xsl:value-of select="visits"/>}
<xsl:for-each select="waypoint">
\cachewaypoints{<xsl:apply-templates select="name"/>}{<xsl:apply-templates select="location"/>}
</xsl:for-each>
\geocache
</xsl:for-each>
</xsl:template>

<xsl:template name="html-br" match="br">\htmlbr </xsl:template>

<xsl:template name="html-p" match="p">\htmlp{<xsl:apply-templates/>} <xsl:text>

</xsl:text>
</xsl:template>

<xsl:template name="html-a" match="a"> \htmla{<xsl:apply-templates select="@href" />}{<xsl:apply-templates />} </xsl:template>

<xsl:template name="html-img" match="img"> \htmlimg{<xsl:apply-templates select="@src" />} </xsl:template>

<xsl:template name="html-ul" match="ul">
\begin{itemize}
<xsl:apply-templates />
\end{itemize}
</xsl:template>

<xsl:template name="html-li" match="li">\item <xsl:apply-templates /></xsl:template>

<xsl:template name="html-h1" match="h1 | h2"> \htmlh{<xsl:apply-templates />} </xsl:template>

<xsl:template name="escape" match="text()">
  <!-- 
  per latex tutorial, the following need escaping: # $ % & ~ _ ^ \ { }
  -->

  <xsl:call-template name="esc">
    <xsl:with-param name="c" select='"#"'/>
    <xsl:with-param name="s">
      <xsl:call-template name="esc">
	<xsl:with-param name="c" select='"$"'/>
	<xsl:with-param name="s">
	  <xsl:call-template name="esc">
	    <xsl:with-param name="c" select='"%"'/>
	    <xsl:with-param name="s">
	      <xsl:call-template name="esc">
		<xsl:with-param name="c" select='"&amp;"'/>
		<xsl:with-param name="s">
		  <xsl:call-template name="esc">
		    <xsl:with-param name="c" select='"~"'/>
		    <xsl:with-param name="s">
		      <xsl:call-template name="esc">
			<xsl:with-param name="c" select='"_"'/>
			<xsl:with-param name="s">
			  <xsl:call-template name="esc">
			    <xsl:with-param name="c" select='"^"'/>
			    <xsl:with-param name="s">
			      <xsl:call-template name="esc">
				<xsl:with-param name="c" select='"{"'/>
				<xsl:with-param name="s">
				  <xsl:call-template name="esc">
				    <xsl:with-param name="c" select='"}"'/>
				    <xsl:with-param name="s">
				      <xsl:call-template name="esc">
					<xsl:with-param name="c" select='"\"'/>
					<xsl:with-param name="s" select='.'/>
				      </xsl:call-template>
				    </xsl:with-param>
				  </xsl:call-template>
				</xsl:with-param>
			      </xsl:call-template>
			    </xsl:with-param>
			  </xsl:call-template>
			</xsl:with-param>
		      </xsl:call-template>
		    </xsl:with-param>
		  </xsl:call-template>
		</xsl:with-param>
	      </xsl:call-template>
	    </xsl:with-param>
	  </xsl:call-template>
	</xsl:with-param>
      </xsl:call-template>
    </xsl:with-param>
  </xsl:call-template>
</xsl:template>

<xsl:template name="esc">
  <xsl:param name="s"/>
  <xsl:param name="c"/>

  <xsl:choose>
    <xsl:when test='contains($s, $c)'>
      <xsl:value-of select='substring-before($s, $c)'/>
      <xsl:text>\</xsl:text>

      <xsl:choose>
	<xsl:when test='$c = "\"'>
	  <xsl:text>textbackslash </xsl:text>
	</xsl:when>
	<xsl:otherwise>
	  <xsl:value-of select='$c'/>
	</xsl:otherwise>
      </xsl:choose>

      <xsl:call-template name="esc">
	<xsl:with-param name='c' select='$c'/>
	<xsl:with-param name='s' select='substring-after($s, $c)'/>
      </xsl:call-template>
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select='$s'/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

</xsl:stylesheet>
