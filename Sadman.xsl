<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:foo="http://www.foo.org/" xmlns:bar="http://www.bar.org">
<xsl:template match="/">
  <html>
  <body>
  <h2>Netflix Project</h2>
  <h3>5 video files available in Netflix are sorted by title name in this table. This table also contains other infromation about the video. If the video is recommended 80% and over, its cell is green. If the movie has popularity 60 or less, its cell is red.</h3>
    <table border="1">
      <tr bgcolor="white">
        <th>Title</th>
        <th>Director</th>
        <th>Quality</th>
        <th>Size</th>
        <th>IMDB</th>
        <th>Netflix rating</th>
        <th>Recommended</th>
        <th>Popularity</th>
      </tr>
      <xsl:for-each select="netflix/video">
        <xsl:sort select="title" />
      <tr>
        <td><xsl:value-of select="title"/></td>
        <td><xsl:value-of select="director"/></td>
        <td><xsl:value-of select="quality"/></td>
        <td><xsl:value-of select="size"/></td>
        <td><xsl:value-of select="ratings/imdb"/></td>
        <td><xsl:value-of select="ratings/netflix"/></td>
        <xsl:choose>
            <xsl:when test="recommendation>79">
                <td style="background-color:green">
                    <xsl:value-of select="recommendation" />
                </td>
            </xsl:when>
            <xsl:otherwise>
                <td>
                    <xsl:value-of select="recommendation" />
                </td>
            </xsl:otherwise>
        </xsl:choose>
        <xsl:choose>
            <xsl:when test="popularity>60">
                <td>
                    <xsl:value-of select="popularity" />
                </td>
            </xsl:when>
            <xsl:otherwise>
                <td  style="background-color:red">
                    <xsl:value-of select="popularity" />
                </td>
            </xsl:otherwise>
        </xsl:choose>
      </tr>
      </xsl:for-each>
    </table>
  </body>
  </html>
</xsl:template>
</xsl:stylesheet>