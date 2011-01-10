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
      <xsl:apply-templates select="/command/description" />

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
      <xsl:apply-templates select="/command/examples[@type='usage']" />
      <xsl:apply-templates select="/command/examples[@type='fullcontext']" />
      <xsl:apply-templates select="/command/reference[@type='seealso']" />

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
      <xsl:choose>
        <xsl:when test=". = ''">
          <listitem>
            <para><emphasis>Needs to be written</emphasis></para>
          </listitem>
        </xsl:when>
        <xsl:otherwise>
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
                  <xsl:for-each select="parameter">
                    <row>
                      <entry>
                        <para>
                          <parameter>
                            <xsl:value-of select="keyword" />
                          </parameter>
                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
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
                          <xsl:apply-templates />
                        </xsl:for-each>
                      </entry>
                    </row>
                  </xsl:for-each>
                </tbody>
              </tgroup>
            <xsl:text disable-output-escaping="yes">&lt;/table&gt;</xsl:text>
          </listitem>
        </xsl:otherwise>
      </xsl:choose>
    </varlistentry>
  </xsl:template>

  <!-- Availability template -->
  <xsl:template match="availability">
    <varlistentry>
      <term>Availability</term>
      <listitem>
        <xsl:choose>
          <xsl:when test="@from = '0.0.0'">
            <para><emphasis>Needs to be written</emphasis></para>
          </xsl:when>
          <xsl:otherwise>
            <para>Available from libvirt <xsl:value-of select="@from" />
              <xsl:choose>
                <xsl:when test="@to">
                  to <xsl:value-of select="@to" />
                </xsl:when>
                <xsl:otherwise>
                  onwards
                </xsl:otherwise>
              </xsl:choose>
             </para>
             <xsl:if test="@previous-name">
               <para>
                 Prior to version <xsl:value-of select="@from" />, this
                 command was known as <emphasis role="strong">
                 <xsl:value-of select="@previous-name" /></emphasis>
               </para>
             </xsl:if>
           </xsl:otherwise>
         </xsl:choose>
      </listitem>
    </varlistentry>
  </xsl:template>

  <!-- Notes template -->
  <xsl:template match="notes">
    <varlistentry>
      <term>Platform or Hypervisor specific notes</term>
      <listitem>
        <xsl:choose>
          <xsl:when test=". = ''">
            <para>
              <emphasis>None yet</emphasis>
            </para>
          </xsl:when>
          <xsl:otherwise>
            <variablelist>
              <xsl:for-each select="note">
                <varlistentry>
                  <term><xsl:value-of select="@os" /></term>
                  <listitem>
                    <xsl:apply-templates />
                  </listitem>
                </varlistentry>
              </xsl:for-each>
            </variablelist>
          </xsl:otherwise>
        </xsl:choose>
      </listitem>
    </varlistentry>
  </xsl:template>

  <!-- Usage examples template -->
  <xsl:template match="examples[@type='usage']">
    <varlistentry>
      <term>Examples</term>
      <listitem>
        <xsl:choose>
          <xsl:when test=". = ''">
            <para><emphasis>Needs to be written</emphasis></para>
          </xsl:when>
          <xsl:otherwise>
            <xsl:for-each select="example">
              <xsl:apply-templates />
            </xsl:for-each>
          </xsl:otherwise>
        </xsl:choose>
      </listitem>
    </varlistentry>
  </xsl:template>

  <!-- Full context examples template -->
  <xsl:template match="examples[@type='fullcontext']">
    <varlistentry>
      <term>Example in context</term>
      <listitem>
        <xsl:choose>
          <xsl:when test=". = ''">
            <para><emphasis>Needs to be written</emphasis></para>
          </xsl:when>
          <xsl:otherwise>
            <xsl:for-each select="example">
              <xsl:apply-templates />
            </xsl:for-each>
          </xsl:otherwise>
        </xsl:choose>
      </listitem>
    </varlistentry>
  </xsl:template>

  <!-- See also template -->
  <xsl:template match="reference[@type='seealso']">
    <varlistentry>
      <term>See also</term>
      <listitem>
        <xsl:choose>
          <xsl:when test=". = ''">
            <para><emphasis>Needs to be written</emphasis></para>
          </xsl:when>
          <xsl:otherwise>
            <itemizedlist>
              <xsl:for-each select="item">
              <listitem>
                <para>
                  <xsl:apply-templates select="link" /> -
                  <xsl:apply-templates select="description" />
                </para>
              </listitem>
              </xsl:for-each>
            </itemizedlist>
          </xsl:otherwise>
        </xsl:choose>
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
  <xsl:template match="text">
    <para>
      <xsl:apply-templates />
    </para>
  </xsl:template>

  <!-- Tag template for value -->
  <xsl:template match="value">
    <emphasis><xsl:value-of select="." /></emphasis>
  </xsl:template>

</xsl:stylesheet>
