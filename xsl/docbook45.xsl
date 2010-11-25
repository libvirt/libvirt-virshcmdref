<?xml version='1.0' encoding='utf-8' ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="1.0">

 <!-- Indenting of the output is enabled -->
  <xsl:output method="xml" indent="yes" />

  <!-- Main document template -->
  <xsl:template match="/">

    <!-- Outputs the DocBook 4.5 header -->
    <xsl:text disable-output-escaping="yes">
&lt;!DOCTYPE section PUBLIC "-//OASIS//DTD DocBook XML V4.5//EN" "http://www.oasis-open.org/docbook/xml/4.5/docbookx.dtd" [
&lt;!ENTITY % BOOK_ENTITIES SYSTEM "Virsh_Command_Reference.ent"&gt;
%BOOK_ENTITIES;
]&gt;
</xsl:text>

      <!-- Outputs the top section header -->
      <xsl:text disable-output-escaping="yes">&lt;section id="sect-</xsl:text>
      <xsl:value-of select="/command/name" />
      <xsl:text disable-output-escaping="yes">" xreflabel="</xsl:text>
      <xsl:value-of select="/command/name" />
      <xsl:text disable-output-escaping="yes">"&gt;</xsl:text>

      <!-- Output the title element -->
      <title><xsl:value-of select="/command/name" /></title>

      <!-- Output the command description -->
      <para>
        <xsl:apply-templates select="/command/description" />
      </para>

      <!-- Begin the DocBook variable list dividing the page sections -->
      <variablelist>

      <!-- Output the command usage -->
      <varlistentry>
        <term>Usage</term>
        <listitem>
          <para>
            <command><xsl:value-of select="/command/name" /></command>
            <xsl:for-each select="/command/options/parameter">
              <parameter><xsl:value-of select="keyword" /></parameter>
              <replaceable><xsl:value-of select="value" /></replaceable>
            </xsl:for-each>
          </para>
        </listitem>
      </varlistentry>

      <!-- Applies the templates -->
      <xsl:apply-templates select="/command/options" />
      <xsl:apply-templates select="/command/availability" />
      <xsl:apply-templates select="/command/notes" />
      <xsl:apply-templates select="/command/usageexamples" />
      <xsl:apply-templates select="/command/fullcontextexample" />
      <xsl:apply-templates select="/command/seealso" />

      <!-- End the DocBook variable list, used to divide the page sections -->
      </variablelist>

    <!-- Finish the DocBook source  -->
    <xsl:text disable-output-escaping="yes">&lt;/section&gt;</xsl:text>

  <!-- End of the main template -->
  </xsl:template>

  <!-- Options template -->
  <xsl:template match="options">
    <varlistentry>
      <term>Options</term>
      <listitem>
        <xsl:text disable-output-escaping="yes">&lt;table id="table-</xsl:text>
          <xsl:value-of select="/command/name" />
          <xsl:text disable-output-escaping="yes">-options"&gt;</xsl:text>
          <title>Options</title>
          <tgroup cols="3">
            <thead>
              <row>
                <entry>Name</entry>
                <entry>Required?</entry>
                <entry>Description</entry>
              </row>
            </thead>
            <tbody>
              <xsl:for-each select="/command/options/parameter">
                <row>
                  <entry>
                    <para>
                      <parameter>
                        <xsl:value-of select="keyword" />
                      </parameter>
                      <xsl:text>&amp;nbsp;</xsl:text>
                      <replaceable>
                        <xsl:value-of select="value" />
                      </replaceable>
                    </para>
                  </entry>
                  <entry>
                    <para>
                      <xsl:value-of select="@requirement" />
                    </para>
                  </entry>
                  <entry>
                    <xsl:for-each select="description">
                      <para>
                        <xsl:apply-templates />
                      </para>
                    </xsl:for-each>
                  </entry>
                </row>
              </xsl:for-each>
            </tbody>
          </tgroup>
        <xsl:text disable-output-escaping="yes">&lt;/table&gt;</xsl:text>
      </listitem>
    </varlistentry>
  </xsl:template>

  <!-- Availability template -->
  <xsl:template match="availability">
    <varlistentry>
      <term>Availability</term>
      <listitem>
        <para>Available from libvirt <xsl:value-of select="/command/availability/@version" /> onwards</para>
      </listitem>
    </varlistentry>
  </xsl:template>

  <!-- Notes template -->
  <xsl:template match="notes">
    <xsl:choose>
      <xsl:when test="/command/notes = ''">
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
        <xsl:value-of select="/command/notes" />
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <!-- Usage examples template -->
  <xsl:template match="usageexamples">
    <varlistentry>
      <term>Examples</term>
      <listitem>
        <xsl:for-each select="/command/usageexamples/example">
          <para>
            <xsl:apply-templates />
          </para>
        </xsl:for-each>
      </listitem>
    </varlistentry>
  </xsl:template>

  <!-- Full context examples template -->
  <xsl:template match="fullcontextexample">
    <varlistentry>
      <term>Example in context</term>
      <listitem>
        <xsl:for-each select="/command/fullcontextexample/example">
          <para>
            <xsl:apply-templates />
          </para>
        </xsl:for-each>
      </listitem>
    </varlistentry>
  </xsl:template>

  <!-- See also template -->
  <xsl:template match="seealso">
    <varlistentry>
      <term>See also</term>
      <listitem>
        <itemizedlist>
          <xsl:for-each select="/command/seealso/item">
          <listitem>
            <para>
              <xsl:apply-templates select="link" /> -
              <xsl:apply-templates select="description" />
            </para>
          </listitem>
          </xsl:for-each>
        </itemizedlist>
      </listitem>
    </varlistentry>
  </xsl:template>

  <!-- Tag template for terminal/screen text -->
  <xsl:template match="terminal">
    <screen>
      <xsl:apply-templates />
    </screen>
  </xsl:template>

  <!-- Tag template for bold text -->
  <xsl:template match="bold">
    <emphasis role="strong">
      <xsl:apply-templates />
    </emphasis>
  </xsl:template>

  <!-- Tag template for bold italic text -->
  <xsl:template match="bolditalic">
    <emphasis role="strong"><emphasis>
      <xsl:apply-templates />
    </emphasis></emphasis>
  </xsl:template>

  <!-- Tag template for highlighted text -->
  <xsl:template match="highlight">
    <emphasis role="strong">&lt;-- <xsl:value-of select="." /></emphasis>
  </xsl:template>

  <!-- Tag template for italic text -->
  <xsl:template match="italic">
    <emphasis role="italic">
      <xsl:apply-templates />
    </emphasis>
  </xsl:template>

  <!-- Tag template for links -->
  <xsl:template match="link">
    <xsl:choose>
      <xsl:when test="@type = 'internal'">
        <xsl:text disable-output-escaping="yes">&lt;xref linkend="sect-</xsl:text>
        <xsl:value-of select="@href" disable-output-escaping="yes" />
        <xsl:text disable-output-escaping="yes">" /&gt;</xsl:text>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text disable-output-escaping="yes">&lt;ulink url="</xsl:text>
        <xsl:value-of select="@href" disable-output-escaping="yes" />
        <xsl:text disable-output-escaping="yes">"&gt;</xsl:text>
        <xsl:choose>
          <xsl:when test=".">
            <xsl:value-of select="." disable-output-escaping="yes" />
            <xsl:text disable-output-escaping="yes">&lt;/ulink&gt;</xsl:text>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="@href" disable-output-escaping="yes" />
            <xsl:text disable-output-escaping="yes">&lt;/ulink&gt;</xsl:text>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <!-- Tag template for para -->
  <xsl:template match="para">
    <para>
      <xsl:apply-templates />
    </para>
  </xsl:template>

  <!-- Tag template for value -->
  <xsl:template match="value">
    <emphasis><xsl:value-of select="." /></emphasis>
  </xsl:template>

</xsl:stylesheet>