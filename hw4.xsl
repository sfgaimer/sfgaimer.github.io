<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:template match="/">

<html>
<head>
<title>ABC
</title>
<style>
img {
  display: block;
  margin-left: auto;
  margin-right: auto;
}
</style>
</head>
<body>
<h1>ABC Financial Startup</h1>
<img src="financialstartup.jpg" alt="FS" />
<xsl:variable name="MAXYEAR">
	<xsl:for-each select="Accounts/Client">
	  <xsl:sort select="Year" data-type="number" order="descending"/>
	  <xsl:if test="position()='1'">
		<xsl:value-of select="number(Year)" />
	  </xsl:if>
	</xsl:for-each>
</xsl:variable>
<p> 

We are a very strong financial manager company and we are proud of our clients <br></br>
We have started with <xsl:value-of select="count(/Accounts/Client/Year[.=$MAXYEAR])"/> client
<xsl:if test="count(/Accounts/Client/Year[.=$MAXYEAR]) > 1">
 s
</xsl:if>
a little bit more than <xsl:copy-of select="$MAXYEAR"/> years ago and now we have <xsl:value-of select="count(/Accounts/Client)"/> clients!<br></br>
These are our clients:
<xsl:for-each select="Accounts/Client">
	<xsl:sort select="Name/Last"/>
	<xsl:value-of select="Name" /> 
	<xsl:choose>
		<xsl:when test="position()=last()">
			.<br></br>
		</xsl:when>
		<xsl:when test="position()=(last()-1)">
			, and
		</xsl:when>	
		<xsl:otherwise>	
			,
		</xsl:otherwise>		
	</xsl:choose>
</xsl:for-each> 
<xsl:value-of select="count(/Accounts/Client/Year[.>=7])"/> of our clients
<xsl:choose>
	<xsl:when test="count(/Accounts/Client/Year[.>=7]) > 1">
		are
	</xsl:when>
	<xsl:otherwise>	
		is
	</xsl:otherwise>
</xsl:choose>
with us for more than 7 years
</p>
</body></html>
</xsl:template>
</xsl:stylesheet>