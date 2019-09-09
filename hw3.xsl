<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<xsl:template match="/">
<html>
<head>
<title>My store
</title>
</head>
<body>
<h1>List of Clients</h1>
<table border="1" bordercolor="Blue">
    <tr background-color="White" bordercolor="Blue">
      <th>Name</th>
      <th>Phone</th>
	  <th>Email</th>
	  <th>Account Total</th>
    </tr>
	<xsl:for-each select="Accounts/Client">
	<xsl:sort select="Name/Last"/>
    <tr bordercolor="Blue">
      <td><xsl:value-of select="Name"/></td>
      <td><xsl:value-of select="Phone"/></td>
	  <td><xsl:value-of select="E-mail"/></td>
	  <xsl:if test="number(translate(Account_Total,'$','')) &lt;= number(80000)">
        <td style="color:red;" align="right"> <xsl:value-of select="number(translate(Account_Total,'$',''))"/></td>
      </xsl:if>
	  <xsl:if test="number(translate(Account_Total,'$','')) >  number(80000)">
		<td align="right"><xsl:value-of select="number(translate(Account_Total,'$',''))"/></td>
	  </xsl:if>

    </tr>
	</xsl:for-each>
  </table>
</body></html>
</xsl:template>
</xsl:stylesheet>