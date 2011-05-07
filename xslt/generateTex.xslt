<?xml version="1.0" encoding='utf8'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="text" encoding="utf8"/>
<xsl:template match='/'>
<xsl:for-each select="//cache">
\section*{<xsl:apply-templates select="name"/>\hfill <xsl:value-of select="code"/>}
\addcontentsline{toc}{section}{<xsl:value-of select="code"/>: <xsl:apply-templates select="name"/>}
Difficulty/Terrain: <xsl:value-of select="difficulty"/>/<xsl:value-of select="terrain"/>, <xsl:value-of select="size"/> size, <xsl:value-of select="type"/>\\ 
Location: <xsl:apply-templates select="location"/>\\
Hidden on <xsl:apply-templates select="hidden"/> \ by <xsl:apply-templates select="author"/>. Found <xsl:apply-templates select="visits"/> times (last on <xsl:apply-templates select="last-visit"/>)

<xsl:if test="warning!=''">
<xsl:apply-templates select="warning"/>
</xsl:if>

\paragraph{Short description:} <xsl:apply-templates select="short-description"/>

\paragraph{Long description:} <xsl:apply-templates select="long-description" />

\paragraph{Hints:}\ 
<xsl:apply-templates select='hints'/>

\begin{tabular}{|l|l|}
\hline
<xsl:for-each select="waypoint">
<xsl:apply-templates select="name"/>&amp;<xsl:apply-templates select="position"/>\\\hline
</xsl:for-each>
\end{tabular}

{
\vbox{
\paragraph{Notes:}\ \\
\\
\\
\\
\\
}}


\bigskip
\hrule
\bigskip
</xsl:for-each>
</xsl:template>

<xsl:template name="html-br" match="br">\\</xsl:template>

<xsl:template name="html-p" match="p"><xsl:apply-templates/>\\</xsl:template>

<xsl:template name="html-a" match="a"> {<xsl:apply-templates select="@href" />}{<xsl:apply-templates />} </xsl:template>

<xsl:template name="html-img" match="img"> 
\begin{wrapfigure}{l}{0.5\textwidth}
\includegraphics[width=0.5\textwidth]{../Web/www.geocaching.com/seek/<xsl:apply-templates select="@src" />}
\end{wrapfigure}
</xsl:template>


<xsl:template name="html-ul" match="ul">
<!--\begin{itemize}\setlength{\itemsep}{-2mm} -->
<xsl:apply-templates />
<!--\end{itemize} -->
</xsl:template>

<xsl:template name="html-li" match="li">$\bullet$ <xsl:apply-templates />\\</xsl:template>

<xsl:template name="html-h1" match="h1 | h2"> {\Large\sc <xsl:apply-templates />} </xsl:template>

<xsl:template name="escape" match="text() | @href">
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
      <xsl:value-of select='normalize-space(substring-before($s, $c))'/>
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
	<xsl:with-param name='s' select='normalize-space(substring-after($s, $c))'/>
      </xsl:call-template>
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select='$s'/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

</xsl:stylesheet>
