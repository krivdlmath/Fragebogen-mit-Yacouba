<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
version="1.0">
<xsl:template match="/">
<html>
<head><title>XML to HTML</title></head>
<body>
	<form>
		<xsl:for-each select="//.">
				<xsl:if test="name()='closedEndedQ'">
					<h2><xsl:value-of select='@id'/>.
						<xsl:value-of select='text'/></h2>
					<p><xsl:value-of select='qdescription'/></p>
					<xsl:for-each select='choices'>
						<xsl:choose>
							<xsl:when test="@mult='true'">
								<xsl:for-each select='choice'>
									<input type='checkbox'/>
									<xsl:value-of select='text'/>
									<br/>
								</xsl:for-each>
							</xsl:when>
							<xsl:when test="@mult='false'">
								<xsl:for-each select='choice'>
									<input type='radio' name='@id'/>
									<xsl:value-of select='text'/>
									<br/>
								</xsl:for-each>
							</xsl:when>
						</xsl:choose>
						<br/>
					</xsl:for-each>
				</xsl:if>
				<xsl:if test="name()='openendedMatrixQ'">
					<br/>
					<h2><xsl:value-of select='@id'/>.
						<xsl:value-of select='text'/></h2>
					<p><xsl:value-of select='qdescription'/></p>
						<xsl:for-each select='questions/question'>
								<p><xsl:value-of select='text'/> : <input type='textbox'/></p>
						</xsl:for-each>
				</xsl:if>
								<xsl:if test="name()='questionMatrixMult'">
					<br/>
					<h2><xsl:value-of select='@id'/>.
						<xsl:value-of select='text'/></h2>

					<table border="1">
					<tr>
						<th/>
						<xsl:for-each select='choices/choice'>
							<th>
								<xsl:value-of select='text'/>
							</th>
						</xsl:for-each>
					</tr>

					<xsl:for-each select='questions/question'>
						<xsl:variable name="id">
							<xsl:value-of select="@id"/>
						</xsl:variable>
						<tr>
							<td><xsl:value-of select='text'/></td>
							<td><input type='radio' name='{$id}'/></td>
							<td><input type='radio' name='{$id}'/></td>
							<td><input type='radio' name='{$id}'/></td>
							<td><input type='radio' name='{$id}'/></td>
							<td><input type='radio' name='{$id}'/></td>
						</tr>
					</xsl:for-each>
					</table>
				</xsl:if>

		</xsl:for-each>
		<br/>
		<input type="submit" value="Submit"/>
	</form>
</body>
</html>
</xsl:template>
</xsl:stylesheet>
