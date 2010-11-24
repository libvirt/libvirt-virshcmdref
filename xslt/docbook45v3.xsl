<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="1.0">

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


    <!-- Outputs the Availability section -->


    <!-- Outputs the Platform or Hypervisor specific notes section -->


    <!-- Outputs the Usage Example sections -->


    <!-- Create the full context example -->



    <!-- Create the See also section -->


    <!-- End the DocBook variable list, used to divide the page sections -->
    <xsl:text disable-output-escaping="yes">
    
  &lt;/variablelist&gt;</xsl:text>

    <!-- Finish the DocBook source  -->
    <xsl:text disable-output-escaping="yes">
&lt;/section&gt;</xsl:text>
    </xsl:for-each>
  </xsl:template>

  <xsl:template match="availability">
    <varlistentry>
      <term>Availability</term>
      <listitem>
        <para>Available from libvirt <xsl:value-of select="availability/@version" /> onwards</para>
      </listitem>
    </varlistentry>
  </xsl:template>

  <xml:template match="notes">
    <xsl:choose>
      <xsl:when test="notes = ''">
    <varlistentry>
      <term>Platform or Hypervisor specific notes</term>
      <listitem>
        <para>
          <emphasis>None yet</emphasis>
        </para>
      </listitem>
    </varlistentry>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="notes" />
      </xsl:otherwise>
    </xsl:choose>
  </xml:template>

  <xsl:template match="usageexamples">
    <varlistentry>
      <term>Examples</term>

      <!-- Loops around, creating each example -->
      <xsl:for-each select="usageexamples/example">
      <para>
        <xsl:apply-templates />
      </para>
      </xsl:for-each>

    </varlistentry>
  </xsl:template>

  <xsl:template match="fullcontextexample">
    <varlistentry>
      <term>Example in context</term>
      <listitem>
        <para>
        <xsl:apply-templates />
        </para>
      </listitem>
    </varlistentry>
  </xsl:template>

  <xsl:template match="seealso">
    <varlistentry>
      <term>See also</term>
      <listitem>
        <itemizedlist>
          <xsl:for-each select="seealso/item">
          <listitem>
            <para>
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
            </para>
          </listitem>
          </xsl:for-each>
        </itemizedlist>
      </listitem>
    </varlistentry>
  </xsl:template>

  <xsl:template match="terminal">
    <screen>
      <xsl:apply-templates />
    </screen>
  </xsl:template>

  <xsl:template match="bold">
    <emphasis role="strong">
      <xsl:value-of select="." />
    </emphasis>
  </xsl:template>


</xsl:stylesheet>
