<?xml version='1.0' encoding='utf-8' ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <xsl:output method="html" indent="yes" />

  <!-- Main template -->
  <xsl:template match="/">

    <!-- Outputs the HTML5 doctype header -->
    <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>

    <!-- Display the command name as the browser window title -->
    <html>
    <head>
    <!-- xsltproc doesn't close the meta tag when in html mode, so we have
         create our own closing tag manually -->
    <xsl:text disable-output-escaping="yes">&lt;/meta&gt;</xsl:text>
    <title><xsl:value-of select="/command/name" /></title></head>

    <!-- Output the name of the command -->
    <body>
      <h1><xsl:value-of select="/command/name" /></h1>

      <!-- Output the command description -->
      <span>
        <xsl:apply-templates select="/command/description" />
      </span>

      <!-- Main content -->
      <xsl:apply-templates select="/command/usage" />
      <xsl:apply-templates select="/command/options" />
      <xsl:apply-templates select="/command/availability" />
      <xsl:apply-templates select="/command/notes" />
      <xsl:apply-templates select="/command/usageexamples" />
      <xsl:apply-templates select="/command/fullcontextexample" />
      <xsl:apply-templates select="/command/seealso" />

    <!-- End of Main template -->
    </body>
    </html>
  </xsl:template>


  <!-- Usage template -->
  <xsl:template match="usage" >
    <section>
      <h2>Usage</h2>
      <strong><xsl:value-of select="/command/name" /></strong>
      <strong><xsl:value-of select="/command/usage/parameter" /></strong>
      <strong><xsl:value-of select="/command/usage/value" /></strong>
    </section>
  </xsl:template>

  <!-- Options template -->
  <xsl:template match="options">
    <section>
      <h2>Options</h2>
      <table>
        <tr>
          <th>Name</th>
          <th>Required?</th>
          <th>Description</th>
        </tr>
        <xsl:for-each select="/command/options/parameter">
          <tr>
            <td>
              <xsl:value-of select="keyword" />
              <xsl:text>&amp;nbsp;</xsl:text>
              <xsl:value-of select="value" />
            </td>
            <td>
              <xsl:value-of select="@requirement" />
            </td>
            <td>
              <xsl:for-each select="description">
                <xsl:apply-templates />
              </xsl:for-each>
            </td>
          </tr>
        </xsl:for-each>
      </table>
    </section>
  </xsl:template>

  <!-- Availability template -->
  <xsl:template match="availability">
    <section>
      <h2>Availability</h2>
      Available from libvirt <xsl:value-of select="/command/availability/@version" /> onwards
    </section>
  </xsl:template>

  <!-- Notes template -->
  <xsl:template match="notes">
    <section>
      <xsl:choose>
        <xsl:when test="/command/notes = ''">
          <h2>Platform or Hypervisor specific notes</h2>
          <em>None yet</em>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="/command/notes" />
        </xsl:otherwise>
      </xsl:choose>
    </section>
  </xsl:template>

  <!-- Usage examples template -->
  <xsl:template name="usageexamples">
    <section>
      <h2>Examples</h2>
      <xsl:for-each select="/command/usageexamples/example">
        <xsl:apply-templates />
      </xsl:for-each>
    </section>
  </xsl:template>

  <!-- Full context examples template -->
  <xsl:template name="fullcontextexample">
    <section>
      <h2>Example in context</h2>
      <xsl:for-each select="/command/fullcontextexample/example">
        <xsl:apply-templates />
      </xsl:for-each>
    </section>
  </xsl:template>


  <!-- See also template -->
  <xsl:template match="seealso">
    <section>
      <h2>See also</h2>
      <ul>
        <xsl:for-each select="/command/seealso/item">
          <li>
            <xsl:apply-templates select="link" /> -
            <xsl:apply-templates select="description" />
          </li>
        </xsl:for-each>
      </ul>
    </section>
  </xsl:template>

  <!-- Tag template for terminal/screen text -->
  <xsl:template match="terminal">
<pre><xsl:apply-templates /></pre>
  </xsl:template>

  <!-- Tag template for bold text -->
  <xsl:template match="bold">
<strong><xsl:apply-templates /></strong>
  </xsl:template>

  <!-- Tag template for bold italic text -->
  <xsl:template match="bolditalic">
<strong><em><xsl:apply-templates /></em></strong>
  </xsl:template>

  <!-- Tag template for highlighted text -->
  <xsl:template match="highlight">
<strong>&lt;-- <xsl:value-of select="." /></strong>
  </xsl:template>

  <!-- Tag template for italic text -->
  <xsl:template match="italic">
<em><xsl:apply-templates /></em>
  </xsl:template>

  <!-- Tag template for links -->
  <xsl:template match="link">
    <xsl:text disable-output-escaping="yes">&lt;a href="</xsl:text>
    <xsl:value-of select="@href" disable-output-escaping="yes" />
    <xsl:text disable-output-escaping="yes">.html"&gt;</xsl:text>
    <xsl:choose>
      <xsl:when test="text()">
        <xsl:value-of select="." disable-output-escaping="yes" />
        <xsl:text disable-output-escaping="yes">&lt;/a&gt;</xsl:text>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="@href" disable-output-escaping="yes" />.html<xsl:text disable-output-escaping="yes">&lt;/a&gt;</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <!-- Tag template for para -->
  <xsl:template match="para">
    <div>
      <xsl:apply-templates />
    </div>
  </xsl:template>

  <!-- Tag template for value -->
  <xsl:template match="value">
    <em><xsl:value-of select="." /></em>
  </xsl:template>

</xsl:stylesheet>