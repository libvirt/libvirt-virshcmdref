<?xml version='1.0' encoding='utf-8' ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="1.0">


  <!-- Main document template starts here -->
  <xsl:template match="/">

    <!-- Outputs the DocBook 4.5 header -->
    <xsl:text disable-output-escaping="yes">
&lt;!DOCTYPE chapter PUBLIC "-//OASIS//DTD DocBook XML V4.5//EN" "http://www.oasis-open.org/docbook/xml/4.5/docbookx.dtd" [
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
        <xsl:value-of select="/command/description" />
      </para>

      <!-- Begin the DocBook variable list dividing the page sections -->
      <variablelist>

      <!-- Applies the templates -->
      <xsl:call-template name="usage" match="/command/options" />
      <xsl:call-template name="options" />


      <!-- End the DocBook variable list, used to divide the page sections -->
      </variablelist>

    <!-- Finish the DocBook source  -->
    <xsl:text disable-output-escaping="yes">&lt;/section&gt;</xsl:text>

  </xsl:template>


  <!-- Usage -->

 
  <xsl:template name="usage">
    <varlistentry>
      <term>Usage</term>
      <listitem>
        <para>
          <command>
            <xsl:value-of select="/command/name" />
          </command>
          <parameter>
            <xsl:value-of select="/command/usage/parameter" />
          </parameter>
          <replaceable>
            <xsl:value-of select="/command/usage/value" />
          </replaceable>
        </para>
      </listitem>
    </varlistentry>
  </xsl:template>

  <xsl:template match="options" name="options">
    <varlistentry>
      <term>Options</term>
      <listitem>
        <xsl:text disable-output-escaping="yes">&lt;table id="table-</xsl:text>
          <xsl:value-of select="name" />
          <xsl:text disable-output-escaping="yes">-options"</xsl:text>
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
              <row>
                <entry>
                  <para>
                    <parameter>
                      <xsl:value-of select="options/parameter/keyword" />
                    </parameter>
                    <replaceable>
                      <xsl:value-of select="options/parameter/value" />
                    </replaceable>
                  </para>
                </entry>
                <entry>
                  <para>
                    <xsl:value-of select="options/parameter/@requirement" />
                  </para>
                </entry>
                <entry>
                  <para>
                    <xsl:value-of select="options/parameter/description" />
                  </para>
                </entry>
              </row>
            </tbody>
          </tgroup>
        <xsl:text disable-output-escaping="yes">&lt;/table&gt;</xsl:text>
      </listitem>
    </varlistentry>
  </xsl:template>
<!-- 

  <xsl:template match="availability" mode="availability">
    <varlistentry>
      <term>Availability</term>
      <listitem>
        <para>Available from libvirt <xsl:value-of select="availability/@version" /> onwards</para>
      </listitem>
    </varlistentry>
  </xsl:template>

  <xml:template match="notes" mode="notes">
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

  <xsl:template match="usageexamples" mode="usageexamples">
    <varlistentry>
      <term>Examples</term>
      <xsl:for-each select="usageexamples/example">
      <para>
        <xsl:apply-templates />
      </para>
      </xsl:for-each>

    </varlistentry>
  </xsl:template>

  <xsl:template match="fullcontextexample" mode="fullcontextexample">
    <varlistentry>
      <term>Example in context</term>
      <listitem>
        <para>
        <xsl:apply-templates />
        </para>
      </listitem>
    </varlistentry>
  </xsl:template>

  <xsl:template match="seealso" mode="seealso">
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
-->
  <!-- Tag for terminal/screen text -->
  <xsl:template match="terminal">
    <screen>
      <xsl:apply-templates />
    </screen>
  </xsl:template>

  <!-- Tag for bold text -->
  <xsl:template match="bold">
    <emphasis role="strong">
      <xsl:value-of select="." />
    </emphasis>
  </xsl:template>

</xsl:stylesheet>
