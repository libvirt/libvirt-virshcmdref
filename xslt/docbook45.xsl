<?xml version="1.0" ?>

<xsl:transform version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:fn="http://www.w3.org/2005/xpath-functions">

  <!-- The result is in XML -->
  <xsl:output method="xml" encoding="UTF-8" indent="yes" />

  <!-- Start of the DocBook 4.5 output -->
  <xsl:template match="/">

  <!-- Outputs the DocBook 4.5 header -->
  <xsl:text disable-output-escaping="yes">
&lt;!DOCTYPE chapter PUBLIC "-//OASIS//DTD DocBook XML V4.5//EN" "http://www.oasis-open.org/docbook/xml/4.5/docbookx.dtd" [
&lt;!ENTITY % BOOK_ENTITIES SYSTEM "Virsh_Command_Reference.ent"&gt;
%BOOK_ENTITIES;
]&gt;
</xsl:text>

  <!-- Starts the main document processing, so we can pull variables
       out of the source doc
    -->
  <xsl:for-each select="command">


    <!-- Outputs the top section header:
           <section id="sect-net-uuid" xreflabel="net-uuid">
      -->
    <xsl:text disable-output-escaping="yes">&lt;section id="sect-</xsl:text>
    <xsl:value-of select="name" />
    <xsl:text disable-output-escaping="yes">" xreflabel="</xsl:text>
    <xsl:value-of select="name" />
    <xsl:text disable-output-escaping="yes">"&gt;</xsl:text>


    <!-- Output the title element:
           <title>net-uuid</title>
      -->
    <xsl:text disable-output-escaping="yes">
  &lt;title&gt;</xsl:text>
    <xsl:value-of select="name" />
    <xsl:text disable-output-escaping="yes">&lt;/title&gt;

  </xsl:text>


    <!-- Output the command description:
           <para>
             When given a network name, returns its corresponding UUID 
           </para>
      -->
    <xsl:text disable-output-escaping="yes">&lt;para&gt;</xsl:text>
    <xsl:value-of select="description" />
    <xsl:text disable-output-escaping="yes">&lt;/para&gt;</xsl:text>


    <!-- Begin the DocBook variable list, used to divide the page sections
      -->
    <xsl:text disable-output-escaping="yes">

  &lt;variablelist&gt;</xsl:text>


    <!-- Outputs the command Usage section -->
    <xsl:text disable-output-escaping="yes">
    &lt;varlistentry&gt;
      &lt;term&gt;Usage&lt;/term&gt;
      &lt;listitem&gt;
        &lt;para&gt;
          &lt;command&gt;</xsl:text>
          <xsl:value-of select="name" />
          <xsl:text disable-output-escaping="yes">&lt;/command&gt;
          &lt;parameter&gt;</xsl:text>
          <xsl:value-of select="usage/parameter" />
          <xsl:text disable-output-escaping="yes">&lt;/parameter&gt;
          &lt;replaceable&gt;</xsl:text>
          <xsl:value-of select="usage/value" />
          <xsl:text disable-output-escaping="yes">&lt;/replaceable&gt;
        &lt;/para&gt;
      &lt;/listitem&gt;</xsl:text>
    <xsl:text disable-output-escaping="yes">
    &lt;/varlistentry&gt;</xsl:text>


    <!-- Outputs the Options section 
      -->
    <xsl:text disable-output-escaping="yes">

    &lt;varlistentry&gt;
      &lt;term&gt;Options&lt;/term&gt;
      &lt;listitem&gt;
        &lt;table id="table-</xsl:text>
          <xsl:value-of select="name" />
          <xsl:text disable-output-escaping="yes">-options"&lt;
          &lt;title&gt;Options&lt;/title&gt;
          &lt;tgroup cols="3"&gt;
            &lt;thead&gt;
              &lt;row&gt;
                &lt;entry&gt;Name&lt;/entry&gt;
                &lt;entry&gt;Required?&lt;/entry&gt;
                &lt;entry&gt;Description&lt;/entry&gt;
              &lt;/row&gt;
            &lt;/thead&gt;
            &lt;tbody&gt;
              &lt;row&gt;
                &lt;entry&gt;
                  &lt;para&gt;
                    &lt;parameter&gt;</xsl:text>
          <xsl:value-of select="options/parameter/keyword" />
          <xsl:text disable-output-escaping="yes">&lt;/parameter&gt;
                    &lt;replaceable&gt;</xsl:text>
          <xsl:value-of select="options/parameter/value" />
          <xsl:text disable-output-escaping="yes">&lt;/replaceable&gt;
                  &lt;/para&gt;
                &lt;/entry&gt;
                &lt;entry&gt;&lt;para&gt;</xsl:text>
          <xsl:value-of select="options/parameter/@requirement" />
          <xsl:text disable-output-escaping="yes">&lt;/para&gt;&lt;/entry&gt;
                &lt;entry&gt;
                  &lt;para&gt;</xsl:text>
          <xsl:value-of select="options/parameter/description" />
          <xsl:text disable-output-escaping="yes">              &lt;/para&gt;
                &lt;/entry&gt;
              &lt;/row&gt;
            &lt;/tbody&gt;
          &lt;/tgroup&gt;
        &lt;/table&gt;
      &lt;/listitem&gt;
    &lt;/varlistentry&gt;</xsl:text>


    <!-- Outputs the Availability section 
      -->
    <xsl:text disable-output-escaping="yes">

    &lt;varlistentry&gt;
      &lt;term&gt;Availability&lt;/term&gt;
      &lt;listitem&gt;
        &lt;para&gt;
          Available from libvirt </xsl:text>
    <xsl:value-of select="availability/@version" />
    <xsl:text disable-output-escaping="yes"> onwards
        &lt;/para&gt;
      &lt;/listitem&gt;
    &lt;/varlistentry&gt;</xsl:text>


    <!-- Outputs the Platform or Hypervisor specific notes section 
      -->
    <xsl:choose>
      <xsl:when test="notes = ''">
        <xsl:text disable-output-escaping="yes">

    &lt;varlistentry&gt;
      &lt;term&gt;Platform or Hypervisor specific notes&lt;/term&gt;
      &lt;listitem&gt;
        &lt;para&gt;
          &lt;emphasis&gt;None yet&lt;/emphasis&gt;
        &lt;/para&gt;
      &lt;/listitem&gt;
    &lt;/varlistentry&gt;</xsl:text>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="notes" />
      </xsl:otherwise>
    </xsl:choose>


    <!-- Outputs the Usage Example sections -->
