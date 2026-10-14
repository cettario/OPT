<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" encoding="UTF-8" indent="yes"/>
  <xsl:key name="byTeacher" match="course" use="teachers/teacher"/>
  <xsl:key name="byKeyword" match="course" use="keywords/keyword"/>
  <xsl:template match="/courses">
    <html lang="ru">
      <head>
        <meta charset="UTF-8"/>
        <title>Наши курсы</title>
      </head>
      <body>
        <h1>Наши курсы</h1>
        <h3>Курсы, которые читает Борисов И.О.</h3>
        <ul>
          <xsl:for-each select="key('byTeacher', 'Борисов И.О.')">
            <li><xsl:value-of select="title"/></li>
          </xsl:for-each>
        </ul>
        <h3>Курсы, в которых рассматривается XML</h3>
        <ul>
          <xsl:for-each select="key('byKeyword', 'XML')">
            <li><xsl:value-of select="title"/></li>
          </xsl:for-each>
        </ul>
        <h3>Курсы Борисова И.О., в которых рассматривается XSLT</h3>
        <ul>
          <xsl:for-each select="key('byTeacher', 'Борисов И.О.')[keywords/keyword = 'XSLT']">
            <li><xsl:value-of select="title"/></li>
          </xsl:for-each>
        </ul>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
