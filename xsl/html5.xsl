<?xml version='1.0' encoding='utf-8' ?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <xsl:output method="xml" indent="yes" />

  <!-- Main template -->
  <xsl:template match="/">

    <!-- Outputs the HTML5 doctype header -->
    <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;
</xsl:text>

    <!-- Display the command name as the browser window title -->
    <html>
    <head>
    <meta charset="UTF-8" />

    <!-- Display the command name as the browser window title -->
      <title><xsl:value-of select="/command/name" /></title>

      <!-- Hard code some example CSS attributes (for now) -->
      <style type="text/css">
        <xsl:comment>
          body           { font-family: "Lucida Sans Unicode",
                                        "Lucida Grande",
                                         sans-serif; }
          div.usage      { padding-bottom: 1.5em;
                           border-bottom:1px dashed gray; }
          h1             { text-shadow: #7485BC 5px 5px 10px; }
          h2             { text-decoration: underline; }
          table          { border-spacing: 10px 5px; }
          td             { border-top:1px solid gray;
                           padding: 0.5em;
                           vertical-align: top; }
          td.description { border-left:1px solid gray;
                           width: 50%; }
          td.required    { border-left:1px solid gray;
                           text-align: center;
                           width: 20%; }
          th.description { width: 50%; }
          th.name        { text-align: left;
                           width: 30%; }
          th.required    { text-align: center;
                           width: 20%; }
          .command       { font-weight: 700; }
          .description   { color: black; }
          .highlight     { color:blue; }
          .italic        { font-style: italic; }
          .parameter     { font-style: italic;
                           font-weight: 700; }
          .section       { margin-left: 10px;
                           max-width: 90%; }
          .terminal      { -moz-border-radius: 6px;
                           background-color: Gainsboro; 
                           border: white 1px;
                           border-radius: 6px;
                           font-family: "Courier New",
                                         Courier,
                                         monospace;
                           padding: 10px; }
          .text          { line-height: 1.5; }
          .value         { font-style: italic; }
        </xsl:comment>
      </style>
    </head>

    <!-- Output the name of the command -->
    <body>
      <h1><xsl:value-of select="/command/name" /></h1>

      <!-- Output the command description -->
      <xsl:choose>
        <xsl:when test="/command/description != ''">
          <span>
            <xsl:apply-templates select="/command/description" />
          </span>
        </xsl:when>
      </xsl:choose>

      <!-- Output the command usage -->
      <h2>Usage</h2>
      <section class="section">
        <xsl:choose>
          <xsl:when test="/command/options = ''">
            <span class="italic">Needs to be written</span>
          </xsl:when>
          <xsl:otherwise>
            <span class="command"><xsl:value-of select="/command/name" /></span>
            &#160;
            <xsl:for-each select="/command/options/parameter">
              <span class="parameter"><xsl:value-of select="keyword" /></span>
              &#160;
              <span class="value"><xsl:value-of select="value" /></span>
              &#160;
            </xsl:for-each>
          </xsl:otherwise>
        </xsl:choose>
      </section>

      <!-- Main content -->
      <xsl:apply-templates select="/command/options" />
      <xsl:apply-templates select="/command/availability" />
      <xsl:apply-templates select="/command/notes" />
      <xsl:apply-templates select="/command/examples[@type='usage']" />
      <xsl:apply-templates select="/command/examples[@type='fullcontext']" />
      <xsl:apply-templates select="/command/reference[@type='seealso']" />

    <!-- End of Main template -->
    </body>
    </html>
  </xsl:template>

  <!-- Options template -->
  <xsl:template match="options">
    <h2>Options</h2>
    <div class="section">
      <xsl:choose>
        <xsl:when test=". = ''">
          <span class="italic">Needs to be written</span>
        </xsl:when>
        <xsl:otherwise>
          <table width="100%">
            <tr class="heading">
              <th class="name">Name</th>
              <th class="required">Required?</th>
              <th class="description">Description</th>
            </tr>
            <xsl:for-each select="parameter">
              <tr>
                <td class="name">
                  <span class="parameter"><xsl:value-of select="keyword" /></span>
                  &#160;
                  <span class="value"><xsl:value-of select="value" /></span>
                </td>
                <td class="required">
                  <span class="requirement"><xsl:value-of select="@requirement" /></span>
                </td>
                <td class="description">
                  <xsl:for-each select="description">
                    <xsl:apply-templates />
                  </xsl:for-each>
                </td>
              </tr>
            </xsl:for-each>
          </table>
        </xsl:otherwise>
      </xsl:choose>
    </div>
  </xsl:template>

  <!-- Availability template -->
  <xsl:template match="availability">
    <h2>Availability</h2>
    <div class="section">
      <xsl:choose>
        <xsl:when test="@version = '0.0.0'">
          <span class="italic">Needs to be written</span>
        </xsl:when>
        <xsl:otherwise>
          <div class="text">
            Available from libvirt <xsl:value-of select="@version" /> onwards
          </div>
        </xsl:otherwise>
      </xsl:choose>
    </div>
  </xsl:template>

  <!-- Notes template -->
  <xsl:template match="notes">
    <h2>Platform or Hypervisor specific notes</h2>
    <div class="section">
      <xsl:choose>
        <xsl:when test=". = ''">
          <span class="italic">None yet</span>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="." />
        </xsl:otherwise>
      </xsl:choose>
    </div>
  </xsl:template>

  <!-- Usage examples template -->
  <xsl:template match="examples[@type='usage']">
    <h2>Usage examples</h2>
    <div class="section">
      <xsl:choose>
        <xsl:when test=". = ''">
          <span class="italic">Needs to be written</span>
        </xsl:when>
        <xsl:otherwise>
          <xsl:for-each select="example">
            <div class="usage">
              <xsl:apply-templates />
            </div>
          </xsl:for-each>
        </xsl:otherwise>
      </xsl:choose>
    </div>
  </xsl:template>

  <!-- Full context examples template -->
  <xsl:template match="examples[@type='fullcontext']">
    <h2>Example in context</h2>
    <div class="section">
      <xsl:choose>
        <xsl:when test=". = ''">
          <span class="italic">Needs to be written</span>
        </xsl:when>
        <xsl:otherwise>
          <xsl:for-each select="example">
            <div class="context">
              <xsl:apply-templates />
            </div>
          </xsl:for-each>
        </xsl:otherwise>
      </xsl:choose>
    </div>
  </xsl:template>


  <!-- See also template -->
  <xsl:template match="reference[@type='seealso']">
    <h2>See also</h2>
    <div class="section">
      <xsl:choose>
        <xsl:when test=". = ''">
          <span class="italic">Needs to be written</span>
        </xsl:when>
        <xsl:otherwise>
          <ul>
            <xsl:for-each select="item">
              <li>
                <xsl:apply-templates select="link" /> -
                <xsl:apply-templates select="description" />
              </li>
            </xsl:for-each>
          </ul>
        </xsl:otherwise>
      </xsl:choose>
    </div>
  </xsl:template>

  <!-- Tag template for terminal/screen text -->
  <xsl:template match="terminal">
<pre class="terminal"><xsl:apply-templates /></pre>
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
  <xsl:template match="highlight">&#160;&#160;&#160;&#160;<span class="highlight"><strong>&lt;-- <xsl:value-of select="." /></strong></span>
  </xsl:template>

  <!-- Tag template for italic text -->
  <xsl:template match="italic">
<span class="italic"><xsl:apply-templates /></span>
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
        <xsl:value-of select="@href" disable-output-escaping="yes" /><xsl:text disable-output-escaping="yes">&lt;/a&gt;</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <!-- Tag template for text -->
  <xsl:template match="text">
    <div class="text">
      <xsl:apply-templates />
    </div>
  </xsl:template>

  <!-- Tag template for value -->
  <xsl:template match="value">
    <span class="value"><xsl:value-of select="." /></span>
  </xsl:template>

</xsl:stylesheet>