<xsl:message>
  WARNING - Text formatting of the examples sections doesn't yet work, so
  the results could be pretty bad.
</xsl:message>
    <xsl:text disable-output-escaping="yes">

    &lt;varlistentry&gt;
      &lt;term&gt;Examples&lt;/term&gt;</xsl:text>

      <!-- Loops around, creating each example -->

<!-- NOTE - this loop doesn't work properly, as it has no idea how to
            handle the formatting tags -->
      <xsl:for-each select="usageexamples/example">
        <xsl:text disable-output-escaping="yes">
&lt;para&gt;</xsl:text>

<!-- 
        <xsl:template match="*">
        </xsl:template>
 -->

<!-- 
  <xsl:template match="/api">
    <book title="{@name} Reference Manual" link="index.html" author="" name="{@name}">
      <xsl:apply-templates select="files"/>
      <xsl:apply-templates select="symbols"/>
    </book>
    <xsl:call-template name="generate_index"/>
    <xsl:call-template name="generate_general"/>
  </xsl:template>
  <xsl:template match="/api/files">
    <chapters>
      <sub name="API" link="general.html">
        <xsl:apply-templates select="file"/>
      </sub>
    </chapters>
  </xsl:template>
 -->

<xsl:value-of select="self::*" />

        <xsl:text disable-output-escaping="yes">
&lt;/para&gt;</xsl:text>
      </xsl:for-each>

    <xsl:text disable-output-escaping="yes">
    &lt;/varlistentry&gt;</xsl:text>


    <!-- Create the full context example -->

<!-- NOTE - this loop doesn't work properly, as it has no idea how to
            handle the formatting tags -->

    <xsl:text disable-output-escaping="yes">

    &lt;varlistentry&gt;
      &lt;term&gt;Example in context&lt;/term&gt;
      &lt;listitem&gt;</xsl:text>
    <xsl:text disable-output-escaping="yes">
&lt;para&gt;</xsl:text>
    <xsl:value-of select="fullcontextexample" />
    <xsl:text disable-output-escaping="yes">
&lt;/para&gt;</xsl:text>
    <xsl:text disable-output-escaping="yes">
      &lt;/listitem&gt;
    &lt;/varlistentry&gt;
    </xsl:text>

    <!-- Create the See also section -->
    <xsl:text disable-output-escaping="yes">

    &lt;varlistentry&gt;
      &lt;term&gt;See also&lt;/term&gt;
      &lt;listitem&gt;
        &lt;itemizedlist&gt;</xsl:text>
    <xsl:for-each select="seealso/item">
      <xsl:text disable-output-escaping="yes">
          &lt;listitem&gt;
            &lt;para&gt;
      </xsl:text>
      <xsl:choose>
        <xsl:when test="link/@type = 'internal'">
          <xsl:text disable-output-escaping="yes">        &lt;xref linkend="sect-</xsl:text>
          <xsl:value-of select="link/@href" disable-output-escaping="yes" />
          <xsl:text disable-output-escaping="yes">" /&gt; - </xsl:text>
          <xsl:value-of select="description" disable-output-escaping="yes" />
        </xsl:when>
        <xsl:otherwise>
          External link goes here
        </xsl:otherwise>
      </xsl:choose>
      <xsl:text disable-output-escaping="yes">
            &lt;/para&gt;
          &lt;/listitem&gt;
      </xsl:text>
      <xsl:text disable-output-escaping="yes">
          &lt;/listitem&gt;</xsl:text>
    </xsl:for-each>
    <xsl:text disable-output-escaping="yes">
        &lt;/itemizedlist&gt;
      &lt;/listitem&gt;
    &lt;/varlistentry&gt;
    </xsl:text>


    <!-- End the DocBook variable list, used to divide the page sections
      -->
    <xsl:text disable-output-escaping="yes">
    
  &lt;/variablelist&gt;</xsl:text>

    <!-- Finish the DocBook source  -->
    <xsl:text disable-output-escaping="yes">
&lt;/section&gt;</xsl:text>
    </xsl:for-each>
  </xsl:template>
</xsl:transform>