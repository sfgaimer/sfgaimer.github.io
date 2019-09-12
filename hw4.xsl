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
We have started with <xsl:value-of select="count(/Accounts/Client/Year[.=$MAXYEAR])"/> client a little bit more than <xsl:copy-of select="$MAXYEAR"/> years and now we have <xsl:value-of select="count(/Accounts/Client)"/> clients!<br></br>
These are our clients:
<xsl:for-each select="Accounts/Client">
	<xsl:sort select="Name/Last"/>
	<xsl:value-of select="Name" /> 
	<xsl:if test="position()=last()">
		.<br></br>
	</xsl:if>
	<xsl:if test="position()=(last()-1)">
		and
	</xsl:if>
	<xsl:if test="position()>=1 and (last() - 1) > position()">
		,
	</xsl:if>
</xsl:for-each> 
<xsl:value-of select="count(/Accounts/Client/Year[.>=7])"/> Of our clients are with us for more than 7 years
</p>
</body></html>
</xsl:template>
</xsl:stylesheet>